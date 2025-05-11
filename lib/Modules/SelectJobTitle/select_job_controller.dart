import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Models/user_model.dart';
import '../../Utilities/shared_preferences.dart';
import '../../generated/assets.dart';

class SelectJobTitleController extends ControllerMVC {
  // singleton
  factory SelectJobTitleController() {
    _this ??= SelectJobTitleController._();
    return _this!;
  }

  static SelectJobTitleController? _this;

  SelectJobTitleController._();

  bool loading = false,
      autoValidate = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
