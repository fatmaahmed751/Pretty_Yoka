import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';
import '../VerificationAccountOtp/verification_otp_screen.dart';

class ResetPasswordController extends ControllerMVC {
  // singleton
  factory ResetPasswordController() {
    _this ??= ResetPasswordController._();
    return _this!;
  }
  static ResetPasswordController? _this;
  ResetPasswordController._();
  bool loading = false, autoValidate = false;
  late TextEditingController newPasswordController,
      confirmNewPasswordController;
  late SmsRetriever smsRetriever;
  late TextEditingController pinController;
  late FocusNode focusNode;
  String? email;
  int? userId;
  bool isPassword = true;
  bool repeatPassword = true;

  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
    pinController = TextEditingController();
    focusNode = FocusNode();
    smsRetriever = SmsRetrieverImpl(SmartAuth());
    userId =1;
    String? email;
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void verifyCode(String code, String inputCode) {
    if (code == inputCode) {
      print('Verification successful');
    } else {
      print('Verification failed');
    }
  }



  verifyCodeForNewPassword() async {
    setState(() {
      loading = true;
    });

    setState(() {
      loading = false;
    });
  }

  getNewPassword() async {
    setState(() {
      loading = true;
    });


    setState(() {
      loading = false;
    });
  }

}
