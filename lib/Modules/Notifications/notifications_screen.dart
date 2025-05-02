
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
      appBar: CustomAppBarWidget.detailsScreen(
        title: Strings.notification.tr,
        space: 90.w,
      ),
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 24.w, vertical: 8.h),
            child: con.isLogin
                ? ListView.separated(
                    itemBuilder: (context, index) =>
                         ShowNotificationItem(
                         notificationType: NotificationType.feedback,
                          button: CustomButtonWidget.primary(
                              height: 44.h,
                              width: 270.w,
                              radius: 20.r,
                              textStyle: TextStyleHelper.of(context).h_12.copyWith(
                                color: ThemeClass.of(context).background
                              ),
                              title: Strings.writeFeedBack.tr,
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
                    itemCount: 3)
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
