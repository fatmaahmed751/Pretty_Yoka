import 'package:Pretty/Modules/ServiceProviderHome/service_provider_home_screen.dart';
import 'package:Pretty/Modules/ServiceProviderPersonalData/service_provider_personal_controller.dart';
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

class ServiceProviderPersonalDataScreen extends StatefulWidget {
  static const routeName = "ServiceProviderPersonalData";
  const ServiceProviderPersonalDataScreen({super.key});

  @override
  createState() => _ServiceProviderPersonalDataScreenState();
}

class _ServiceProviderPersonalDataScreenState extends StateMVC<ServiceProviderPersonalDataScreen> {
  _ServiceProviderPersonalDataScreenState() : super(ServiceProviderPersonalDataController()) {
    con = ServiceProviderPersonalDataController();
  }
  late ServiceProviderPersonalDataController con;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey _typeKey = GlobalKey();
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
                Gap(12.h),
                CustomMainSideTextWidget(
                  text: Strings.location.tr,
                ),
                Gap(8.h),
                CustomTextFieldWidget(
                  hint: Strings.selectYourLocation.tr,
                  backGroundColor: ThemeClass.of(context).background,

                  suffixIcon: SvgPicture.asset(Assets.imagesLocationIcon),
                  isDense: true,
                  insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                  controller: con.locationController,
                  //validator: (v) => Validate.validateFullName(v),
                ),
                Gap(12.h),
                CustomMainSideTextWidget(
                  text: Strings.areas.tr,
                ),
                Gap(8.h),
                Column(
                  children: [
                    CustomTextFieldWidget(
                      key: _typeKey,
                      hint: Strings.selectArea.tr,
                      backGroundColor: ThemeClass.of(context).background,
                      readOnly: true,
                      suffixIcon: SvgPicture.asset(Assets.imagesArrowDownP),
                      onSuffixTap: () {
                        setState(() {
                          con.showDropdown = !con.showDropdown;
                        });
                      },
                      hintStyle: TextStyle(color: ThemeClass.of(context).secondaryBlackColor),
                      isDense: true,
                      insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                      controller: con.areaController,
                      validator: (v) => Validate.validateNormalString(v),
                    ),
                    if (con.showDropdown)
                      Container(
                        decoration: BoxDecoration(
                            color: ThemeClass.of(context).background,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                color: ThemeClass.of(context).waiting
                            )
                        ),
                        constraints: BoxConstraints(

                          maxHeight: MediaQuery.of(context).size.height * 0.4,
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          children: con.items.map((String item) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  con.area = item;
                                  con.areaController.text = item;
                                  con.showDropdown = false;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    color: ThemeClass.of(context).mainBlack,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                  ],
                ),
                Gap(8.h),
                // CustomTextFieldWidget(
                //   hint: Strings.selectArea.tr,
                //   backGroundColor: ThemeClass.of(context).background,
                //
                //   suffixIcon: SvgPicture.asset(Assets.imagesa),
                //   isDense: true,
                //   insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                //   controller: con.areaController,
                //   //validator: (v) => Validate.validateFullName(v),
                // ),
                CustomMainSideTextWidget(
                  text: Strings.bio.tr,
                ),
                Gap(8.h),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  constraints: BoxConstraints(
                    minHeight:  154.h,
                    maxHeight: 160.h,
                  ),
                  decoration: BoxDecoration(
                    color: ThemeClass.of(context).mainSecondary,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: CustomTextFieldWidget(
                    textAlign:TextAlignVertical.top,
                    expands: true,
                    // maxLine: 3,
                    controller: con.writeYourBio,
                    textInputType: TextInputType.text,
                    hint: Strings.enterYourBio.tr,
                    validator: (v) => Validate.validateNormalString(v),
                    onSave: (v) {
                      FocusScope.of(context)
                          .unfocus();
                    },
                  ),
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
            title: Strings.saveChanged.tr,
            onTap: () {
              GoRouter.of(context).pushNamed(ServiceProviderHomeScreen.routeName);
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

