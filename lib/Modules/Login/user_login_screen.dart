import 'package:Pretty/Modules/ForgetPassword/forget_password_screen.dart';
import 'package:Pretty/Modules/Login/user_login_controller.dart';
import 'package:Pretty/Modules/UserSignUp/user_sign_up_controller.dart';
import 'package:Pretty/Modules/VerificationAccountOtp/verification_otp_screen.dart';
import 'package:Pretty/Utilities/text_style_helper.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/strings.dart';
import '../../Utilities/theme_helper.dart';
import '../../Utilities/validate.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/custom_main_side_text_widget.dart';
import '../../Widgets/custom_textfield_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../../Widgets/raw_or_widget.dart';
import '../../Widgets/user_status_row.dart';
import '../../generated/assets.dart';

class UserLoginScreen extends StatefulWidget {
  static const routeName = "UserLogin";
  const UserLoginScreen({super.key});

  @override
  createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends StateMVC<UserLoginScreen> {
  _UserLoginScreenState() : super(UserLoginController()) {
    con = UserLoginController();
  }

  late UserLoginController con;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBarWidget.mainScreen(title: Strings.signUp.tr),
      backgroundColor: ThemeClass.of(context).background,
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Form(
            key: _formKey,
            autovalidateMode: con.autoValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
              child:
              ListView(physics: const BouncingScrollPhysics(), children: [
                Gap(12.h),
                CustomAppBarWidget.mainScreen(
                  title: Strings.login.tr,
                  space: 120.w,
                ),
                Gap(24.h),
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
                Gap(12.h),
                CustomMainSideTextWidget(
                  text: Strings.password.tr,
                ),
                Gap(8.h),
                CustomTextFieldWidget(
                  // minLines: 1,
                  maxLine: 1,
                  // hintStyle: TextStyle(
                  //     color: ThemeClass.of(context).labelColor,
                  //     height: 1.h),
                  backGroundColor:
                  ThemeClass.of(context).background,
                  obscure: con.isPassword,
                  focusedBorderColor:
                  ThemeClass.of(context).primaryColor,
                  hint: Strings.enterPassword.tr,
                  prefixIcon:
                  SvgPicture.asset(Assets.imagesLockIcon),
                  suffixIcon: con.isPassword
                      ? SvgPicture.asset(Assets.imagesObsecure)
                      : SvgPicture.asset(Assets.imagesOpenEye),
                  onSuffixTap: () {
                    setState(() {
                      con.isPassword = !con.isPassword;
                    });
                  },
                  //  isDense: true,
                  // insidePadding:
                  // EdgeInsets.symmetric(vertical: 10.h),
                  controller: con.passwordController,
                  validator: (v) =>
                      Validate.validatePassword(v),
                ),
                Gap(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // context.pushNamed(
                        //     ForgetPasswordScreen.routeName);
                      },
                      child: Text(
                        Strings.forgetPassword.tr,
                        textAlign: TextAlign.left,
                        style: TextStyleHelper.of(context)
                            .h_13
                            .copyWith(
                            color: ThemeClass.of(context)
                                .primaryColor),
                      ),
                    ),
                  ],
                ),
                Gap(16.h),
                CustomButtonWidget.primary(
                    height: 40.h,
                    radius: 12.r,
                    title: Strings.login.tr,
                    onTap: () {
                      GoRouter.of(context).pushNamed(ForgetPasswordScreen.routeName);
                      // if (_formKey.currentState?.validate() ??
                      //     false) {
                      //   // con.onLogin();
                      // } else {
                      //   setState(() {
                      //     con.autoValidate = true;
                      //   });
                      // }
                    }),
                Gap(12.h),
                UserStatusRow(
                  text: Strings.noHavenAccount.tr,
                  nextText: Strings.signUp.tr,
                  onNextTextTap: () {},
                ),
                Gap(12.h),
                const RowOrWidget(),
                Gap(12.h),
                Row(
                  children: [
                    DifferentSignUpWidget(
                      image: Assets.imagesGoogleIcon,
                      text: Strings.google.tr,
                    ),
                    Gap(12.w),
                    DifferentSignUpWidget(
                      image: Assets.imagesAppleIcon,
                      text: Strings.apple.tr,
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class DifferentSignUpWidget extends StatelessWidget {
  final String image;
  final String text;


  const DifferentSignUpWidget({
    super.key, required this.image, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157.5.w,
      height: 48.h,
      decoration: BoxDecoration(
        border: Border.all(color: ThemeClass.of(context).success),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SvgPicture.asset(image),
          Gap(8.w),
          Padding(
            padding:  EdgeInsets.only(top: 8.h),
            child: Text(text,
              style: TextStyleHelper.of(context).h_15,),
          )
        ],
      ),
    );
  }
}
