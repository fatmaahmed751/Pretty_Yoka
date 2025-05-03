import 'package:Pretty/Modules/Bookings/widgets/pending_service_widget.dart';
import 'package:Pretty/Modules/Bookings/widgets/previous_service_widget.dart';
import 'package:Pretty/Modules/Bookings/widgets/upcoming_service_widget.dart';
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
                  )
                :CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTabSelector(
                        selectedTab: con.selectedTab,
                        onTabChanged: (tab) {
                          setState(() {
                            con.selectedTab = tab;
                          });
                        },
                      ),
                      Gap(16.h),
                    ],
                  ),
                ),
                (() {
                  switch (con.selectedTab) {
                    case BookingTab.pending:
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) => Padding(
                                padding:  EdgeInsetsDirectional.only(bottom:12.h),
                                child: const PendingServiceWidget(),
                              ),
                          childCount: 5,
                        ),
                      );
                    case BookingTab.upcoming:
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) => Padding(
                                padding:  EdgeInsetsDirectional.only(bottom:12.h),
                                child: const UpComingServiceWidget(),
                              ),
                          childCount: 5,
                        ),
                      );
                    case BookingTab.previous:
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) => Padding(
                                padding:  EdgeInsetsDirectional.only(bottom:12.h),
                                child: const PreviousServiceWidget(),
                              ),
                          childCount: 5,
                        ),
                      );
                  }
                })(),
              ],
            )

                // : CustomScrollView(
                //     physics: const BouncingScrollPhysics(),
                //     slivers: [
                //       SliverToBoxAdapter(
                //         //hasScrollBody: false,
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             CustomTabSelector(
                //               selectedTab: con.selectedTab,
                //               onTabChanged: (tab) {
                //                 setState(() {
                //                   con.selectedTab = tab;
                //                 });
                //               },
                //             ),
                //             Gap(16.h),
                //             (() {
                //               switch (con.selectedTab) {
                //                 case BookingTab.pending:
                //                   return ListView.separated(
                //                   //  shrinkWrap: true,
                //                     physics: const NeverScrollableScrollPhysics(),
                //                     itemCount: 5,
                //                     separatorBuilder: (context,index) => Gap(12.h),
                //                     itemBuilder: (context,index)  => const PendingServiceWidget(),
                //                   );
                //                 case BookingTab.upcoming:
                //                   return ListView.separated(
                //                    // shrinkWrap: true,
                //                     physics: const NeverScrollableScrollPhysics(),
                //                     itemCount: 5,
                //                     separatorBuilder: (context,index) => Gap(12.h),
                //                     itemBuilder: (context,index)  => const UpComingServiceWidget(),
                //                   );
                //                 case BookingTab.previous:
                //                   return ListView.separated(
                //                   //  shrinkWrap: true,
                //                     physics: const NeverScrollableScrollPhysics(),
                //                     itemCount: 5,
                //                     separatorBuilder: (context,index) => Gap(12.h),
                //                     itemBuilder: (context,index)  =>  const PreviousServiceWidget(),
                //                   );
                //               }
                //             })(),
                //           ],
                //         ),
                //       ),
                //         // SliverToBoxAdapter(
                //         //   //    children: [
                //         //   child: Column(
                //         //     children: [
                //         //       CustomTabSelector(
                //         //         selectedTab: con.selectedTab,
                //         //         onTabChanged: (tab) {
                //         //           setState(() {
                //         //             con.selectedTab = tab;
                //         //           });
                //         //         },
                //         //       ),
                //         //       Gap(16.h),
                //         //       Expanded(
                //         //         child:
                //         //      (() {
                //         //           switch (con.selectedTab) {
                //         //             case BookingTab.pending:
                //         //               return ListView.separated(
                //         //                 shrinkWrap: true,
                //         //                 physics: const NeverScrollableScrollPhysics(),
                //         //                 itemCount: 5,
                //         //                 separatorBuilder: (context, index) =>
                //         //                     Gap(12.h),
                //         //                 itemBuilder: (context, index) =>
                //         //                     const PendingServiceWidget(),
                //         //               );
                //         //             case BookingTab.upcoming:
                //         //               return ListView.separated(
                //         //                 shrinkWrap: true,
                //         //                 physics: const NeverScrollableScrollPhysics(),
                //         //                 itemCount: 5,
                //         //                 separatorBuilder: (context, index) =>
                //         //                     Gap(12.h),
                //         //                 itemBuilder: (context, index) =>
                //         //                     const UpComingServiceWidget(),
                //         //               );
                //         //             case BookingTab.previous:
                //         //               return ListView.separated(
                //         //                 shrinkWrap: true,
                //         //                 physics: const NeverScrollableScrollPhysics(),
                //         //                 itemCount: 5,
                //         //                 separatorBuilder: (context, index) =>
                //         //                     Gap(12.h),
                //         //                 itemBuilder: (context, index) =>
                //         //                     const PreviousServiceWidget(),
                //         //               );
                //         //           }
                //         //       })(),
                //         //       ),
                //         //     ],
                //         //   ),
                //         // ),
                //       ]),
          ),
        ),
      ),
    );
  }
}

