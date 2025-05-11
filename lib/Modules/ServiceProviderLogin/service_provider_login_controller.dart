import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ServiceProviderLoginController extends ControllerMVC {
  // singleton
  factory ServiceProviderLoginController() {
    _this ??= ServiceProviderLoginController._();
    return _this!;
  }

  static ServiceProviderLoginController? _this;

  ServiceProviderLoginController._();

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