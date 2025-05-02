import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import '../../../../Utilities/strings.dart';
import '../../../../Utilities/text_style_helper.dart';
import '../../../../Utilities/theme_helper.dart';
import '../../../../core/Language/app_languages.dart';
import '../../../../generated/assets.dart';
import '../../../Utilities/router_config.dart';
import '../../Home/home_screen.dart';
import '../user_profile_controller.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends StateMVC<ChangeLanguage> {
  _ChangeLanguageState() : super(UserProfileController()) {
    con = UserProfileController();
  }

  late UserProfileController con;
  int selectedIndex = -1;
  @override
  void initState() {
    super.initState();
    con.loadCurrentLanguage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 382.w,
      // height: 200.h,
      decoration: BoxDecoration(
        color: ThemeClass.of(context).background,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(vertical: 24.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal:18.w),
              child: Text(Strings.changeLanguage.tr ,
                  style: TextStyleHelper.of(context).h_16.copyWith(
                      color: ThemeClass.of(context).mainBlack,
                      )),
            ),
            //Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: con.selectedLanguage == 1
                      ? SvgPicture.asset(Assets.imagesCheckBox)
                      : SvgPicture.asset(Assets.imagesUnCheckBox),
                  onPressed: () {
                    setState(
                      () {
                        con.selectLanguage(1);
                      },
                    );
                  },
                ),
                Text(
                  Strings.english.tr,
                  style: TextStyleHelper.of(context)
                      .b_16
                      .copyWith(color: ThemeClass.of(context).secondaryBlackColor),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: con.selectedLanguage == 2
                      ?SvgPicture.asset(Assets.imagesCheckBox)
                      : SvgPicture.asset(Assets.imagesUnCheckBox),
                  onPressed: () {
                    setState(
                      () {
                        con.selectLanguage(2);
                      },
                    );
                  },
                ),
                Text(
                  Strings.arabic.tr,
                  style: TextStyleHelper.of(context)
                      .b_16
                      .copyWith(color: ThemeClass.of(context).secondaryBlackColor),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Container(
                      width: 135.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: ThemeClass.of(context).secondaryBlackColor),
                          borderRadius: BorderRadius.circular(20.r),

                          // ThemeClass.of(context).background.withValues(0.20)
                          ),
                      //  backgroundColor: ThemeClass.of(context).primaryColor,
                      child: Center(
                        child: Text(
                          Strings.cancel.tr,
                          style: TextStyleHelper.of(context).h_16.copyWith(
                              color:
                                  ThemeClass.of(context).secondaryBlackColor),
                        ),
                      ),
                    ),
                  ),
                  Gap(16.w),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        if (con.selectedLanguage == 1) {
                          Provider.of<AppLanguage>(context, listen: false)
                              .changeLanguage(language: Languages.en);
                        } else {
                          con.selectLanguage(2);
                          Provider.of<AppLanguage>(context, listen: false)
                              .changeLanguage(language: Languages.ar);
                        }
                      });
                      await Future.delayed(const Duration(milliseconds: 100));
                      currentContext_!.pushNamed(HomeScreen.routeName);

                      // await Future.delayed(const Duration(milliseconds: 200));
                      //  GoRouter.of(context).pushNamed(HomeScreen.routeName);
                    },
                    child: Container(
                      width: 135.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: ThemeClass.of(context).primaryColor),
                      child: Center(
                        child: Text(
                          Strings.save.tr,
                          style: TextStyleHelper.of(context).h_16.copyWith(
                                color: ThemeClass.of(context).background,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
