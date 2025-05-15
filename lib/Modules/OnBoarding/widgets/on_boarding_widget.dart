import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../Utilities/text_style_helper.dart';
import '../../../../Utilities/theme_helper.dart';
import '../../../Models/on_boarding_model.dart';
import "../../../Utilities/shared_preferences.dart";
import '../../../Widgets/custom_button_widget.dart';
import '../../../generated/assets.dart';

class OnBoardingWidget extends StatelessWidget {
  final OnBoardingModel model;
  final VoidCallback onBackPressed;
  final int activeIndex; // Add this to track the current index
  final PageController pageController; // Pass the PageController here
  final int totalItems;
  const OnBoardingWidget(
      {super.key,
      required this.model,
      required this.onBackPressed,
      required this.activeIndex,
      required this.pageController,
      required this.totalItems});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(Assets.imagesBackground),
        ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {
                    // GoRouter.of(context).goNamed(HomeScreen.routeName);
                    // if(!SharedPref.isLogin()){
                    //   SharedPref.prefs.clear();
                    // }
                  },
                  child: Text(
                    model.skipText,
                    style: TextStyleHelper.of(context).b_16.copyWith(
                        color: ThemeClass.of(context).secondaryBlackColor),
                  )),
            ),
            Gap( model.id == 3?100.h:110.h),
            Padding(
              padding:  EdgeInsetsDirectional.symmetric(horizontal: 24.w),
              child: Container(
              //  color: Colors.red,
                child: Image.asset(
                  model.imageName,
                  width: model.id == 1 ? 314.w : 374.w,
                  height: model.id == 1 ? 300.h : 335.h,
                ),
              ),
            ),
            Gap( model.id ==1?32.h:0.h),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
              child: Container(
             // color: Colors.red,
                child: Stack(
                  children: [
                    Image.asset(
                      Assets.imagesContainer,
                      width: 327.w,
                      height:model.id==1?169.h: 220.h,
                    ),
                    Positioned(
                      top:model.id==1? 10:25,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 12.w, vertical: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              model.mainText,
                              style: TextStyleHelper.of(context).h_15.copyWith(
                                  color: ThemeClass.of(context)
                                      .secondaryBlackColor),
                            ),
                            Gap(8.h),
                            Text(
                              textAlign: TextAlign.center,
                              model.subText,
                              style: TextStyleHelper.of(context).b_16.copyWith(
                                  color: ThemeClass.of(context).labelColor),
                            ),
                            Gap(
                                model.id == 1 && SharedPref.getCurrentLanguage() == "en"
                                    ? 16.h
                                    : model.id == 1 && SharedPref.getCurrentLanguage() == "ar"
                                    ? 16.h
                                    : 8.h
                            ),
                            SmoothPageIndicator(
                              controller: pageController, // PageController
                              count: totalItems,
                              effect: ExpandingDotsEffect(
                                dotHeight: 8.h,
                                dotWidth: 8.w,
                                radius: 8.r,
                                spacing: 4.w,
                                activeDotColor:
                                    ThemeClass.of(context).primaryColor,
                                dotColor: ThemeClass.of(context).waiting,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ],
    );
  }
}
