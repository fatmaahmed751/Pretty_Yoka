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
            borderRadius: BorderRadius.circular(20.r)),
        child: Padding(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(top: 2.h),
                child: Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                        color: ThemeClass.of(context).mainSecondary),
                    // ThemeClass.of(context).pinkColor
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 6.w, vertical: 6.h),
                    child: SvgPicture.asset(
                      Assets.imagesNotificationsIcon,
                      width: 15.w,
                      height: 15.h,
                      colorFilter: ColorFilter.mode(
                          ThemeClass.of(context).mainSecondary,
                          BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
              Gap(8.w),
              Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.offers.tr,
                    style: TextStyleHelper.of(context)
                        .h_15
                        .copyWith(color: ThemeClass.of(context).mainBlack),
                  ),
                  SizedBox(
                    width: 245.w,
                    child: Text(
                      Strings.descNotification.tr,
                      style: TextStyleHelper.of(context).b_14.copyWith(
                          color:
                              ThemeClass.of(context).secondaryBlackColor),
                    ),
                  ),
                  Gap(2.h),
                  if (widget.notificationType == NotificationType.feedback)
                    widget.button ?? const SizedBox(),
                  Gap(8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     Gap(210.w),
                      Text(
                        "11:00 Am",
                        style: TextStyleHelper.of(context).b_14.copyWith(
                            color: ThemeClass.of(context).secondaryBlackColor),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
