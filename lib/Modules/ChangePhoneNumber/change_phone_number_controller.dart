import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Utilities/dialog_helper.dart';
import '../../../Utilities/strings.dart';
import '../../../Widgets/toast_helper.dart';

class ChangePhoneController extends ControllerMVC {
  // singleton
  factory ChangePhoneController() {
    _this ??= ChangePhoneController._();
    return _this!;
  }

  static ChangePhoneController? _this;

  ChangePhoneController._();

  bool loading = false,
      autoValidate = false;
  late TextEditingController phoneController,
  newPhoneNumber;
  @override
  void initState() {
    phoneController = TextEditingController();
    newPhoneNumber = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    newPhoneNumber.dispose();
    super.dispose();
  }

  // getChangePhoneNumberCode(BuildContext context ) async {
  //   setState(() {
  //     loading = true;
  //   });
  //   if (phoneController.text.isEmpty) {
  //     print("Error: phone  is null");
  //     ToastHelper.showError(message: "phone is missing.", context: context);
  //     return;
  //   }else{
  //     DialogHelper.custom(context: context).customDialog(
  //         dialogWidget: VerificationOtpWidget(
  //           onSuccess: () {
  //             GoRouter.of(context).pushNamed(HomeScreen.routeName);
  //           },
  //           verificationId: phoneController.text,
  //           onVerify: (otp ) async {
  //             try {
  //
  //             } catch (e) {
  //
  //             }
  //           },
  //           description: Strings.verificationAccountCode.tr,)
  //     );
  //   }
  //   setState(() {
  //     loading = false;
  //   });
  // }

}