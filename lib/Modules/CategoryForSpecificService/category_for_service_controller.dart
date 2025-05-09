import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/dialog_helper.dart';


class CategoryForServicesController extends ControllerMVC {
  // singleton
  factory CategoryForServicesController() {
    _this ??= CategoryForServicesController._();
    return _this!;
  }

  static CategoryForServicesController? _this;

  CategoryForServicesController._();

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