enum BookingTab {
  pending,
  upcoming,
  previous;
}

class CustomTabSelector extends StatelessWidget {
  final BookingTab selectedTab;
  final ValueChanged<BookingTab> onTabChanged;

  const CustomTabSelector({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
     // padding: EdgeInsets.symmetric(horizontal: 6.w),
      decoration: BoxDecoration(
        color: ThemeClass.of(context).textFieldBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: BookingTab.values.map((tab) {
          final title = tab == BookingTab.pending
              ? Strings.pending.tr
              : tab == BookingTab.upcoming
                  ? Strings.upComing.tr
                  : Strings.previous.tr;

          final isSelected = tab == selectedTab;

          return Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(tab),
              child: Container(
                width:101.w ,
                height: 40.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? ThemeClass.of(context).primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  title,
                  style: TextStyleHelper.of(context).h_13.copyWith(
                        color: isSelected
                            ? ThemeClass.of(context).background
                            : ThemeClass.of(context).mainBlack,
                      ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Widget toggleListsOfServiceState() => Container(
//   width: 327.w,
//   height:43.h,
//   decoration: BoxDecoration(
//     color: ThemeClass.of(context).textFieldBackground,
//     borderRadius: BorderRadius.circular(12.r)
//   ),
//   child: Row(
//         children: [
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 con.isClick = !con.isClick;
//               });
//             },
//             child: Container(
//               padding: EdgeInsetsDirectional.symmetric(
//                   vertical: 0.h, horizontal: 0.w),
//               width: 101.w,
//               height: 38.h,
//               decoration: BoxDecoration(
//                   color: con.isClick
//                       ? ThemeClass.of(context).primaryColor
//                       : Colors.transparent,
//                   border: Border.all(
//                       color: Colors.transparent),
//                   borderRadius: BorderRadius.circular(12.r)),
//               clipBehavior: Clip.hardEdge,
//               child: Center(
//                 child: Text(
//                   Strings.pending.tr,
//                   textAlign: TextAlign.center,
//                   style: TextStyleHelper.of(context).h_13.copyWith(
//                       color: !con.isClick
//                           ? ThemeClass.of(context).mainBlack
//                           : ThemeClass.of(context).background),
//                 ),
//               ),
//             ),
//           ),
//           Gap(12.w),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 con.isClick = !con.isClick;
//               });
//             },
//             child: Container(
//               padding: EdgeInsetsDirectional.symmetric(
//                   horizontal: 0.w, vertical: 0.h),
//               width: 101.w,
//                height: 38.h,
//               decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(12.r),
//                 color: !con.isClick
//                     ? ThemeClass.of(context).primaryColor
//                     : Colors.transparent,
//                 // border: Border.all(
//                 //     color: !con.isClick
//                 //         ? Colors.transparent
//                 //         : ThemeClass.of(context).mainBlack),
//               ),
//               clipBehavior: Clip.hardEdge,
//               child: Center(
//                 child: Text(
//                   Strings.upComing.tr,
//                   textAlign: TextAlign.center,
//                   style: TextStyleHelper.of(context).h_13.copyWith(
//                       color: !con.isClick
//                           ? ThemeClass.of(context).background
//                           : ThemeClass.of(context).mainBlack),
//                 ),
//               ),
//             ),
//           ),
//           Gap(12.w),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 con.isClick = !con.isClick;
//               });
//             },
//             child: Container(
//               padding: EdgeInsetsDirectional.symmetric(
//                   horizontal: 0.w, vertical: 0.h),
//               width: 101.w,
//               height: 38.h,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12.r),
//                 // border: Border.all(
//                 //     color: !con.isClick
//                 //         ? Colors.transparent
//                 //         : ThemeClass.of(context).mainBlack),
//               ),
//               clipBehavior: Clip.hardEdge,
//               child: Center(
//                 child: Text(
//                   Strings.previous.tr,
//                   textAlign: TextAlign.center,
//                   style: TextStyleHelper.of(context).h_13.copyWith(
//                       color: !con.isClick
//                           ? ThemeClass.of(context).background
//                           : ThemeClass.of(context).mainBlack),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
// );
//}
