import 'package:Pretty/Modules/SelectJobTitle/select_job_controller.dart';
import 'package:Pretty/Modules/UserInfomations/user_information_controller.dart';
import 'package:Pretty/Modules/serviceProviderFillInformation/service_provider_fill_information_controller.dart';
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
import '../Login/user_login_screen.dart';

class SelectJobTitleScreen extends StatefulWidget {
  static const routeName = "SelectJobTitle";
  const SelectJobTitleScreen({super.key});

  @override
  createState() => _SelectJobTitleScreenState();
}

class _SelectJobTitleScreenState extends StateMVC<SelectJobTitleScreen> {
  _SelectJobTitleScreenState()
      : super(SelectJobTitleController()) {
    con = SelectJobTitleController();
  }

  late SelectJobTitleController con;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass
          .of(context)
          .background,
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
                      text: Strings.serviceInformation.tr,
                    )),
                Gap(24.h),
              ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}