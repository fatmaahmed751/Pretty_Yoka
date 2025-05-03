import 'package:Pretty/Modules/Pharmacies/pharmacies_controller.dart';
import 'package:Pretty/Modules/Sponsors/sponsors_controller.dart';
import 'package:Pretty/Widgets/sponsers_widget.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/strings.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/loading_screen.dart';

class PharmaciesScreen extends StatefulWidget {
  static const routeName ="Pharmacies";
  const PharmaciesScreen({super.key});

  @override
  State createState() => PharmaciesScreenState();
}

class PharmaciesScreenState extends StateMVC<PharmaciesScreen> {
  PharmaciesScreenState() : super(PharmaciesController()) {
    con = PharmaciesController();
  }

  late PharmaciesController con;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget.mainScreen(
        title: Strings.pharmacies.tr,
        space: 110.w,
      ),
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => Gap(4.h),
              itemBuilder: (context, index) => const SponsorsWidget(),
              itemCount: 5,
            ),
          ),
        ),
      ),
    );
  }
}
