import 'package:Pretty/Modules/ServiceProviderHome/service_provider_home_controller.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import '../../Widgets/customSolidSideText.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../../Widgets/service_bottom_navbar_widget.dart';
import '../../Widgets/sponsers_widget.dart';
import '../../generated/assets.dart';
import '../ServiceProviderSponsers/service_provider_sponsors_screen.dart';
import '../Sponsors/sponsors_screen.dart';

class ServiceProviderHomeScreen extends StatefulWidget {
  static const routeName = "ServiceProviderHomeScreen";
  const ServiceProviderHomeScreen({super.key});

  @override
  _ServiceProviderHomeScreenState createState() => _ServiceProviderHomeScreenState();
}

class _ServiceProviderHomeScreenState extends StateMVC<ServiceProviderHomeScreen> {
  _ServiceProviderHomeScreenState() : super(ServiceProviderHomeController()) {
    con = ServiceProviderHomeController();
  }

  late ServiceProviderHomeController con;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///TODO
    return Scaffold(
      appBar: const CustomAppBarWidget.detailsScreen(
        title: "",
        space: 1,
      ),
      bottomNavigationBar:  const ServiceBottomNavBarWidget(
        selected: ServiceSelectedBottomNavBar.home,
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SafeArea(
          child: LoadingScreen(
            loading: con.loading,
            // color: Colors.transparent,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(20.h),
                      Image.asset(
                        con.imageAssets[con.currentIndex],
                        width: 379.w,
                        height: 178.h,
                        fit: BoxFit.cover,
                      ),
                      Gap(20.h),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                        child: Row(
                          children: [
                            CustomSolidSideTextWidget(
                              text: Strings.sponsors.tr,
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                  GoRouter.of(context).pushNamed(ServiceProviderSponsorsScreen.routeName);
                              },
                              child: Text(
                                Strings.viewAll.tr,
                                style: TextStyleHelper
                                    .of(context)
                                    .b_16
                                    .copyWith(
                                    decoration: TextDecoration.underline,
                                    color: ThemeClass
                                        .of(context)
                                        .primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(8.h),
                      Padding(
                       padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                        child: Text(Strings.nowCanBuy.tr,
                        style: TextStyleHelper.of(context).b_16.copyWith(
                          color: ThemeClass.of(context).labelColor
                        ),),
                      ),
                      Gap(16.h),
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                        child: Column(
                          children: List.generate(5, (index) {
                            return Padding(
                              padding: EdgeInsetsDirectional.only(bottom: 12.h),
                              child:  SponsorsWidget(
                                text:Strings.seif.tr
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      Gap(45.h)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

