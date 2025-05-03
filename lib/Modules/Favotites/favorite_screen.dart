import 'package:Pretty/Modules/Favotites/widgets/favoriteCardWidget.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/strings.dart';
import '../../Widgets/bottom_navbar_widget.dart';
import '../../Widgets/container_empty_content_widget.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../../generated/assets.dart';
import 'favorite_controller.dart';

class FavoriteScreen extends StatefulWidget {
  static const routeName = "FavoriteScreen";

  const FavoriteScreen({super.key});

  @override
  createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends StateMVC<FavoriteScreen> {
  _FavoriteScreenState() : super(FavoriteController()) {
    con = FavoriteController();
  }

  late FavoriteController con;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBarWidget(
        selected: SelectedBottomNavBar.favorite,
      ),
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 24.w, vertical: 16.h),
              child: con.isLogin
                  ? Padding(
                      padding: EdgeInsetsDirectional.only(top: 12.h),
                      child: Wrap(
                        spacing: 8.w,
                        runSpacing: 8.h,
                        children: List.generate(10, (index) {
                          return const FavoriteCardWidget();
                        }),
                      ),
                    )
                  : ContainerEmptyContentWidget(
                      image: Assets.imagesNoFavorites,
                      mainText: Strings.noFavorite.tr,
                      descText: Strings.canAddFavorite.tr,
                    )),
        ),
      ),
    );
  }
}
