import 'package:Pretty/Modules/ResetPassword/widget/verify_password_otp.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Utilities/strings.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../Utilities/validate.dart';
import '../../../Widgets/custom_button_widget.dart';
import '../../../Widgets/custom_textfield_widget.dart';
import '../../../Widgets/loading_screen.dart';
import '../../Utilities/shared_preferences.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/custom_main_side_text_widget.dart';
import '../../Widgets/custom_main_text_widget.dart';
import '../../Widgets/custom_side_text_widget.dart';
import '../../generated/assets.dart';
import 'forget_password_controller.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const routeName = "forgetPassword";
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends StateMVC<ForgetPasswordScreen> {
  _ForgetPasswordScreenState() : super(ForgetPasswordController()) {
    con = ForgetPasswordController();
  }
  late ForgetPasswordController con;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    con = ForgetPasswordController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  resizeToAvoidBottomInset: false,
      backgroundColor: ThemeClass.of(context).background,
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
              child:
                  ListView(physics: const BouncingScrollPhysics(), children: [
                Gap(12.h),
                CustomAppBarWidget.mainScreen(
                  title: Strings.forgetPasswordTitle.tr,
                  space: 70.w,
                ),
                    Gap(24.h),
                    SizedBox(
                      // width: 265.w,
                      height: 53.h,
                      child: Text(Strings.resetYourPasswordEasily.tr,
                          textAlign: TextAlign.start,
                          style: TextStyleHelper.of(context).b_16.copyWith(
                              color: ThemeClass.of(context).labelColor)),
                    ),
                    Gap(12.h),
                    CustomMainSideTextWidget(
                      text: Strings.phone.tr,
                    ),
                    Gap(8.h),
                    CustomTextFieldWidget(
                      hint: Strings.phoneHint.tr,
                      textInputType: TextInputType.phone,
                      hintStyle: TextStyle(
                          color: ThemeClass.of(context).labelColor,
                          height: 1.h),
                      backGroundColor:
                      ThemeClass.of(context).background,
                      prefixIcon:
                      SvgPicture.asset(Assets.imagesPhoneIcon),
                      isDense: true,
                      controller: con.phoneController,
                      validator: (v) =>
                          Validate.validatePhoneOptional(v),
                    ),
                    Gap(24.h),
                    CustomButtonWidget.primary(
                        height: 40.h,
                        radius: 12.r,
                        title: Strings.sendCode.tr,
                        onTap: () {
                          GoRouter.of(context).pushNamed(VerificationNewPasswordForUserScreen.routeName);
                          // if (_formKey.currentState?.validate() ??
                          //     false) {
                          //   // con.onLogin();
                          // } else {
                          //   setState(() {
                          //     con.autoValidate = true;
                          //   });
                          // }
                        }),
              ]
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
