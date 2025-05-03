import 'package:Pretty/Modules/ServiceProviders/service_providers_controller.dart';
import 'package:Pretty/Modules/Sponsors/sponsors_controller.dart';
import 'package:Pretty/Widgets/service_provider_widget.dart';
import 'package:Pretty/Widgets/sponsers_widget.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/strings.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../ServiceProviderInformation/service_provider_information_screen.dart';

class ServiceProvidersScreen extends StatefulWidget {
  static const routeName = "ServiceProviders";
  const ServiceProvidersScreen({super.key});

  @override
  State createState() => ServiceProvidersScreenState();
}

class ServiceProvidersScreenState extends StateMVC<ServiceProvidersScreen> {
  ServiceProvidersScreenState() : super(ServiceProvidersController()) {
    con = ServiceProvidersController();
  }

  late ServiceProvidersController con;
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
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 12.h,
                    children: List.generate(
                      20,
                      (index) => GestureDetector(
                        onTap: (){
                          GoRouter.of(context).pushNamed(ServiceProviderInformationScreen.routeName);
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
