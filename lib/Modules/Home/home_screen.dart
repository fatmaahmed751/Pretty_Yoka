import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import '../../Widgets/bottom_navbar_widget.dart';
import '../../Widgets/category_widget.dart';
import '../../Widgets/customSolidSideText.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/custom_side_text_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../../generated/assets.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC<HomeScreen> {
  _HomeScreenState() : super(HomeController()) {
    con = HomeController();
  }

  late HomeController con;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget.detailsScreen(
        title: "",
        space: 1,
      ),
      bottomNavigationBar: const BottomNavBarWidget(
        selected: SelectedBottomNavBar.home,
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
                    children: [
                      Padding(
                        padding:  EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30.r,
                              backgroundImage: const AssetImage(
                                  Assets.imagesFavoriteServiceProvider),
                            ),
                            Gap(8.w),
                            Container(
                             width: 260.w,
                              height: 44.h,
                              decoration: BoxDecoration(
                                  color:
                                      ThemeClass.of(context).textFieldBackground,
                                  borderRadius: BorderRadius.circular(12.r)),
                              child: Padding(
                                padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: 16.w, vertical: 12.h),
                                child: Row(
                                  children: [
                                    Text(
                                      Strings.requestAnyService.tr,
                                      style: TextStyleHelper.of(context)
                                          .b_14
                                          .copyWith(
                                              color: ThemeClass.of(context)
                                                  .primaryColor),
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(Assets.imagesAddIcon)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(20.h),
                      Image.asset(Assets.imagesBanners,
                      width: 379.w,
                          height: 178.h,
                      fit: BoxFit.cover,),
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
                                //    GoRouter.of(context).pushNamed(AllServicesScreen.routeName);
                              },
                              child: Text(
                                Strings.viewAll.tr,
                                style: TextStyleHelper.of(context)
                                    .b_16
                                    .copyWith(
                                        decoration: TextDecoration.underline,
                                        color: ThemeClass.of(context)
                                            .primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(16.h),
                      Column(
                        children: List.generate(3,  (index) {
                          return   Padding(
                            padding:  EdgeInsetsDirectional.only(bottom: 12.h),
                            child: Container(
                              width:327.w ,
                              height: 56.h,
                              decoration: BoxDecoration(
                                  color: ThemeClass.of(context).background,
                                  borderRadius: BorderRadius.circular(12.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color: ThemeClass.of(context).waiting,
                                        blurRadius: 0.5,
                                        spreadRadius: 0.5
                                    ),
                                  ]
                              ),
                              child: Padding(
                                padding:  EdgeInsetsDirectional.symmetric(
                                  vertical: 8.h,),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30.r,
                                      backgroundImage: const AssetImage(
                                          Assets.imagesPharmacy),
                                    ),
                                    Gap(2.w),
                                    Text(Strings.pharmacies.tr,
                                      style: TextStyleHelper.of(context).h_13.copyWith(
                                          color: ThemeClass.of(context).secondaryBlackColor
                                      ),
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(Assets.imagesArrowForward),
                                    Gap(16.w)
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Gap(8.h),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                        child: Row(
                          children: [
                            CustomSolidSideTextWidget(
                              text: Strings.services.tr,
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                //    GoRouter.of(context).pushNamed(AllServicesScreen.routeName);
                              },
                              child: Text(
                                Strings.viewAll.tr,
                                style: TextStyleHelper.of(context)
                                    .b_16
                                    .copyWith(
                                    decoration: TextDecoration.underline,
                                    color: ThemeClass.of(context)
                                        .primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(12.h),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 20.w),
                        child: SizedBox(
                          height: 125.h,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => CategoryWidget(
                                    categoryModel: con.model[index],
                                  ),
                              separatorBuilder: (context, index) => Gap(8.w),
                              itemCount: con.model.length),
                        ),
                      ),
                      Gap(20.h),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                        child: Row(
                          children: [
                            CustomSolidSideTextWidget(
                              text: Strings.serviceProvider.tr,
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                //    GoRouter.of(context).pushNamed(AllServicesScreen.routeName);
                              },
                              child: Text(
                                Strings.viewAll.tr,
                                style: TextStyleHelper.of(context)
                                    .b_16
                                    .copyWith(
                                    decoration: TextDecoration.underline,
                                    color: ThemeClass.of(context)
                                        .primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(16.h),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 24.w),
                        child: SizedBox(
                          height: 200.h,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => Container(
                                width: 112.w,
                                height: 118.h,
                                decoration: BoxDecoration(
                                  color: ThemeClass.of(context).background
                                ),
                                child: Padding(
                                  padding:  EdgeInsetsDirectional.symmetric(
                                      horizontal: 8.w,
                                  vertical: 8.h),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 30.r,
                                        backgroundImage: const AssetImage(
                                            Assets.imagesFavoriteServiceProvider),
                                      ),
                                      Gap(8.h),
                                      Text(Strings.serviceProviderName.tr,
                                      style: TextStyleHelper.of(context)
                                          .h_13
                                          .copyWith(
                                          decoration: TextDecoration.underline,
                                          color: ThemeClass.of(context)
                                              .secondaryBlackColor),),
                                      Gap(8.h),
                                      Text(Strings.makeUpArtist.tr,
                                        style: TextStyleHelper.of(context)
                                            .b_12
                                            .copyWith(
                                            color: ThemeClass.of(context)
                                                .secondaryBlackColor),),
                                      Gap(8.h),
                                      Row(children: [
                                        SvgPicture.asset(Assets.imagesStarIcon),
                                        Gap(2.w),
                                        Text("4.5"),
                                        Spacer(),
                                        Text("(${"44"})")
                                      ],)
                                    ],
                                  ),
                                ),
                              ),
                              separatorBuilder: (context, index) => Gap(8.w),
                              itemCount: 3),
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
