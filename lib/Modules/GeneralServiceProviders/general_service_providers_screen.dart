import 'package:Pretty/Modules/ServiceProviders/service_providers_controller.dart';
import 'package:Pretty/Modules/Sponsors/sponsors_controller.dart';
import 'package:Pretty/Widgets/service_provider_widget.dart';
import 'package:Pretty/Widgets/sponsers_widget.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Utilities/strings.dart';
import '../../../Widgets/custom_app_bar_widget.dart';
import '../../../Widgets/loading_screen.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import '../../generated/assets.dart';
import '../ServiceInformationForSpecificCategory/service_information_for_specific_category_screen.dart';
import '../ServiceProviderInformation/service_provider_information_screen.dart';
import 'general_service_providers_controller.dart';

class GeneralServiceProvidersScreen extends StatefulWidget {
  static const routeName = "GeneralServiceProviders";
  const GeneralServiceProvidersScreen({super.key});

  @override
  State createState() => GeneralServiceProvidersScreenState();
}

class GeneralServiceProvidersScreenState extends StateMVC<GeneralServiceProvidersScreen> {
  GeneralServiceProvidersScreenState() : super(GeneralServiceProvidersController()) {
    con = GeneralServiceProvidersController();
  }

  late GeneralServiceProvidersController con;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBarWidget.mainScreen(
      //   title: Strings.serviceProvider.tr,
      //   space: 110.w,
      // ),
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Gap(4.h),
                  CustomAppBarWidget.mainScreen(
                    title: Strings.serviceProvider.tr,
                    space: 80.w,
                  ),
                  Gap(24.h),
                  Container(
                    width: 260.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                        color: ThemeClass
                            .of(context)
                            .textFieldBackground,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      child: Row(
                        children: [
                          Text(
                            Strings.editYourRequest.tr,
                            style: TextStyleHelper
                                .of(context)
                                .b_14
                                .copyWith(
                                color: ThemeClass
                                    .of(context)
                                    .primaryColor),
                          ),
                          const Spacer(),
                          SvgPicture.asset(Assets.imagesAddIcon)
                        ],
                      ),
                    ),
                  ),
                  Gap(12.h),
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 12.h,
                    children: List.generate(
                      20,
                          (index) => GestureDetector(
                        onTap: (){
                          GoRouter.of(context).pushNamed(ServiceProviderInformationForSpecificScreen.routeName);
                        },
                        child: ServiceProviderWidget(
                          width: 157.5.w,
                          height: 155.h,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
