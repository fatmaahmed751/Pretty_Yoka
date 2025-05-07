import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Models/user_model.dart';
import '../../../Utilities/shared_preferences.dart';
import '../../../generated/assets.dart';
import '../../Utilities/theme_helper.dart';

class EditProfileController extends ControllerMVC {
  // singleton
  factory EditProfileController() {
    _this ??= EditProfileController._();
    return _this!;
  }

  static EditProfileController? _this;

  EditProfileController._();

  bool loading = false, autoValidate = false;
  TextEditingController? _allergiesTypeController;
  TextEditingController get allergiesTypeController =>
      _allergiesTypeController ??= TextEditingController();
  late TextEditingController nameController,
      phoneController,
      addressController,
      emailController,
      medicalConditionController,
      locationController,
      weightController,
      dateController,
      heightController;
    //  allergiesTypeController;
  dynamic image;
  final ImagePicker picker = ImagePicker();
  final TextEditingController selectController = TextEditingController();
 // final TextEditingController allergiesTypeController = TextEditingController();
  final List<String> items = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedBloodType;
  int selectedGender = 1;
  int selectedAllergies = 1;
  bool isDisposed=false;

  @override
  void initState() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();
    medicalConditionController = TextEditingController();
    locationController = TextEditingController();
    weightController = TextEditingController();
    heightController = TextEditingController();
    dateController = TextEditingController();
    super.initState();
  }

  init() {
    loadUserImage();
  }

  @override
  void dispose() {
    if (!isDisposed) {
      nameController.dispose();
      phoneController.dispose();
      addressController.dispose();
      emailController.dispose();
      medicalConditionController.dispose();
      locationController.dispose();
      weightController.dispose();
      heightController.dispose();
      _allergiesTypeController?.dispose();
      dateController.dispose();
      isDisposed = true;
    }
    super.dispose();
  }

  void updateSelectedAllergies(int value) {
    selectedAllergies = value;
    notifyListeners();
  }

  Future<void> loadUserImage() async {
    setState(() {
      loading = true;
    });
    String? userImagePath = await SharedPref
        .getCurrentUserImage();
    setState(() {
      image =
          userImagePath != null ? File(userImagePath) : null; // Convert to File
      loading = false;
    });
  }

  ImageProvider buildImageProvider(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return const AssetImage(Assets.imagesUserDefaultImage);
    }
    final file = File(imagePath);
    if (file.existsSync()) {
      return FileImage(file); // Return the FileImage if the file exists
    }
    if (Uri.tryParse(imagePath)?.hasAbsolutePath ?? false) {
      return CachedNetworkImageProvider(imagePath);
    } else {
      return const AssetImage(Assets.imagesUserDefaultImage);
    }
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    try {
      if (pickedFile != null) {
        final imagePath = pickedFile.path;
        setState(() {
          image = File(imagePath);
        });
        UserModel? currentUser = SharedPref.getCurrentUser();
        await SharedPref.saveCurrentUser(user: currentUser!);
        await SharedPref.saveCurrentUserImage(image);

        // print(pickedFile.path);
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<String> encodeImageToBase64(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    return base64Encode(imageBytes);
  }
  void showCustomPopupMenu(BuildContext context) {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      return;
    }
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                overlayEntry?.remove();
              },
              child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            // Positioned menu
            Positioned(
              left: offset.dx,
              top: offset.dy + renderBox.size.height,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                  width: renderBox.size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: items.map((String item) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedBloodType = item;
                            selectController.text = item;
                          });
                          overlayEntry?.remove();
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsetsDirectional.symmetric(vertical: 12.h, horizontal: 16.w),
                          child: Text(
                            item,
                            style: TextStyle(
                              color: ThemeClass.of(context).mainBlack,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
    overlayState.insert(overlayEntry);
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: ThemeClass.of(context).primaryColor, // Header background color
              onPrimary: Colors.white, // Header text color
              surface: ThemeClass.of(context).background, // Background color of the calendar
              onSurface: Colors.black, // Text color of the calendar
            ),
            dialogBackgroundColor: Colors.white, // Background color of the dialog
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {
        dateController.text = formattedDate;
      });
    }
  }
}
