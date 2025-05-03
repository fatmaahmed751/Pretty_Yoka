import 'package:Pretty/Modules/SelectRole/select_role_controller.dart';
import 'package:Pretty/Modules/UserSignUp/user_sign_up_screen.dart';
import 'package:Pretty/Widgets/custom_app_bar_widget.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../../../Utilities/theme_helper.dart';
import '../../../../../Widgets/loading_screen.dart';
import '../../../../Utilities/strings.dart';
import '../../../../Widgets/custom_button_widget.dart';
import '../../Widgets/custom_radio_list_widget.dart';
import '../../Widgets/custom_side_text_widget.dart';
import '../../generated/assets.dart';

class SelectRoleScreen extends StatefulWidget {
  static const routeName = "SelectRole";

  const SelectRoleScreen({
    super.key,
  });

  @override
  createState() => SelectRoleScreenState();
}

class SelectRoleScreenState extends StateMVC<SelectRoleScreen> {
  SelectRoleScreenState() : super(SelectRoleController()) {
    con = SelectRoleController();
  }
  late SelectRoleController con;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //    appBar: CustomAppBarWidget.mainScreen(title: Strings.yourRole.tr),
      backgroundColor: ThemeClass.of(context).background,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.imagesBackground, // Replace with your image path
              fit: BoxFit.cover, // Ensures the image covers the entire screen
            ),
          ),
          SafeArea(
            child: LoadingScreen(
              loading: con.loading,
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Gap(12.h),
                    CustomAppBarWidget.mainScreen(title: Strings.yourRole.tr,
                    space: 100.w,),
                    Gap(24.h),
                    CustomSideTextWidget(text: Strings.selectRole.tr),
                    Gap(12.h),
                    CustomRadioListTileExample(
                      groupValue: con.selectRole,
                      firstText: Strings.user.tr,
                      secondText: Strings.serviceProvider.tr,
                      onValueChanged: (value) {
                        con.selectRole = value;
                        con.updateRole(value);
                      },
                    ),
                    Gap(24.h),
                    CustomButtonWidget.primary(
                        height: 40.h,
                        radius: 12.r,
                        title: Strings.continu.tr,
                        onTap: () {
                          if (con.selectRole == 1) {
                            GoRouter.of(context).goNamed(UserSignUpScreen.routeName);
                          }
                        }),
                    Gap(30.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   color: Colors.transparent,
      //   child: Padding(
      //     padding:
      //         EdgeInsetsDirectional.symmetric(horizontal: 24.w, vertical: 24.h),
      //     child: CustomButtonWidget.primary(
      //         height: 40.h,
      //         radius: 12.r,
      //         title: Strings.continu.tr,
      //         onTap: () {
      //           if (con.selectRole == 1) {
      //             GoRouter.of(context).goNamed(UserSignUpScreen.routeName);
      //           }
      //         }),
      //   ),
      // ),
    );
  }
}
