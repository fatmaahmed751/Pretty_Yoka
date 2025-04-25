import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/dialog_helper.dart';
import '../../Utilities/strings.dart';
import '../../Widgets/toast_helper.dart';
import '../VerificationAccountOtp/verification_otp_screen.dart';

class ForgetPasswordController extends ControllerMVC {
  // singleton
  factory ForgetPasswordController() {
    _this ??= ForgetPasswordController._();
    return _this!;
  }
  static ForgetPasswordController? _this;
  ForgetPasswordController._();
  bool loading=false,autoValidate = false;
  late TextEditingController phoneController;

  @override
  void initState() {
    phoneController=TextEditingController();

    super.initState();
  }
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
  sendOtp(BuildContext context ) async {
    setState(() {
      loading = true;
    });
    if (phoneController.text.isEmpty) {
      print("Error: phone is null");
      ToastHelper.showError(message: "phone is missing.", context: context);
      return;
    }else{
      GoRouter.of(context).pushNamed(VerificationUserScreen.routeName);
    }
    setState(() {
      loading = false;
    });
  }
}
