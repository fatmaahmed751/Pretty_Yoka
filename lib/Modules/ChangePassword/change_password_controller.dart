import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ChangePasswordController extends ControllerMVC {
  // singleton
  factory ChangePasswordController() {
    _this ??= ChangePasswordController._();
    return _this!;
  }
  static ChangePasswordController? _this;
  ChangePasswordController._();
  bool loading=false,autoValidate = false;
  late TextEditingController newPasswordController;
  late TextEditingController oldPasswordController;
  late TextEditingController confirmNewPasswordController;
  bool isPassword = true;
  bool newPassword = true;
  bool repeatPassword = true;
  @override
  void initState() {
    newPasswordController=TextEditingController();
    oldPasswordController=TextEditingController();
    confirmNewPasswordController=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    newPasswordController.dispose();
    oldPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  onLogin()async{
    setState((){loading=true;});
    await Future.delayed(const Duration(seconds: 2));
    setState((){loading=false;});
  }
}
