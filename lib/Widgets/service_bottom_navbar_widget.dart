import 'package:Pretty/Modules/ServiceProviderHome/service_provider_home_screen.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Modules/Bookings/bookings_screen.dart';
import '../Modules/Favotites/favorite_screen.dart';
import "../Modules/Home/home_screen.dart";
import '../Modules/Profile/user_profile_screen.dart';
import '../Modules/ServiceProviderBookings/service_provider_bookings_screen.dart';
import '../Modules/ServiceProviderProfile/service_provider_profile_screen.dart';
import '../Modules/serviceProviderSettingsScreen/service_settings_screen.dart';
import '../Utilities/strings.dart';
import '../Utilities/theme_helper.dart';
import '../generated/assets.dart';

class ServiceBottomNavBarWidget extends StatefulWidget {
  final ServiceSelectedBottomNavBar selected;

  const ServiceBottomNavBarWidget({Key? key, required this.selected})
      : super(key: key);

  @override
  createState() => _ServiceBottomNavBarWidgetState();
}

class _ServiceBottomNavBarWidgetState extends StateMVC<ServiceBottomNavBarWidget> {
  void initState() {
    super.initState();
  }

  int selectedLanguage = 1;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth / BottomNavBarItemModel.screens.length;
    final selectedPosition = widget.selected.index * itemWidth;

    return Container(
      height: 72.h,
      decoration: BoxDecoration(
        color: ThemeClass.of(context).textFieldBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        boxShadow: [
          BoxShadow(
              color: ThemeClass.of(context)
                  .secondaryBlackColor
                  .withAlpha((0.16 * 255).toInt()),
              blurRadius: 0.5,
              spreadRadius: 0.5),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r),
        ),
        child: BottomNavigationBar(
          backgroundColor: ThemeClass.of(context).background,
          currentIndex: widget.selected.index,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ThemeClass.of(context).primaryColor,
          unselectedItemColor: ThemeClass.of(context).labelColor,
          onTap: (index) {
            context.pushNamed(BottomNavBarItemModel.screens[index].routeName);
          },
          items: BottomNavBarItemModel.screens.map((item) {
            final isSelected = item.type == widget.selected;
            return BottomNavigationBarItem(
              icon: isSelected
                  ? buildSelectedIcon(item, context)
                  : buildUnselectedIcon(item, context),
              label: item.title.tr,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildSelectedIcon(BottomNavBarItemModel item, BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 6.h),
        child: SvgPicture.asset(
          item.selectedIconPath,
          // colorFilter: ColorFilter.mode(
          //     ThemeClass.of(context).primaryColor, BlendMode.srcIn),
        ),
      ),
    );
  }

  Widget buildUnselectedIcon(BottomNavBarItemModel item, BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 6.h),
      child: SvgPicture.asset(
        item.iconPath,
        colorFilter: ColorFilter.mode(
            ThemeClass.of(context).labelColor, BlendMode.srcIn),
      ),
    );
  }
}

class BottomNavBarItemModel {
  final String iconPath;
  final String selectedIconPath;
  final String title;
  final String routeName;
  final ServiceSelectedBottomNavBar type;

  BottomNavBarItemModel({
    required this.iconPath,
    required this.selectedIconPath,
    required this.title,
    required this.routeName,
    required this.type,
  });

  static List<BottomNavBarItemModel> screens = [
    home,
    booking,
    profile,
    settings,
  ];

  static BottomNavBarItemModel home = BottomNavBarItemModel(
    iconPath: Assets.imagesHomeNoFill,
    selectedIconPath: Assets.imagesHomeNavBar,
    title: Strings.home,
    routeName: ServiceProviderHomeScreen.routeName,
    type: ServiceSelectedBottomNavBar.home,
  );

  static BottomNavBarItemModel booking = BottomNavBarItemModel(
    iconPath: Assets.imagesPrettyBookingIcon,
    selectedIconPath: Assets.imagesFillBooking,
    title: Strings.booking,
    routeName: ServiceProviderBookingsScreen.routeName,
    type: ServiceSelectedBottomNavBar.booking,
  );

  static BottomNavBarItemModel profile = BottomNavBarItemModel(
    iconPath: Assets.imagesProfileNavBar,
    selectedIconPath: Assets.imagesProfileFill,
    title: Strings.profile,
    routeName: ServiceProviderProfileScreen.routeName,
    type: ServiceSelectedBottomNavBar.profile,
  );
  static BottomNavBarItemModel settings = BottomNavBarItemModel(
    iconPath: Assets.imagesSettingsIcon,
    selectedIconPath: Assets.imagesSettingsFill,
    title: Strings.settings,
    routeName: ServiceProviderSettingsScreen.routeName,
    type: ServiceSelectedBottomNavBar.settings,
  );
}

enum ServiceSelectedBottomNavBar {
  home,
  booking,
  profile,
  settings,
}
