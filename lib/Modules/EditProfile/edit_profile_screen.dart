import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../Utilities/validate.dart';
import '../../../Widgets/loading_screen.dart';
import '../../Utilities/strings.dart';
import '../../Widgets/custom_main_side_text_widget.dart';
import '../Profile/Widget/change_user_profile_image.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/custom_side_text_widget.dart';
import '../../Widgets/custom_textfield_widget.dart';
import '../../generated/assets.dart';
import 'edit_profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = "EditProfile";
  const EditProfileScreen({super.key});

  @override
  createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends StateMVC<EditProfileScreen> {
  _EditProfileScreenState() : super(EditProfileController()) {
    con = EditProfileController();
  }
  late EditProfileController con;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey _textFieldKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.of(context).background,
      // appBar: CustomAppBarWidget.mainScreen(
      //   title: Strings.editProfile.tr,
      //   space: 120.w,
      // ),
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
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Gap(12.h),
              CustomAppBarWidget.mainScreen(
                title: Strings.editProfile.tr,
                space:95.w,
              ),
                  Gap(24.h),
                   Center(child: CircleAvatar(
                    radius:61.r,
                       backgroundColor: ThemeClass.of(context).primaryColor,
                      child: ChangeImageWidget())),
                  Gap(12.h),
                  CustomMainSideTextWidget(text: Strings.fullName.tr),
                  Gap(12.h),
                  CustomTextFieldWidget(
                    hint: Strings.nameHint.tr,
                    backGroundColor: ThemeClass.of(context).labelColor,
                    // hintStyle:
                    // TextStyle(color: ThemeClass.of(context).labelColor),
                    prefixIcon: SvgPicture.asset(Assets.imagesUserIcon),
                    isDense: true,
                    insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                    controller: con.nameController,
                    validator: (v) => Validate.validateFullName(v),
                  ),

                ],
              ),
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
            radius: 12.r,
            title: Strings.saveChanged.tr,
            onTap: () {
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