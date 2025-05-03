import 'package:Pretty/Modules/RequestService/request_service_controller.dart';
import 'package:Pretty/Modules/RequestService/widgets/send_resquest_successfully.dart';
import 'package:Pretty/Modules/Sponsors/sponsors_controller.dart';
import 'package:Pretty/Widgets/sponsers_widget.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

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

class RequestServiceScreen extends StatefulWidget {
  static const routeName = "RequestService";
  const RequestServiceScreen({super.key});

  @override
  State createState() => RequestServiceScreenState();
}

class RequestServiceScreenState extends StateMVC<RequestServiceScreen> {
  RequestServiceScreenState() : super(RequestServiceController()) {
    con = RequestServiceController();
  }

  late RequestServiceController con;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBarWidget.mainScreen(
      //   title: Strings.sponsors.tr,
      //   space: 80.w,
      // ),
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
                    color: ThemeClass.of(context).labelColor, height: 1.h),
                backGroundColor: ThemeClass.of(context).background,
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
                    color: ThemeClass.of(context).labelColor, height: 1.h),
                backGroundColor: ThemeClass.of(context).background,
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
                  return CustomCheckboxTile(
                    isChecked: service.isSelected,
                    title: service.name,
                    value: service.isSelected,
                    onChanged: (bool? value) {
                      con.toggleServiceSelection(index);
                    },
                    //  controlAffinity: ListTileControlAffinity.leading,
                  );
                }).toList(),
              ),
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
            ]),
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
              title: Strings.sendRequest.tr,
              onTap: () {
                GoRouter.of(context)
                    .pushNamed(SendRequestSuccessfully.routeName);
              }),
        ),
      ),
    );
  }
}
