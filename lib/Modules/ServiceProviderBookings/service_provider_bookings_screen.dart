import 'package:Pretty/Modules/ServiceProviderBookings/service_provider_bookings_controller.dart';
import 'package:Pretty/Modules/ServiceProviderBookings/widgets/service_pending_service_widget.dart';
import 'package:Pretty/Modules/ServiceProviderBookings/widgets/service_previous_service_widget.dart';
import 'package:Pretty/Modules/ServiceProviderBookings/widgets/service_upcoming_service_widget.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import '../../Widgets/bottom_navbar_widget.dart';
import '../../Widgets/container_empty_content_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../../Widgets/service_bottom_navbar_widget.dart';
import '../../generated/assets.dart';

class ServiceProviderBookingsScreen extends StatefulWidget {
  static const routeName = "ServiceProviderBookings";
  const ServiceProviderBookingsScreen({
    super.key,
  });

  @override
  createState() => _ServiceProviderBookingsScreenState();
}

class _ServiceProviderBookingsScreenState extends StateMVC<ServiceProviderBookingsScreen> {
  _ServiceProviderBookingsScreenState() : super(ServiceProviderBookingsController()) {
    con = ServiceProviderBookingsController();
  }

  late ServiceProviderBookingsController con;

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
      bottomNavigationBar:  const ServiceBottomNavBarWidget(
        selected: ServiceSelectedBottomNavBar.booking,
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
                        serviceSelectedTab: con.serviceSelectedTab,
                        onTabChanged: (tab) {
                          setState(() {
                            con.serviceSelectedTab = tab;
                          });
                        },
                      ),
                      Gap(16.h),
                    ],
                  ),
                ),
                (() {
                  switch (con.serviceSelectedTab) {
                    case ServiceBookingTab.pending:
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) => Padding(
                                padding:  EdgeInsetsDirectional.only(bottom:12.h),
                                child: const ServicePendingServiceWidget(),
                              ),
                          childCount: 5,
                        ),
                      );
                    case ServiceBookingTab.upcoming:
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) => Padding(
                                padding:  EdgeInsetsDirectional.only(bottom:12.h),
                                child: const UpComingServiceProviderWidget(),
                              ),
                          childCount: 5,
                        ),
                      );
                    case ServiceBookingTab.previous:
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) => Padding(
                                padding:  EdgeInsetsDirectional.only(bottom:12.h),
                                child: const PreviousServiceProviderWidget(),
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
                //               serviceSelectedTab: con.selectedTab,
                //               onTabChanged: (tab) {
                //                 setState(() {
                //                   con.selectedTab = tab;
                //                 });
                //               },
                //             ),
                //             Gap(16.h),
                //             (() {
                //               switch (con.selectedTab) {
                //                 case ServiceBookingTab.pending:
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

enum ServiceBookingTab {
  pending,
  upcoming,
  previous;
}

class CustomTabSelector extends StatelessWidget {
  final ServiceBookingTab serviceSelectedTab;
  final ValueChanged<ServiceBookingTab> onTabChanged;

  const CustomTabSelector({
    super.key,
    required this.serviceSelectedTab,
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
        children: ServiceBookingTab.values.map((tab) {
          final title = tab == ServiceBookingTab.pending
              ? Strings.pending.tr
              : tab == ServiceBookingTab.upcoming
                  ? Strings.upComing.tr
                  : Strings.previous.tr;

          final isSelected = tab == serviceSelectedTab;

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


