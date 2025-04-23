import 'package:Pretty/Modules/UserSignUp/user_sign_up_controller.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/strings.dart';
import '../../Utilities/theme_helper.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/custom_main_side_text_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../../Widgets/raw_or_widget.dart';
import '../../Widgets/user_status_row.dart';
import '../../generated/assets.dart';

class UserSignUpScreen extends StatefulWidget {
  static const routeName = "UserSignUp";
  const UserSignUpScreen({super.key});

  @override
  createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends StateMVC<UserSignUpScreen> {
  _UserSignUpScreenState() : super(UserSignUpController()) {
    con = UserSignUpController();
  }

  late UserSignUpController con;
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
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              Gap(12.h),
              CustomAppBarWidget.mainScreen(title: Strings.signUp.tr,
              space: 110.w,),
              Gap(24.h),
              CustomMainSideTextWidget(
                text: Strings.phone.tr,
              ),
              Gap(12.h),
              CustomMainSideTextWidget(
                text: Strings.password.tr,
              ),
              Gap(12.h),
              CustomMainSideTextWidget(
                text: Strings.repeatPassword.tr,
              ),
              CustomButtonWidget.primary(
                  height: 40.h,
                  radius: 12.r,
                  title: Strings.joinUs.tr,
                  onTap: () {}),
              UserStatusRow(
                text: Strings.haveAnAccount.tr,
                nextText: Strings.login.tr,
                onNextTextTap: () {},
              ),
              const RowOrWidget()
            ]),
          ),
        ),
      ),
    );
  }
}
