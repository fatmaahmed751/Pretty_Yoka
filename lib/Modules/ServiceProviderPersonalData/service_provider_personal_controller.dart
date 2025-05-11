import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Models/user_model.dart';
import '../../Utilities/shared_preferences.dart';
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

  late TextEditingController nameController;
  dynamic image;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    nameController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
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