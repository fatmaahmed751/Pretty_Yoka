
import 'package:Pretty/Modules/Bookings/widgets/ongoing_service_widget.dart';
import 'package:Pretty/Modules/Bookings/widgets/previous_service_widget.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import '../../Widgets/bottom_navbar_widget.dart';
import '../../Widgets/container_empty_content_widget.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../../generated/assets.dart';
import 'bookings_controller.dart';

class BookingsScreen extends StatefulWidget {
  static const routeName = "Bookings";
  const BookingsScreen({
    super.key,
  });

  @override
  createState() => _BookingsScreenState();
}

class _BookingsScreenState extends StateMVC<BookingsScreen> {
  _BookingsScreenState() : super(BookingsController()) {
    con = BookingsController();
  }

  late BookingsController con;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget.mainScreen(title: "", space: 1),
      bottomNavigationBar: const BottomNavBarWidget(
        selected: SelectedBottomNavBar.booking,
      ),
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Padding(
            padding:
                EdgeInsetsDirectional.only(start: 24.w, end: 24.w, top: 24.h),
            child: con.isLogin
                ? ContainerEmptyContentWidget(
                    image: Assets.imagesNoBookingP,
                    mainText: Strings.noBookingYet.tr,
                    descText: Strings.exploreService.tr,
                    button: CustomButtonWidget.primary(
                        height: 36.h,
                        width: 189.w,
                        radius: 20.r,
                        title: Strings.exploreServices.tr,
                        textStyle: TextStyleHelper.of(context)
                            .h_15
                            .copyWith(color: ThemeClass.of(context).background),
                        onTap: () {
                          // GoRouter.of(context)
                          //     .goNamed(AllServicesScreen.routeName);
                          // SharedPref.getCurrentUser()!
                          //         .token!
                          //         .isNotEmpty
                          //     ? GoRouter.of(context)
                          //         .pushNamed(HomeScreen.routeName,)
                          //     : GoRouter.of(context).pushNamed(
                          //         RegisterScreen.routeName);
                        }),
                  )
                : CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        //    children: [
                        child: Column(
                          children: [
                            toggleListsOfServiceState(),
                            Gap(16.h),
                            con.isClick ?
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height,
                              child: ListView.separated(
                                  itemBuilder: (context, index) =>
                                      const PendingServiceWidget(),
                                  separatorBuilder: (context, index) =>
                                      Gap(12.h),
                                  itemCount: 5),
                            ):
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height,
                              child: ListView.separated(
                                  itemBuilder: (context, index) =>
                                  const PreviousServiceWidget(),
                                  separatorBuilder: (context, index) =>
                                      Gap(12.h),
                                  itemCount: 5),
                            ),
                          ],
                        ),
                      ),
                    ]),
          ),
        ),
      ),
    );
  }

  Widget toggleListsOfServiceState() => Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                con.isClick = !con.isClick;
              });
            },
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(
                  vertical: 0.h, horizontal: 0.w),
              width: 157.5.w,
              height: 36.h,
              decoration: BoxDecoration(
                  color: con.isClick
                      ? ThemeClass.of(context).primaryColor
                      : Colors.transparent,
                  border: Border.all(
                      color: con.isClick
                          ? Colors.transparent
                          : ThemeClass.of(context).secondaryBlackColor),
                  borderRadius: BorderRadius.circular(20.r)),
              clipBehavior: Clip.hardEdge,
              child: Text(
                Strings.pending.tr,
                textAlign: TextAlign.center,
                style: TextStyleHelper.of(context).h_15.copyWith(
                    fontWeight: FontWeight.w600,
                    color: !con.isClick
                        ? ThemeClass.of(context).mainBlack
                        : ThemeClass.of(context).background),
              ),
            ),
          ),
          Gap(8.w),
          GestureDetector(
            onTap: () {
              setState(() {
                con.isClick = !con.isClick;
              });
            },
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 0.w, vertical: 0.h),
              width: 157.5.w,
              height: 36.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: !con.isClick
                    ? ThemeClass.of(context).primaryColor
                    : ThemeClass.of(context).background,
                border: Border.all(
                    color: !con.isClick
                        ? Colors.transparent
                        : ThemeClass.of(context).mainBlack),
              ),
              clipBehavior: Clip.hardEdge,
              child: Text(
                Strings.previous.tr,
                textAlign: TextAlign.center,
                style: TextStyleHelper.of(context).h_15.copyWith(
                    fontWeight: FontWeight.w600,
                    color: !con.isClick
                        ? ThemeClass.of(context).background
                        : ThemeClass.of(context).mainBlack),
              ),
            ),
          ),
        ],
      );
}
