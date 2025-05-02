import 'package:Pretty/Modules/Home/home_screen.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Widgets/loading_screen.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/theme_helper.dart';
import '../../Utilities/validate.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/custom_main_side_text_widget.dart';
import '../../Widgets/custom_textfield_widget.dart';
import '../../generated/assets.dart';
import 'reset_password_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = "ResetPassword";
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends StateMVC<ResetPasswordScreen> {
  _ResetPasswordScreenState() : super(ResetPasswordController()) {
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
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Gap(12.h),
                CustomAppBarWidget.mainScreen(
                  title: Strings.newPassword.tr,
                  space: 70.w,
                ),
                Gap(24.h),
                CustomMainSideTextWidget(
                  text: Strings.newPassword.tr,
                ),
                CustomTextFieldWidget(
                  hint: Strings.enterPassword.tr,
                  textInputType: TextInputType.visiblePassword,
                  suffixIcon: con.isPassword
                      ? SvgPicture.asset(Assets.imagesObsecure)
                      : SvgPicture.asset(Assets.imagesOpenEye),
                  onSuffixTap: () {
                    setState(() {
                      con.isPassword = !con.isPassword;
                    });
                  },

                  backGroundColor:
                  ThemeClass.of(context).background,
                  prefixIcon: SvgPicture.asset(Assets.imagesLockIcon),
                  isDense: true,
                  insidePadding:
                  EdgeInsets.symmetric(vertical: 10.h),
                  controller: con.newPasswordController,
                  validator: (v) => Validate.validatePassword(v),
                ),
                Gap(12.h),
                CustomMainSideTextWidget(
                    text: Strings.repeatPassword.tr),
                Gap(8.h),
                CustomTextFieldWidget(
                  hint: Strings.enterPassword.tr,
                  textInputType: TextInputType.visiblePassword,
                  suffixIcon: con.isPassword
                      ? SvgPicture.asset(Assets.imagesObsecure)
                      : SvgPicture.asset(Assets.imagesOpenEye),
                  onSuffixTap: () {
                    setState(() {
                      con.isPassword = !con.isPassword;
                    });
                  },
                  backGroundColor:
                  ThemeClass.of(context).background,
                  prefixIcon:
                  SvgPicture.asset(Assets.imagesUserIcon),
                  isDense: true,
                  insidePadding:
                  EdgeInsets.symmetric(vertical: 10.h),
                  controller: con.confirmNewPasswordController,
                  validator: (v) => Validate.validateConfPassword(
                      newPassword: con.newPasswordController.text,
                      confPassword:
                      con.confirmNewPasswordController.text),
                ),
                Gap(16.h),
                CustomButtonWidget.primary(
                    height: 40.h,
                    radius: 12.r,
                    title: Strings.login.tr,
                    onTap: () {
                      GoRouter.of(context).pushNamed(HomeScreen.routeName);
                      // if (_formKey.currentState?.validate() ??
                      //     false) {
                      //   // con.onLogin();
                      // } else {
                      //   setState(() {
                      //     con.autoValidate = true;
                      //   });
                      // }
                    }),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
