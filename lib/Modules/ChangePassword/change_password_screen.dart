import 'package:Pretty/Widgets/toast_helper.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../../Utilities/shared_preferences.dart';
import '../../../../Utilities/strings.dart';
import '../../../../Utilities/text_style_helper.dart';
import '../../../../Utilities/theme_helper.dart';
import '../../../../Utilities/validate.dart';
import '../../../../Widgets/custom_main_text_widget.dart';
import '../../../../Widgets/custom_button_widget.dart';
import '../../../../Widgets/custom_side_text_widget.dart';
import '../../../../Widgets/custom_textfield_widget.dart';
import '../../../../Widgets/loading_screen.dart';
import '../../../../generated/assets.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/custom_main_side_text_widget.dart';
import '../ForgetPassword/forget_password_screen.dart';
import 'change_password_controller.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const routeName = "changePassword";
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends StateMVC<ChangePasswordScreen> {
  _ChangePasswordScreenState() : super(ChangePasswordController()) {
    con = ChangePasswordController();
  }
  late ChangePasswordController con;
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
              padding:  EdgeInsetsDirectional.symmetric(horizontal: 24.w),
              child: ListView(children: [
                Gap(12.h),
                CustomAppBarWidget.mainScreen(
                  title: Strings.changePassword.tr,
                  space: 40.w,
                ),
                Gap(24.h),
                CustomMainSideTextWidget(text: Strings.oldPassword.tr),
                Gap(12.h),
                CustomTextFieldWidget(
                  hint: Strings.enterPassword.tr,
                  textInputType: TextInputType.text,
                  // hintStyle: TextStyle(
                  //     color: ThemeClass.of(context)
                  //         .hintText
                  // ),
                  backGroundColor: ThemeClass.of(context).background,
                  prefixIcon: SvgPicture.asset(Assets.imagesUserIcon),
                  isDense: true,
                  insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                  controller: con.oldPasswordController,
                  validator: (v) => Validate.validatePassword(v),
                ),
                Gap(12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(ForgetPasswordScreen.routeName);
                      },
                      child: Text(
                        Strings.forgetPassword.tr,
                        textAlign: TextAlign.left,
                        style: TextStyleHelper.of(context).b_16.copyWith(
                            color: ThemeClass.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
                Gap(12.h),
                CustomMainSideTextWidget(text: Strings.newPassword.tr),
                Gap(12.h),
                CustomTextFieldWidget(
                  hint: Strings.enterPassword.tr,
                  suffixIcon: con.isPassword
                      ? SvgPicture.asset(Assets.imagesObsecure)
                      : SvgPicture.asset(Assets.imagesOpenEye),
                  onSuffixTap: () {
                    setState(() {
                      con.isPassword = !con.isPassword;
                    });
                  },
                  // hintStyle: TextStyle(
                  //     color: ThemeClass.of(context)
                  //         .hintText
                  // ),
                  backGroundColor: ThemeClass.of(context).background,
                  prefixIcon: SvgPicture.asset(Assets.imagesLockIcon),
                  isDense: true,
                  insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                  controller: con.newPasswordController,
                  validator: (v) => Validate.validatePassword(v),
                ),
                Gap(12.h),
                CustomMainSideTextWidget(text: Strings.repeatPassword.tr),
                Gap(12.h),
                CustomTextFieldWidget(
                  hint: Strings.enterPassword.tr,
                  textInputType: TextInputType.text,
                  suffixIcon: con.isPassword
                      ? SvgPicture.asset(Assets.imagesObsecure)
                      : SvgPicture.asset(Assets.imagesOpenEye),
                  onSuffixTap: () {
                    setState(() {
                      con.isPassword = !con.isPassword;
                    });
                  },
                  // hintStyle: TextStyle(
                  //     color: ThemeClass.of(context)
                  //         .hintText
                  // ),
                  backGroundColor: ThemeClass.of(context).background,
                  prefixIcon: SvgPicture.asset(Assets.imagesUserIcon),
                  isDense: true,
                  insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                  controller: con.confirmNewPasswordController,
                  validator: (v) => Validate.validateConfPassword(
                      newPassword: con.newPasswordController.text,
                      confPassword: con.confirmNewPasswordController.text),
                ),
              ]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: Padding(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 24.w, vertical: 24.h),
          child: CustomButtonWidget.primary(
            height: 44.h,
            title: Strings.saveChanged.tr,
            onTap: () {
              ToastHelper.showSuccess(
                  message: Strings.success.tr,
                  icon: SvgPicture.asset(Assets.imagesCheckBox),
                  secondMessage: Strings.changePasswordSuc.tr,
                  context: context);
              // if (_formKey.currentState?.validate() ?? false) {
              // } else {
              //   setState(() {
              //     con.autoValidate = true;
              //   });
              // }
            },
          ),
        ),
      ),
    );
  }
}
