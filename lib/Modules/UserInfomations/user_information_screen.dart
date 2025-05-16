import 'package:Pretty/Modules/UserInfomations/user_information_controller.dart';
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
import '../../Widgets/change_user_profile_image.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/custom_main_side_text_widget.dart';
import '../../Widgets/custom_main_text_widget.dart';
import '../../Widgets/custom_textfield_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../../generated/assets.dart';
import '../Home/home_screen.dart';
import '../Login/user_login_screen.dart';

class UserInformationScreen extends StatefulWidget {
  static const routeName = "UserInformation";
  const UserInformationScreen({super.key});

  @override
  createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends StateMVC<UserInformationScreen> {
  _UserInformationScreenState() : super(UserInformationController()) {
    con = UserInformationController();
  }
  late UserInformationController con;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.of(context).background,
      body: LoadingScreen(
        loading: con.loading,
        child: Form(
          key: _formKey,
          autovalidateMode: con.autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
              child:
                  ListView(physics: const BouncingScrollPhysics(), children: [

                    Gap(24.h),
                    Center(
                        child: CustomMainTextWidget(
                          text: Strings.yourInformation.tr,
                        )),
                    Gap(24.h),
                const ChangeImageWidget(),
                    Gap(12.h),
                    CustomMainSideTextWidget(
                      text: Strings.name.tr,
                    ),
                    Gap(8.h),
                    CustomTextFieldWidget(
                      hint: Strings.nameHint.tr,
                      textInputType: TextInputType.text,
                      backGroundColor: ThemeClass.of(context).background,

                      prefixIcon:
                      SvgPicture.asset(Assets.imagesUserIcon),
                      isDense: true,
                      insidePadding:
                      EdgeInsets.symmetric(vertical: 10.h),
                      controller: con.nameController,
                      validator: (v) => Validate.validateFullName(v),
                    ),
                    Gap(12.h),
                    CustomMainSideTextWidget(
                      text: Strings.image.tr,
                    ),
                    Gap(8.h),
                    CustomTextFieldWidget(
                      hint: Strings.imageHint.tr,
                      backGroundColor: ThemeClass.of(context).background,

                      suffixIcon:
                      SvgPicture.asset(Assets.imagesCameraIcon),
                      isDense: true,
                      insidePadding:
                      EdgeInsets.symmetric(vertical: 10.h),
                      controller: con.image,
                      //validator: (v) => Validate.validateFullName(v),
                    ),
              ]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal:24.w,vertical: 24.h),
          child: CustomButtonWidget.primary(
            height: 40.h,
            title: Strings.goToHome.tr,
            onTap: () {
              GoRouter.of(context).pushNamed(HomeScreen.routeName);
              //  context.pushNamed(SecurityDataScreen.routeName);
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

