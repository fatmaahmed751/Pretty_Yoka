import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/dialog_helper.dart';


class AllServicesController extends ControllerMVC {
  // singleton
  factory AllServicesController() {
    _this ??= AllServicesController._();
    return _this!;
  }

  static AllServicesController? _this;

  AllServicesController._();

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