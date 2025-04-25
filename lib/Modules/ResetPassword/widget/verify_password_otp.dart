import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';
import '../../../Utilities/strings.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../Widgets/custom_button_widget.dart';
import '../../../Widgets/custom_main_text_widget.dart';
import '../../../Widgets/loading_screen.dart';
import '../../../generated/assets.dart';
import '../reset_password_controller.dart';
import '../reset_password_screen.dart';

class VerificationNewPasswordForUserScreen extends StatefulWidget {
  static const routeName = "verifyNewPasswordUser";


  const VerificationNewPasswordForUserScreen({Key? key})
      : super(key: key);

  @override
  createState() => VerificationNewPasswordForUserScreenState();
}

class VerificationNewPasswordForUserScreenState
    extends StateMVC<VerificationNewPasswordForUserScreen> {
  VerificationNewPasswordForUserScreenState() : super(ResetPasswordController()) {
    con = ResetPasswordController();
  }
  late ResetPasswordController con;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Color focusedBorderColor = ThemeClass.of(context).secondary;
    //Color fillColor = ThemeClass.of(context).secondary;
    Color borderColor = ThemeClass.of(context).secondary;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 22,
        color: ThemeClass.of(context).mainBlack,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
        body: SafeArea(
          child: LoadingScreen(
            loading: con.loading,
            child: Form(
              key: formKey,
              autovalidateMode: con.autoValidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // physics: const BouncingScrollPhysics(),
                  children: [
                    Gap(24.h),
                    Center(
                        child: CustomMainTextWidget(
                          text: Strings.verify.tr,
                        )),
                    Gap(24.h),
                    SizedBox(
                      // width: 265.w,
                      height: 53.h,
                      child: Text(Strings.verificationAccountCode.tr,
                          textAlign: TextAlign.start,
                          style: TextStyleHelper.of(context).b_16.copyWith(
                              color: ThemeClass.of(context).labelColor)),
                    ),
                    Gap(12.h),
                    Text(
                      Strings.code.tr,
                      style: TextStyleHelper.of(context)
                          .h_15
                          .copyWith(color: ThemeClass.of(context).secondaryBlackColor),
                    ),
                    Gap(8.h),
                    Center(
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          length: 4,
                          smsRetriever: con.smsRetriever,
                          controller: con.pinController,
                          focusNode: con.focusNode,
                          defaultPinTheme: PinTheme(
                            width: 75.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                              color: ThemeClass.of(context).mainSecondary,
                              borderRadius: BorderRadius.circular(12.r),

                            ),
                            textStyle: TextStyleHelper.of(context).b_14.copyWith(
                                color:
                                ThemeClass.of(context).labelColor),
                          ),
                          separatorBuilder: (index) => const SizedBox(width: 8),
                          validator: (value) {
                            return value == con.pinController.text
                                ? null
                                : 'Pin is incorrect';
                          },
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          onCompleted: (pin) {
                            debugPrint('onCompleted: $pin');
                          },
                          onChanged: (value) {
                            debugPrint('onChanged: $value');
                            con.verifyCode(value, con.pinController.text);
                          },
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: ThemeClass.of(context).primaryColor,
                              ),
                            ),
                          ),
                          errorPinTheme: defaultPinTheme.copyBorderWith(
                            border: Border.all(color: Colors.redAccent),
                          ),
                        ),
                      ),
                    ),
                    Gap(24.h),
                    Center(
                      child: CustomButtonWidget.primary(
                          radius: 12.r,
                          height: 40.h,
                          // width: 265.w,
                          title: Strings.confirmVerify.tr,
                          onTap: () {
                            GoRouter.of(context).pushNamed(ResetPasswordScreen.routeName);
                            //   if (formKey.currentState?.validate() ?? false) {
                            //     Future.delayed(const Duration(seconds: 1), () {});
                            //   } else {
                            //     setState(() {
                            //       con.autoValidate = true;
                            //     });
                            //   }
                          }),
                    ),
                    Gap(12.h),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}

class SmsRetrieverImpl implements SmsRetriever {
  const SmsRetrieverImpl(this.smartAuth);

  final SmartAuth smartAuth;

  @override
  Future<void> dispose() {
    return smartAuth.removeSmsListener();
  }

//   @override
//   Future<String?> getSmsCode() async {
//     final signature = await smartAuth.getSmsCode();
//     debugPrint('App Signature: $signature');
//     final res = await smartAuth.getSmsCode();
//     if (res.succeed) {
//       debugPrint('SMS: ${res.code}');
//     } else {
//       debugPrint('SMS Failure:');
//     }
//     return null;
//   }
//
//   @override
//   bool get listenForMultipleSms => false;
// }
  @override
  Future<String?> getSmsCode() async {
    final signature = await smartAuth.getAppSignature();
    debugPrint('App Signature: $signature');
    final res = await smartAuth.getSmsCode(
      useUserConsentApi: true,
    );
    if (res.succeed && res.codeFound) {
      return res.code!;
    }
    return null;
  }

  @override
  bool get listenForMultipleSms => false;
}