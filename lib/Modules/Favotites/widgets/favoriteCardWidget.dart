
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
import '../../../generated/assets.dart';


class FavoriteCardWidget extends StatelessWidget {
  const FavoriteCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
    //    GoRouter.of(context).pushNamed(ServiceDetailsScreen.routeName);

      },
      child: Container(
        //  height: 247.h,
        width: 159.w,
        decoration: BoxDecoration(
          color: ThemeClass.of(context).background,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: ThemeClass.of(context).waiting,
              spreadRadius: 0.3,
              blurRadius: 0.5,
            ),
          ],
        ),
        child: Padding(
          padding:
          EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: 169.5.w,
                    //height: 103.h,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                      // color: Colors.red,
                    ),

                    child: Image.asset(Assets.imagesFavoriteServiceProvider,
                      //height: 101.h,
                      // width: 150.5.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 4.w, vertical: 4.h),
                    child: Container(
                      width: 28.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                          color: ThemeClass.of(context).background,
                          borderRadius: BorderRadius.circular(8.r)),
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
              Gap(4.h),
              CustomSideTextWidget(
                text: Strings.serviceName.tr,
              ),
              //  Gap(2.h),
              Gap(2.h),
              Text(
                Strings.placeName.tr,
                style: TextStyleHelper.of(context).b_12.copyWith(
                    color: ThemeClass.of(context).mainBlack,
                    fontWeight: FontWeight.w400),
              ),
              Gap(2.h),
              Container(
                //color:Colors.yellow,
                child: Row(
                  children: [
                    SizedBox(
                        height: 13.h,
                        width: 13.w,
                        child: SvgPicture.asset(Assets.imagesStarIcon)),
                    Gap(2.w),
                    Text(
                      "4.5",
                      style: TextStyleHelper.of(context).b_12.copyWith(
                          color: ThemeClass.of(context).mainBlack,
                          fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Gap(2.w)
                  ],
                ),
              ),
              Gap(8.h),



            ],
          ),
        ),
      ),
    );
  }
}