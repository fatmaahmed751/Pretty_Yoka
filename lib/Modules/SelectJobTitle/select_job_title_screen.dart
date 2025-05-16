import 'package:Pretty/Modules/SelectJobTitle/select_job_controller.dart';
import 'package:Pretty/Modules/ServiceProviderHome/service_provider_home_screen.dart';
import 'package:Pretty/Modules/UserInfomations/user_information_controller.dart';
import 'package:Pretty/Modules/serviceProviderFillInformation/service_provider_fill_information_controller.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Models/service_model.dart';
import '../../Utilities/shared_preferences.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import '../../Utilities/validate.dart';
import '../../Widgets/change_user_profile_image.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/custom_check_box_for_services_widget.dart';
import '../../Widgets/custom_main_side_text_widget.dart';
import '../../Widgets/custom_main_text_widget.dart';
import '../../Widgets/custom_textfield_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../../Widgets/provider_send_request_success.dart';
import '../../generated/assets.dart';
import '../Login/user_login_screen.dart';
import '../RequestService/widgets/send_resquest_successfully.dart';

class SelectJobTitleScreen extends StatefulWidget {
  static const routeName = "SelectJobTitle";
  const SelectJobTitleScreen({super.key});

  @override
  createState() => _SelectJobTitleScreenState();
}

class _SelectJobTitleScreenState extends StateMVC<SelectJobTitleScreen> {
  _SelectJobTitleScreenState() : super(SelectJobTitleController()) {
    con = SelectJobTitleController();
  }

  late SelectJobTitleController con;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Initialize sample data
    con.initializeServices([
      ServiceModel(
        name: "Beauty Specialist",
        subServices: [
          ServiceModel(
            name: "Hair services",
            subServices: [
              ServiceModel(name: "Haircuts & trims"),
              ServiceModel(name: "Wedding hair styling"),
              ServiceModel(name: "Hair coloring & highlights"),
              ServiceModel(name: "Hair treatments"),
              ServiceModel(name: "Hair extensions & weaving"),
              ServiceModel(name: "Hair style for party or event"),
              ServiceModel(
                name: "Nail services",
                subServices: [
                  ServiceModel(name: "Manicure"),
                  ServiceModel(name: "Pedicure"),
                  ServiceModel(name: "Gel & Acrylic Nails"),
                  ServiceModel(name: "Nail Art & Design"),
                  ServiceModel(name: "Nail Repair & Strengthening"),
                  ServiceModel(
                    name: "Skincare & facial treatments",
                    subServices: [
                      ServiceModel(name: "Deep Cleansing Facial"),
                      ServiceModel(name: "Hydrating & Anti-aging Facial"),
                      ServiceModel(name: "Chemical Peels"),
                      ServiceModel(name: "Microdermabrasion"),
                      ServiceModel(
                          name: "Skin Whitening & Brightening Treatments"),
                    ],
                  ),
                ],
              ),
            ],
          ),
          ServiceModel(name: "Wedding hair styling"),
          ServiceModel(name: "Hair coloring & highlights"),
          ServiceModel(name: "Hair treatments"),
          ServiceModel(name: "Hair extensions & weaving"),
          ServiceModel(name: "Hair style for party or event"),
        ],
      ),
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
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 24.w, vertical: 8.h),
              child:
                  ListView(physics: const BouncingScrollPhysics(), children: [
                CustomAppBarWidget.mainScreen(
                  title: Strings.serviceInformation.tr,
                  space:SharedPref.getCurrentLanguage()=="en"? 50.w:70.w
                ),
                Gap(24.h),
                CustomMainSideTextWidget(text: Strings.selectJobTitle.tr),
                Gap(8.h),
                    Column(
                      children: con.allMainService.asMap().entries.map((entry) {
                        final index = entry.key;
                        final service = entry.value;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                con.setSelectedJob(index); // This updates mainServices
                              },
                              child: Padding(
                                padding:  EdgeInsetsDirectional.only(bottom: 8.h),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 25.w,
                                      height: 25.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: service.isSelected
                                            ? ThemeClass.of(context).primaryColor.withOpacity(0.8)
                                            : Colors.transparent,
                                        border: Border.all(
                                          color: service.isSelected
                                              ? Colors.transparent
                                              : ThemeClass.of(context).labelColor,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: service.isSelected
                                            ? Icon(Icons.check, size: 16, color: Colors.white)
                                            : null,
                                      ),
                                    ),
                                    Gap(8.w),
                                    Text(
                                      service.name,
                                      style: TextStyleHelper.of(context)
                                          .b_16
                                          .copyWith(
                                          color: ThemeClass.of(context)
                                              .secondaryBlackColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Optional: Show Sub-services if any
                            if (service.isExpanded && service.subServices != null)
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

                    // Conditional Section: Show General or Specific Services
                    if (con.selectedJobIndex != -1 &&
                        con.allMainService[con.selectedJobIndex].isExpanded)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Custom Header Based on Selected Job
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: CustomMainSideTextWidget(
                              text: con.allMainService[con.selectedJobIndex].name == "Beauty Specialist" ||
                                  con.allMainService[con.selectedJobIndex].name == "beauty salon"
                                  ? Strings.selectGeneralService.tr
                                  : con.mainServices.isNotEmpty
                                  ? con.mainServices.first.name
                                  : con.allMainService[con.selectedJobIndex].name,
                            ),
                          ),

                          ...con.mainServices.map((service) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                               onTap: () {

                                 con.toggleServiceSelection(
                                     con.mainServices.indexOf(service));
                               },
                                child: CustomCheckboxTile(
                                  title: service.name,
                                  value: service.isSelected,
                                  isChecked: service.isSelected,
                                  onChanged: (value) {
                                    con.toggleServiceSelection(
                                        con.mainServices.indexOf(service));
                                  },
                                ),
                              ),

                              // Show Sub-services if Expanded
                              if (service.isSelected &&
                                  service.subServices != null)
                                Padding(
                                  padding: EdgeInsets.only(left: 12.w),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: service.subServices!
                                        .map((subService) {
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
                          )),
                        ],
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
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 24.w, vertical: 24.h),
          child: CustomButtonWidget.primary(
              height: 44.h,
              title: Strings.sendJoin.tr,
              onTap: () {
                GoRouter.of(context)
                    .pushNamed(ProviderSendRequestSuccessfully.routeName);
              }),
        ),
      ),
    );
  }
}
