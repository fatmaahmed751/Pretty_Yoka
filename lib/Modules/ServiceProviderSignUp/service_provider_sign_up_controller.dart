import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/dialog_helper.dart';
import '../../Widgets/toast_helper.dart';

class ServiceProviderSignUpController extends ControllerMVC {
  // singleton
  factory ServiceProviderSignUpController() {
    _this ??= ServiceProviderSignUpController._();
    return _this!;
  }

  static ServiceProviderSignUpController? _this;

  ServiceProviderSignUpController._();

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


  void verifyCode(String code, String inputCode) {
    if (code == inputCode) {
      print('Verification successful');
    } else {
      print('Verification failed');
    }
  }

  userUserSignUp() async {
    setState(() {
      loading = true;
    });
  }

  getVerificationCode(BuildContext context) async {
    setState(() {
      loading = true;
    });
    if (phoneController.text.isEmpty) {
      print("Error: phone is null");
      ToastHelper.showError(message: "phone is missing.", context: context);
      return;
    } else {
      // DialogHelper.custom(context: context).customDialog(
      //     dialogWidget: VerificationOtpScreen(
      //       onSuccess: () {
      //         //GoRouter.of(context).pushNamed(FilledInformationScreen.routeName);
      //       },
      //       verificationId: emailController.text,
      //       onVerify: (otp ) async {
      //         try {
      //         } catch (e) {
      //         }
      //       },
      //       description: Strings.verificationAccountCode.tr,)
      // );

      setState(() {
        loading = false;
      });
    }
  }
}
