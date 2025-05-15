import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../../Utilities/shared_preferences.dart';
import '../../../../Utilities/strings.dart';
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
import '../../Widgets/toast_helper.dart';
import 'change_phone_number_controller.dart';


class ChangePhoneScreen extends StatefulWidget {
  static const routeName = "ChangePhone";
  const ChangePhoneScreen({super.key});

  @override
  createState() => _ChangePhoneScreenState();
}

class _ChangePhoneScreenState extends StateMVC<ChangePhoneScreen> {
  _ChangePhoneScreenState() : super(ChangePhoneController()) {
    con = ChangePhoneController();
  }
  late ChangePhoneController con;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.of(context).background,
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Form(
            key: _formKey,
            autovalidateMode: con.autoValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: SafeArea(
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(12.h),
                      CustomAppBarWidget.mainScreen(
                        title: Strings.changePhone.tr,
                        space: 30.w,
                      ),
                      Gap( 24.h),
                      CustomMainSideTextWidget(text: Strings.oldPhone.tr),
                      Gap( 12.h),
                      CustomTextFieldWidget(
                        textInputType: TextInputType.phone,
                        hint: Strings.phoneHint.tr,
                        // hintStyle: TextStyle(
                        //     color: ThemeClass.of(context)
                        //         .hintText
                        // ),

                        backGroundColor: ThemeClass.of(context).background,
                        prefixIcon: SvgPicture.asset(Assets.imagesPhoneIcon),
                        isDense: true,
                        insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                        controller: con.phoneController,
                        validator: (v) => Validate.validatePhoneOptional(v),
                      ),
                      Gap( 12.h),
                      CustomMainSideTextWidget(text: Strings.newPhone.tr),
                      Gap( 12.h),
                      CustomTextFieldWidget(
                        textInputType: TextInputType.phone,
                        hint: Strings.phoneHint.tr,
                        // hintStyle: TextStyle(
                        //     color: ThemeClass.of(context)
                        //         .hintText
                        // ),

                        backGroundColor: ThemeClass.of(context).background,
                        prefixIcon: SvgPicture.asset(Assets.imagesPhoneIcon),
                        isDense: true,
                        insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                        controller: con.newPhoneNumber,
                        validator: (v) => Validate.validatePhoneOptional(v),
                      ),
                      Gap( 8.h),
                    ],
                  ),
                ),
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
              ToastHelper.showSuccess(
                  message: Strings.success.tr,
                  icon: SvgPicture.asset(Assets.imagesCheckBox),
                  secondMessage: Strings.changePhoneSuc.tr,
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