
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Widgets/loading_screen.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import '../../Widgets/container_empty_content_widget.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../generated/assets.dart';
import 'Widgets/notification_item.dart';
import 'notifications_controller.dart';

class NotificationsScreen extends StatefulWidget {
  static const routeName = "Notifications";

  const NotificationsScreen({
    super.key,
  });

  @override
  createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends StateMVC<NotificationsScreen> {
  _NotificationsScreenState() : super(NotificationsController()) {
    con = NotificationsController();
  }
  late NotificationsController con;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBarWidget.detailsScreen(
      //   title: Strings.notification.tr,
      //   space: 90.w,
      // ),
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 24.w, ),
            child: con.isLogin
                ? Column(
                  children: [
                    Gap(12.h),
                    CustomAppBarWidget.mainScreen(
                      title: Strings.notification.tr,
                      space:95.w,
                    ),
                    Gap(24.h),
                    GestureDetector(
                      onTap: () async {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: ThemeClass.of(context).textFieldBackground,
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 12.h),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius:20.r,
                                    backgroundImage: const AssetImage(
                                        Assets.imagesFavoriteServiceProvider),
                                  ),
                                  Gap(8.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Strings.serviceProviderName.tr,
                                        style: TextStyleHelper.of(context)
                                            .h_13
                                            .copyWith(color: ThemeClass.of(context).mainBlack),
                                      ),
                                      SizedBox(
                                        width: 245.w,
                                        child: Text(
                                          Strings.descNotification.tr,
                                          style: TextStyleHelper.of(context).b_12.copyWith(
                                              color:
                                              ThemeClass.of(context).labelColor),
                                        ),
                                      ),
                                      Gap(2.h),

                                    ],
                                  ),
                                ],
                              ),
                              Gap(8.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      width: 151.5.w,
                                      height: 29.h,
                                      decoration: BoxDecoration(
                                        border:
                                        Border.all(color: ThemeClass.of(context).labelColor.withAlpha((0.6 * 255).toInt())),
                                        borderRadius: BorderRadius.circular(12.r),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding:  EdgeInsetsDirectional.only(top: 2.h),
                                          child: Text(
                                            Strings.reject.tr,
                                            style: TextStyleHelper.of(context).h_14.copyWith(
                                                color: ThemeClass.of(context).labelColor.withAlpha((0.6 * 255).toInt())),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(8.w),
                                  GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      width: 151.5.w,
                                      height: 29.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.r),
                                          color: ThemeClass.of(context).primaryColor
                                        // ThemeClass.of(context).background.withValues(0.20)
                                      ),
                                      //  backgroundColor: ThemeClass.of(context).primaryColor,
                                      child: Center(
                                        child: Padding(
                                          padding:  EdgeInsetsDirectional.only(top: 2.h),
                                          child: Text(
                                            Strings.accept.tr,
                                            style: TextStyleHelper.of(context).h_14.copyWith(
                                              color: ThemeClass.of(context).background,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ),
                      ),
                    ),
                    Gap(8.h),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) =>
                               ShowNotificationItem(
                               notificationType: NotificationType.feedback,
                                button: CustomButtonWidget.primary(
                                    height: 29.h,
                                    width: 311.w,
                                    radius: 20.r,
                                    textStyle: TextStyleHelper.of(context).h_14.copyWith(
                                      color: ThemeClass.of(context).background
                                    ),
                                    title: Strings.rating.tr,
                                    onTap: () {
                                      con.sendFeedBackSuccess();
                                      // SharedPref.getCurrentUser()!
                                      //         .token!
                                      //         .isNotEmpty
                                      //     ? GoRouter.of(context)
                                      //         .pushNamed(HomeScreen.routeName,)
                                      //     : GoRouter.of(context).pushNamed(
                                      //         RegisterScreen.routeName);
                                    }),
                              ),

                          separatorBuilder: (context, index) => Gap(12.h),
                          itemCount: 4),
                    ),
                  ],
                )
                : ContainerEmptyContentWidget(
                    image: Assets.imagesNoNotification,
                    mainText: Strings.notNotificationsYet.tr,
                    descText: Strings.notReceiveNotification.tr,
                    // ): ListView.separated(
                    //     itemBuilder: (context,index)=>const ShowNotificationItem(
                    //     ),
                    //     separatorBuilder: (context,index)=>Gap(12.h),
                    //     itemCount: 3),
                  ),
          ),
        ),
      ),
    );
  }
}
