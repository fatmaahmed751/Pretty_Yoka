
import 'package:Pretty/Modules/ServiceInformationForSpecificCategory/service_information_for_specific_category_controller.dart';
import 'package:Pretty/Modules/ServiceProviderInformation/service_provider_information_controller.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../Utilities/shared_preferences.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import '../../Widgets/customSolidSideText.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/custom_main_side_text_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../../generated/assets.dart';
import '../RequestService/request_service_screen.dart';
import '../RequestService/widgets/send_resquest_successfully.dart';
import '../RequestServiceFromSpecificServiceProvider/request_service_from_specific_service_provider_screen.dart';

class ServiceProviderInformationForSpecificScreen extends StatefulWidget {
  static const routeName = "ServiceProviderInformationForSpecific";
  const ServiceProviderInformationForSpecificScreen({super.key});

  @override
  ServiceProviderInformationForSpecificScreenState createState() =>
      ServiceProviderInformationForSpecificScreenState();
}

class ServiceProviderInformationForSpecificScreenState
    extends StateMVC<ServiceProviderInformationForSpecificScreen> {
  ServiceProviderInformationForSpecificScreenState()
      : super(ServiceProviderInformationForSpecificController()) {
    con = ServiceProviderInformationForSpecificController();
  }

  late ServiceProviderInformationForSpecificController con;
  int activeText = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Padding(
            padding: EdgeInsetsDirectional.only(top: 16.h),
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    //    children: [
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.pop();
                                  },
                                  child: Transform.flip(
                                    flipX: SharedPref.getCurrentLanguage() == "ar"
                                        ? true
                                        : false,
                                    child: SvgPicture.asset(
                                      Assets.imagesArrowBack,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                SvgPicture.asset(Assets.imagesFavoriteNavBar,
                                  colorFilter:  ColorFilter.mode(
                                      ThemeClass.of(context).primaryColor,
                                      BlendMode.srcIn),)
                              ],
                            ),

                          ),
                          Gap(16.h),
                          Stack(
                            clipBehavior: Clip.none,
                            //alignment: Alignment.bottomLeft,
                            children: [
                              Image.asset(
                                Assets.imagesSalonImage,
                              ),

                              Positioned(
                                bottom: -20.h, // Adjust this value to control how much overlaps
                                left: 20.w,
                                child: CircleAvatar(
                                    radius: 43.r,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: const AssetImage(
                                        Assets.imagesFavoriteServiceProvider)),
                              ),
                              //  ),
                            ],
                          ),
                          Gap(30.h),
                          Padding(
                            padding:  EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,

                              children: [
                                CustomMainSideTextWidget(
                                  text: Strings.serviceProviderName.tr,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Strings.makeUpArtist.tr,
                                      style: TextStyleHelper
                                          .of(context)
                                          .b_12
                                          .copyWith(
                                          color: ThemeClass
                                              .of(
                                              context)
                                              .secondaryBlackColor),
                                    ),

                                    SizedBox(
                                      //   width: 60.w,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              height: 16.h,
                                              width: 16.w,
                                              child: SvgPicture.asset(
                                                  Assets.imagesStarIcon)),
                                          Gap(2.w),
                                          Padding(
                                            padding:  EdgeInsetsDirectional.only(top: 4.h),
                                            child: Text(
                                              "4.5",
                                              style: TextStyleHelper.of(
                                                  context)
                                                  .b_12
                                                  .copyWith(
                                                  color: ThemeClass.of(
                                                      context)
                                                      .labelColor,
                                                  fontWeight:
                                                  FontWeight.w400),
                                            ),
                                          ),
                                          Gap(4.w),
                                          Padding(
                                            padding:  EdgeInsetsDirectional.only(top: 4.h),
                                            child: Text(
                                              "(${"44"})",
                                              style:
                                              TextStyleHelper
                                                  .of(context)
                                                  .b_12
                                                  .copyWith(
                                                  color: ThemeClass
                                                      .of(context)
                                                      .labelColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(12.h),
                                Text(Strings.serviceProviderDefinition.tr,
                                  style: TextStyleHelper
                                      .of(context)
                                      .b_14
                                      .copyWith(
                                      color: ThemeClass
                                          .of(
                                          context)
                                          .labelColor),),
                                Gap(16.h),
                                CustomSolidSideTextWidget(
                                  text: Strings.services.tr,
                                ),
                                Gap(8.h),
                                ...con.services.map((service) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsetsDirectional.symmetric(horizontal: 8.w,
                                          vertical: 4.h,),
                                        child: Icon(Icons.circle, size: 5,
                                          color: ThemeClass.of(context).labelColor,),
                                      ),
                                      Expanded(child: Text(service,
                                        style:TextStyleHelper.of(context).b_16.copyWith(
                                            color: ThemeClass.of(context).labelColor
                                        ) ,)),
                                    ],
                                  ),
                                )).toList(),
                                Gap(8.h),
                                CustomSolidSideTextWidget(
                                  text: Strings.areas.tr,
                                ),
                                Gap(8.h),
                                ...con.areas.map((service) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsetsDirectional.symmetric(horizontal: 8.w,
                                          vertical: 4.h,),
                                        child: Icon(Icons.circle, size: 5,
                                          color: ThemeClass.of(context).labelColor,),
                                      ),
                                      Expanded(child: Text(service,
                                        style:TextStyleHelper.of(context).b_16.copyWith(
                                            color: ThemeClass.of(context).labelColor
                                        ) ,)),
                                    ],
                                  ),
                                )).toList(),
                              ],
                            ),
                          ),

                        ]
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
              title: Strings.requestPrice.tr,
              onTap: () {

                GoRouter.of(context).pushNamed(SendRequestSuccessfully.routeName);

              }),
        ),
      ),
    );
  }
}
