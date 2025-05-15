import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../Utilities/dialog_helper.dart';
import '../../../Utilities/shared_preferences.dart';
import '../../../Utilities/strings.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../Widgets/custom_side_text_widget.dart';
import '../../../Widgets/toast_helper.dart';
import '../../../generated/assets.dart';

class FavoriteCardWidget extends StatelessWidget {
  const FavoriteCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //    GoRouter.of(context).pushNamed(ServiceDetailsScreen.routeName);
      },
      child: Container(
        //  height: 247.h,
        width: 157.w,
        decoration: BoxDecoration(
          color: ThemeClass.of(context).background,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: ThemeClass.of(context).waiting,
              //    spreadRadius: 0.3,
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: 4.h),
                    child: Center(
                      child: CircleAvatar(
                        radius: 30.r,
                        backgroundImage: const AssetImage(
                            Assets.imagesFavoriteServiceProvider),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ToastHelper.showSuccess(
                          message: Strings.success.tr,
                          icon: SvgPicture.asset(Assets.imagesCheckBox),
                          secondMessage: Strings.removeFromFavorite.tr,
                          context: context);
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 4.h),
                      child: Transform.flip(
                        flipX: SharedPref.getCurrentLanguage() == "ar"
                            ? true
                            : false,
                        child: Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                              horizontal: 4.w, vertical: 4.h),
                          child: SvgPicture.asset(Assets.imagesRedFavIcon),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(12.h),
              Text(
                Strings.serviceProviderName.tr,
                style: TextStyleHelper.of(context).h_13.copyWith(
                    color: ThemeClass.of(context).secondaryBlackColor),
              ),
              Gap(4.h),
              Text(
                Strings.makeUpArtist.tr,
                style: TextStyleHelper.of(context).b_12.copyWith(
                    color: ThemeClass.of(context).secondaryBlackColor),
              ),
              Gap(2.h),
              Row(
                children: [
                  SvgPicture.asset(Assets.imagesStarIcon),
                  Gap(2.w),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text(
                      "4.5",
                      style: TextStyleHelper.of(context)
                          .b_12
                          .copyWith(color: ThemeClass.of(context).labelColor),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "(${"44"})",
                    style: TextStyleHelper.of(context)
                        .b_12
                        .copyWith(color: ThemeClass.of(context).labelColor),
                  ),
                ],
              ),
              // Gap(8.h),
            ],
          ),
        ),
      ),
    );
  }
}
