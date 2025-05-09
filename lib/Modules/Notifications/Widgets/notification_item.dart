import "package:Pretty/core/Language/locales.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:gap/gap.dart";
import "package:mvc_pattern/mvc_pattern.dart";
import "package:provider/provider.dart";
import "../../../../Utilities/text_style_helper.dart";
import "../../../../Utilities/theme_helper.dart";
import "../../../Utilities/strings.dart";
import "../../../generated/assets.dart";
import "../notifications_controller.dart";


enum NotificationType {
  reminder,
  feedback,
}
class ShowNotificationItem extends StatefulWidget {
  final Widget? button;
  final NotificationType notificationType;
  const ShowNotificationItem({
    super.key, this.button, required this.notificationType,
  });

  @override
  createState() => ShowNotificationItemState();
}

class ShowNotificationItemState extends StateMVC<ShowNotificationItem> {
  ShowNotificationItemState() : super(NotificationsController()) {
    con = NotificationsController();
  }

  late NotificationsController con;
  int notificationIsRead = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print("Rendering notification: ${widget.notificationModel.id}");
    print("isss reaaad${notificationIsRead}");
    return GestureDetector(
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
                      // if (widget.notificationType == NotificationType.feedback)
                      //   widget.button ?? const SizedBox(),
                    ],
                  )
                ],
              ),
              Gap(8.h),

              if (widget.notificationType == NotificationType.feedback)

              widget.button ?? const SizedBox(),
            ],
          ),

        ),
      ),
    );
  }

  // Row(
  // mainAxisAlignment: MainAxisAlignment.center,
  // children: [
  // GestureDetector(
  // onTap: onButtonReject,
  // child: Container(
  // width: 128.5.w,
  // height: 32.h,
  // decoration: BoxDecoration(
  // border:
  // Border.all(color: ThemeClass.of(context).labelColor.withAlpha((0.6 * 255).toInt())),
  // borderRadius: BorderRadius.circular(12.r),
  // ),
  // child: Center(
  // child: Padding(
  // padding:  EdgeInsetsDirectional.only(top: 2.h),
  // child: Text(
  // Strings.cancel.tr,
  // style: TextStyleHelper.of(context).h_14.copyWith(
  // color: ThemeClass.of(context).labelColor.withAlpha((0.6 * 255).toInt())),
  // ),
  // ),
  // ),
  // ),
  // ),
  // Gap(8.w),
  // GestureDetector(
  // onTap: onButtonAccept,
  // child: Container(
  // width: 128.5.w,
  // height: 32.h,
  // decoration: BoxDecoration(
  // borderRadius: BorderRadius.circular(12.r),
  // color: ThemeClass.of(context).primaryColor
  // // ThemeClass.of(context).background.withValues(0.20)
  // ),
  // //  backgroundColor: ThemeClass.of(context).primaryColor,
  // child: Center(
  // child: Padding(
  // padding:  EdgeInsetsDirectional.only(top: 2.h),
  // child: Text(
  // secondButtonText,
  // style: TextStyleHelper.of(context).h_14.copyWith(
  // color: ThemeClass.of(context).background,
  // ),
  // ),
  // ),
  // ),
  // ),
  // ),
  // ],
  // ),
}
