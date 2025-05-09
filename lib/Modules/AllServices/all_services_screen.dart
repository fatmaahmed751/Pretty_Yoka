
import 'package:Pretty/Modules/AllServices/widgets/service_card_widget.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../../generated/assets.dart';
import 'all_services_controller.dart';

class AllServicesScreen extends StatefulWidget {
  static const routeName = "AllServices";
  const AllServicesScreen({super.key});

  @override
  createState() => _AllServicesScreenState();
}

class _AllServicesScreenState extends StateMVC<AllServicesScreen> {
  _AllServicesScreenState() : super(AllServicesController()) {
    con = AllServicesController();
  }
  late AllServicesController con;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.of(context).background,
      // appBar: CustomAppBarWidget.mainScreen(
      //   title: Strings.services.tr,
      //   space: 90.w,
      // ),
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
              child:
              Column(
                children: [
                  Gap(12.h),
                  CustomAppBarWidget.mainScreen(
                    title: Strings.services.tr,
                    space: 90.w,
                  ),
                  Gap(16.h),
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: List.generate(10, (index) {
                      return const ServiceCardWidget();
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
