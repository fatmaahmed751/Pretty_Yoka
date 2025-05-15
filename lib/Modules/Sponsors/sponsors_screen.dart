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

class SponsorsScreen extends StatefulWidget {
  static const routeName = "Sponsors";
  const SponsorsScreen({super.key});

  @override
  State createState() => SponsorsScreenState();
}

class SponsorsScreenState extends StateMVC<SponsorsScreen> {
  SponsorsScreenState() : super(SponsorsController()) {
    con = SponsorsController();
  }

  late SponsorsController con;
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
            child: ListView(
              children: [
                CustomAppBarWidget.mainScreen(
                  title: Strings.sponsors.tr,
                  space: 110.w,
                ),
                Gap(24.h),
                Column(
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: EdgeInsetsDirectional.only(bottom: 12.h),
                      child:  SponsorsWidget(
                        text:  Strings.beautyP.tr
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
