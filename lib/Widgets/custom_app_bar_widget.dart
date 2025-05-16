import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../Modules/Notifications/notifications_screen.dart';
import '../Utilities/shared_preferences.dart';
import '../Utilities/strings.dart';
import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';
import '../generated/assets.dart';
import 'custom_main_text_widget.dart';
import 'custom_side_text_widget.dart';

enum _AppBarType { main, mainDetails, details }

//
class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final _AppBarType _appBarType;
  final String screenName;
  final List<Widget>? actions;
  final String title;
  final String? icon;
  final double space;
  final void Function()? onPressed;
//
  const CustomAppBarWidget.mainScreen(

      // final void Function()? onPressed,
      {Key? key,
      this.onPressed,
      required this.title,
      this.icon,
      this.actions,
      required this.space})
      : _appBarType = _AppBarType.main,
        screenName = title,
        //actions = const [],
        super(key: key);
//
  const CustomAppBarWidget.detailsScreen({
    Key? key,
    required this.title,
    this.actions,
    this.onPressed,
    this.icon,
    required this.space,
  })  : _appBarType = _AppBarType.mainDetails,
        screenName = title,
        super(key: key);
//

  @override
  Widget build(BuildContext context) {
    switch (_appBarType) {
      case _AppBarType.main:
        return MainAppBarWidget(
          title: screenName, onPressed: onPressed, actions: [],
          space: space,
          //  () {  },
        );

      case _AppBarType.mainDetails:
        return MainDetailsAppBarWidget(
          title: screenName,
          onPressed: onPressed,
          actions: actions,
        );

      default:
        return Container();
    }
  }

//
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 1.h);
// }
}

class MainAppBarWidget extends StatelessWidget {
  final String title;
  final double space;
  final void Function()? onPressed;
  final List<Widget>? actions;
  const MainAppBarWidget(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.actions,
      required this.space})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.only(top: 4.h),
        child: Row(children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Transform.flip(
              flipX: SharedPref.getCurrentLanguage() == "ar" ? true : false,
              child: SvgPicture.asset(
                Assets.imagesArrowBack,
              ),
            ),
          ),
          Gap(space),
          Center(
              child: CustomMainTextWidget(
            text: title,
          )),
        ]));
  }
}

class MainDetailsAppBarWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final List<Widget>? actions;
  const MainDetailsAppBarWidget(
      {Key? key, required this.title, required this.onPressed, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 24.w, top: 50.h, end: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Text(
      "${Strings.welcome.tr},",
       // textAlign: TextAlign.center,
        style: TextStyleHelper.of(context)
            .h_24
            .copyWith(color: ThemeClass.of(context).secondaryBlackColor),
      ),
          Text(
              " Habiba",
            // textAlign: TextAlign.center,
            style: TextStyleHelper.of(context)
                .b_21
                .copyWith(color: ThemeClass.of(context).secondaryBlackColor),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).pushNamed(NotificationsScreen.routeName);
            },
            child: Center(
              child: SvgPicture.asset(
                Assets.imagesNotificationsIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondaryAppBarWidget extends StatelessWidget {
  final String title;
  final String? icon;
  // final VoidCallback? onDeleteIconToggle;
  const SecondaryAppBarWidget({
    Key? key,
    required this.title,
    this.icon,
    //this.onDeleteIconToggle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('SecondaryAppBarWidget rebuild with icon: ${widget.icon}');
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 10.w, top: 50.h),
      child: Container(
        // color: Colors.red,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(5.w),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 18.r,
                // backgroundColor:
                //     ThemeClass.of(context).background.withOpacity(0.20),
                child: Transform.flip(
                  flipX: SharedPref.getCurrentLanguage() == "ar" ? true : false,
                  child: SvgPicture.asset(
                    Assets.imagesArrowBack,
                  ),
                ),
              ),
            ),
            Gap(90.w),
            Spacer(),
            if (icon != null && icon!.isNotEmpty)
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
                child: IconButton(
                    icon: SvgPicture.asset(icon ?? ""), onPressed: () {}),
              ),
          ],
        ),
      ),
    );
  }
}
