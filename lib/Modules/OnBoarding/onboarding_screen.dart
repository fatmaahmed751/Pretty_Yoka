import 'package:Pretty/Modules/OnBoarding/widgets/on_boarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Utilities/theme_helper.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../../generated/assets.dart';
import '../SelectRole/select_role_screen.dart';
import 'onboarding_controller.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = "OnBoarding";

  const OnBoardingScreen({super.key});

  @override
  createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends StateMVC<OnBoardingScreen> {
  _OnBoardingScreenState() : super(OnBoardingController()) {
    con = OnBoardingController();
  }

  late OnBoardingController con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.of(context).background,
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Column(
            //alignment: AlignmentDirectional.bottomCenter,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: con.controller,
                  onPageChanged: (int index) {
                    setState(() {
                      con.index = index;
                      con.isLast = index == con.onBoarding.length - 1;
                    });
                  },
                  itemBuilder: (context, index) => OnBoardingWidget(
                    activeIndex: con.index,
                    pageController: con.controller,
                    totalItems: con.onBoarding.length,
                    model: con.onBoarding[index],
                    onBackPressed: () {
                      // Navigate to the previous page
                      if (con.index > 0) {
                        con.onPrevious();
                      }
                    },
                  ),
                  itemCount: con.onBoarding.length,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    bottom: con.index == 1 ? 55.h : 3.h),
                child: CustomButtonWidget.primary(
                    height: 50.h,
                    width: 50.w,
                    radius: 30.r,
                    child: SvgPicture.asset(Assets.imagesWhiteArrow),
                    onTap: () {
                      (con.isLast)
                          ? GoRouter.of(context)
                              .goNamed(SelectRoleScreen.routeName)
                          : con.onNext();
                    }),
              ),
              Gap(con.index == 1 ? 10.h : 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
