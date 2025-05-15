import 'dart:convert';
import 'dart:io';

import 'package:Pretty/core/Language/locales.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Models/user_model.dart';
import '../../Utilities/shared_preferences.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/theme_helper.dart';
import '../../generated/assets.dart';

class ServiceProviderPersonalDataController extends ControllerMVC {
  // singleton
  factory ServiceProviderPersonalDataController() {
    _this ??= ServiceProviderPersonalDataController._();
    return _this!;
  }

  static ServiceProviderPersonalDataController? _this;

  ServiceProviderPersonalDataController._();

  bool loading = false,
      autoValidate = false;

  late TextEditingController nameController,locationController,
      areaController,writeYourBio;
  String? area;
  bool showDropdown = false;
  dynamic image;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    nameController = TextEditingController();
    locationController = TextEditingController();
    areaController = TextEditingController();
    writeYourBio = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    areaController.dispose();
    writeYourBio.dispose();
    super.dispose();
  }

  final List<String> items = [
    Strings.zamalek.tr,
    Strings.downTown.tr,
    Strings.gardenCity.tr,

  ];
  void showAreaPopUpMenu(BuildContext context) {
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
                            area = item;
                            areaController .text = item;
                          });
                          overlayEntry?.remove();
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsetsDirectional.symmetric(
                              vertical: 12.h, horizontal: 16.w),
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
  init() {
    loadUserImage();
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
      return AssetImage(Assets.imagesUserDefaultImage);
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
}