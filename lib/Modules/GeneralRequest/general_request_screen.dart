
import 'package:Pretty/Modules/ServiceProviders/service_providers_screen.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Models/service_model.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/theme_helper.dart';
import '../../Utilities/validate.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/custom_check_box_for_services_widget.dart';
import '../../Widgets/custom_main_side_text_widget.dart';
import '../../Widgets/custom_radio_list_widget.dart';
import '../../Widgets/custom_textfield_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../../generated/assets.dart';
import '../GeneralServiceProviders/general_service_providers_screen.dart';
import '../RequestService/widgets/send_resquest_successfully.dart';
import 'general_request_controller.dart';

class GeneralRequestServiceScreen extends StatefulWidget {
  static const routeName = "GeneralRequestService";
  const GeneralRequestServiceScreen({super.key});

  @override
  State createState() => GeneralRequestServiceScreenState();
}

class GeneralRequestServiceScreenState extends StateMVC<GeneralRequestServiceScreen> {
  GeneralRequestServiceScreenState() : super(GeneralRequestServiceController()) {
    con = GeneralRequestServiceController();
  }

  late GeneralRequestServiceController con;
  @override
  void initState() {
    super.initState();
    // Initialize sample data
    con.initializeServices([
      ServiceModel(
        name: "Hair services",
        subServices: [
          ServiceModel(name: "Haircuts & trims"),
          ServiceModel(name: "Wedding hair styling"),
          ServiceModel(name: "Hair coloring & highlights"),
          ServiceModel(name: "Hair treatments"),
          ServiceModel(name: "Hair extensions & weaving"),
          ServiceModel(name: "Hair style for party or event"),
        ],
      ),
      ServiceModel(
        name: "Nail services",
        subServices: [
          ServiceModel(name: "Manicure"),
          ServiceModel(name: "Pedicure"),
          ServiceModel(name: "Gel & Acrylic Nails"),
          ServiceModel(name: "Nail Art & Design"),
          ServiceModel(name: "Nail Repair & Strengthening"),
        ],
      ),
      ServiceModel(
        name: "Skincare & facial treatments",
        subServices: [
          ServiceModel(name: "Deep Cleansing Facial"),
          ServiceModel(name: "Hydrating & Anti-aging Facial"),
          ServiceModel(name: "Chemical Peels"),
          ServiceModel(name: "Microdermabrasion"),
          ServiceModel(name: "Skin Whitening & Brightening Treatments"),
        ],
      ),
      ServiceModel(
        name: "Makeup services",
        subServices: [
          ServiceModel(name: "Party & Event Makeup"),
          ServiceModel(name: "Bridal Makeup"),
          ServiceModel(name: "Eyebrow Shaping & Tinting"),
          ServiceModel(name: "Eyelash Extensions"),
        ],
      ),
      ServiceModel(
        name: "Body & Spa Treatments",
        subServices: [
          ServiceModel(name: "Massage"),
          ServiceModel(name: "Body Scrubs"),
          ServiceModel(name: "Moroccan Bath"),
          ServiceModel(name: "Turkish Bath"),
          ServiceModel(name: "Waxing"),
        ],
      ),
    ]);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 24.w, vertical: 8.h),
            child: ListView(children: [
              CustomAppBarWidget.mainScreen(
                title: Strings.request.tr,
                space: 110.w,
              ),
              Gap(24.h),
              CustomMainSideTextWidget(
                text: Strings.selectDate.tr,
              ),
              Gap(8.h),
              CustomTextFieldWidget(
                readOnly: true,
                onSuffixTap: () {
                  con.selectDate(context);
                },
                hint: Strings.selectDayAndTime.tr,
                hintStyle: TextStyle(
                    color: ThemeClass
                        .of(context)
                        .labelColor, height: 1.h),
                backGroundColor: ThemeClass
                    .of(context)
                    .background,
                suffixIcon: SvgPicture.asset(Assets.imagesCalenderIcon),
                isDense: true,
                controller: con.dateController,
                validator: (v) => Validate.validateNormalString(v),
              ),
              Gap(12.h),
              CustomMainSideTextWidget(
                text: Strings.location.tr,
              ),
              Gap(8.h),
              CustomTextFieldWidget(
                hint: Strings.selectYourLocation.tr,
                hintStyle: TextStyle(
                    color: ThemeClass
                        .of(context)
                        .labelColor, height: 1.h),
                backGroundColor: ThemeClass
                    .of(context)
                    .background,
                suffixIcon: SvgPicture.asset(Assets.imagesLocationIcon),
                isDense: true,
                controller: con.locationController,
                validator: (v) => Validate.validateNormalString(v),
              ),
              Gap(14.h),
              CustomMainSideTextWidget(
                text: Strings.selectServiceYouWant.tr,
              ),
              Gap(8.h),
              Column(
                children: con.mainServices.asMap().entries.map((entry) {
                  final index = entry.key;
                  final service = entry.value;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCheckboxTile(
                        title: service.name,
                        value: service.isSelected,
                        isChecked: service.isSelected,
                        onChanged: (value) {
                          con.toggleServiceSelection(index);
                        },
                      ),
                      if (service.isSelected && service.subServices != null)
                        Padding(
                          padding: EdgeInsets.only(left: 12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: service.subServices!.map((subService) {
                              return CustomCheckboxTile(
                                title: subService.name,
                                value: subService.isSelected,
                                isChecked: subService.isSelected,
                                onChanged: (val) {
                                  setState(() {
                                    subService.isSelected = val!;
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  );
                }).toList(),
              ),
              // Column(
              //   children: con.mainServices
              //       .asMap()
              //       .entries
              //       .map((entry) {
              //     final index = entry.key;
              //     final service = entry.value;
              //     return CustomCheckboxTile(
              //       isChecked: service.isSelected,
              //       title: service.name,
              //       value: service.isSelected,
              //       onChanged: (bool? value) {
              //         con.toggleServiceSelection(index);
              //       },
              //       //  controlAffinity: ListTileControlAffinity.leading,
              //     );
              //   }).toList(),
              // ),
              Gap(12.h),
              CustomMainSideTextWidget(
                text: Strings.useServiceMaterial.tr,
              ),
              Gap(12.h),
              CustomRadioListTileExample(
                groupValue: con.materialServiceSelection,
                firstText: Strings.yesIWant.tr,
                secondText: Strings.noIHave.tr,
                onValueChanged: (value) {
                  con.materialServiceSelection = value;
                  con.updateMaterialServiceSelection(value);
                },
              ),
              Gap(12.h),
              CustomMainSideTextWidget(
                text: Strings.materialQuality.tr,
              ),
              Gap(8.h),
              CustomRadioListTileExample(
                groupValue: con.quality,
                firstText: Strings.highQuality.tr,
                secondText: Strings.mediumQuality.tr,
                onValueChanged: (value) {
                  con.quality = value;
                  con.updateMaterialQuality(value);
                },
              ),
              Gap(12.h),
              CustomMainSideTextWidget(
                text: Strings.anyAdditions.tr,
              ),
              Gap(12.h),
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
                  controller: con.writeAnyThingController,
                  textInputType: TextInputType.text,
                  hint: Strings.writeAnyThingAbout.tr,
                  validator: (v) => Validate.validateNormalString(v),
                  onSave: (v) {
                    FocusScope.of(context)
                        .unfocus();
                  },
                ),
              ),
            ]
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
              title: Strings.search.tr,
              onTap: () {
                GoRouter.of(context)
                    .pushNamed(GeneralServiceProvidersScreen.routeName);
              }),
        ),
      ),
    );
  }
}