import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import "../Modules/Home/home_screen.dart";
import '../Utilities/strings.dart';
import '../Utilities/theme_helper.dart';
import '../generated/assets.dart';

class BottomNavBarWidget extends StatefulWidget {
  final SelectedBottomNavBar selected;

  const BottomNavBarWidget({Key? key, required this.selected})
      : super(key: key);

  @override
  createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends StateMVC<BottomNavBarWidget> {
  void initState() {
    super.initState();
  }

  int selectedLanguage = 1;
  @override

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth / BottomNavBarItemModel.screens.length;
    final selectedPosition = widget.selected.index * itemWidth;

    return Stack(
      children: [
        // Main BottomNavigationBar Container
        Container(
          height: 72.h,
          decoration: BoxDecoration(
            color: ThemeClass.of(context).background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            boxShadow: [
              BoxShadow(
                color: ThemeClass.of(context).waiting,
                blurRadius: 0.5,
                spreadRadius: 0.5,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            child: BottomNavigationBar(
              backgroundColor: ThemeClass.of(context).background,
              currentIndex: widget.selected.index,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: ThemeClass.of(context).primaryColor,
              unselectedItemColor: ThemeClass.of(context).secondaryBlackColor,
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
        ),

        // Top Line Indicator (Positioned at the very top of the container)
        Positioned(
          top: 0, // Places the line at the top edge of the container
          left: selectedPosition + (itemWidth / 2) - 25.w, // Centers the line under the icon
          child: Container(
            width: 56.w, // Adjust width as needed
            height:2.h, // Line thickness
            decoration: BoxDecoration(
              color: ThemeClass.of(context).primaryColor,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ),
      ],
    );
  }


  Widget buildSelectedIcon(BottomNavBarItemModel item, BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 6.h),
        child: SvgPicture.asset(
          item.selectedIconPath,
          colorFilter: ColorFilter.mode(
              ThemeClass.of(context).primaryColor, BlendMode.srcIn),
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
            ThemeClass.of(context).secondaryBlackColor,
            BlendMode.srcIn),
      ),
    );
  }
}

class BottomNavBarItemModel {
  final String iconPath;
  final String selectedIconPath;
  final String title;
  final String routeName;
  final SelectedBottomNavBar type;

  BottomNavBarItemModel({
    required this.iconPath,
    required this.selectedIconPath,
    required this.title,
    required this.routeName,
    required this.type,
  });

  static List<BottomNavBarItemModel> screens = [
    home,
    favorite,
    cart,
    booking,
    account,
  ];

  static BottomNavBarItemModel home = BottomNavBarItemModel(
    iconPath: Assets.imagesHomeNavBar,
    selectedIconPath: Assets.imagesHomeNavBar,
    title: Strings.home,
    routeName: HomeScreen.routeName,
    type: SelectedBottomNavBar.home,
  );

  static BottomNavBarItemModel favorite = BottomNavBarItemModel(
    iconPath: Assets.imagesFavNavBar,
    selectedIconPath: Assets.imagesFavNavBar,
    title: Strings.favorite,
    routeName: FavoriteScreen.routeName,
    type: SelectedBottomNavBar.favorite,
  );

  static BottomNavBarItemModel cart = BottomNavBarItemModel(
    iconPath: Assets.imagesCartNavBar,
    selectedIconPath: Assets.imagesCartNavBar,
    title: Strings.cart,
    routeName: CartScreen.routeName,
    type: SelectedBottomNavBar.cart,
  );
  static BottomNavBarItemModel booking = BottomNavBarItemModel(
    iconPath: Assets.imagesBookNavBar,
    selectedIconPath: Assets.imagesBookNavBar,
    title: Strings.booking,
    routeName: BookingsScreen.routeName,
    type: SelectedBottomNavBar.booking,
  );
  static BottomNavBarItemModel account = BottomNavBarItemModel(
    iconPath: Assets.imagesProfileNavBar,
    selectedIconPath: Assets.imagesProfileNavBar,
    title: Strings.profile,
    routeName: UserProfileScreen.routeName,
    type: SelectedBottomNavBar.account,
  );
}

enum SelectedBottomNavBar {
  home,
  favorite,
  cart,
  booking,
  account,
}
