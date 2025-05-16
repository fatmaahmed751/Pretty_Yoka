import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';
import '../../Widgets/toast_helper.dart';
import '../ResetPassword/widget/verify_password_otp.dart';

class VerificationProviderOtpController extends ControllerMVC {
  // singleton
  factory VerificationProviderOtpController() {
    _this ??= VerificationProviderOtpController._();
    return _this!;
  }

  static VerificationProviderOtpController? _this;

  VerificationProviderOtpController._() {
    print("VerificationProviderOtpController: Created");
    pinController = TextEditingController();
    focusNode = FocusNode();
    smsRetriever = SmsRetrieverImpl(
        SmartAuth());
  }

  bool loading = false,
      autoValidate = false;
  late final SmsRetriever smsRetriever;
  late TextEditingController pinController;
  late TextEditingController phoneController;
  late  FocusNode focusNode;
  int? userId;
  bool isUser =false;
  bool isDisposed=false;

  @override
  void initState() {
    print("VerificationOtpController: Created");
    phoneController = TextEditingController();
    pinController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    if (!isDisposed) {
      print("VerificationOtpController: Disposing controllers");
      pinController.dispose();
      focusNode.dispose();
      phoneController.dispose();
      isDisposed = true;
    }
    super.dispose();
  }

  void setUserId(int userId) {
    this.userId = userId;
  }
  void verifyCode(String code, String inputCode) {
    if (code == inputCode) {
      print('Verification successful');
    } else {
      print('Verification failed');
    }
  }

  resendVerifyAccountCode(BuildContext context) async {
    if (userId == null) {
    //  userId = SharedPref.getCurrentUser()?.user?.id; // Attempt to fetch from SharedPref
      if (userId == null) {
        print('User ID is missing');
        ToastHelper.showError(message: "User ID is required for verification.", context: context);
        return;
      }
    }
    setState(() {
      loading = false;
    });
  }
}

