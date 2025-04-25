import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class UserLoginController extends ControllerMVC {
  // singleton
  factory UserLoginController() {
    _this ??= UserLoginController._();
    return _this!;
  }

  static UserLoginController? _this;

  UserLoginController._();

  bool loading = false,
      autoValidate = false;
  late TextEditingController
  phoneController,
      passwordController,
      confirmPasswordController;
  bool isPassword = true;
  bool isConfirmPassword = true;


  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}