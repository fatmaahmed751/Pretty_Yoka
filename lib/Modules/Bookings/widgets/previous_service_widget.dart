import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../Utilities/dialog_helper.dart';
import '../../../Utilities/format_date_helper.dart';
import '../../../Utilities/strings.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../generated/assets.dart';


class PreviousServiceWidget extends StatelessWidget {
  const PreviousServiceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      //  height: 140.h,
      decoration: BoxDecoration(
        color: ThemeClass.of(context).background,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: ThemeClass.of(context).waiting,
            // spreadRadius: 1.0,
            blurRadius: 1.3,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w,vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.serviceName.tr,
              style: TextStyleHelper.of(context)
                  .h_15
                  .copyWith(color: ThemeClass.of(context).mainBlack),
            ),
            Text(
              Strings.placeName.tr,
              style: TextStyleHelper.of(context).b_12.copyWith(
                  color: ThemeClass.of(context).secondaryBlackColor,
                  fontWeight: FontWeight.w400),
            ),
            Row(
              children: [
                SvgPicture.asset(Assets.imagesCalenderIcon),
                Gap(4.w),
                Text(
                  FormatDateHelper.formatWalletDate.format(DateTime.now()),
                  style: TextStyleHelper.of(context).b_14.copyWith(
                      color: ThemeClass.of(context).secondaryBlackColor),
                ),
                const Spacer(),
                SvgPicture.asset(Assets.imagesTimeIcon),
                Gap(4.w),
                Text(
                  "12 Am",
                  style: TextStyleHelper.of(context).b_14.copyWith(
                      color: ThemeClass.of(context).secondaryBlackColor),
                ),
              ],
            ),
            Gap(4.h),
            Row(
              children: [
                Text(Strings.state.tr,
                style: TextStyleHelper.of(context).b_14.copyWith(
                  color: ThemeClass.of(context).secondaryBlackColor,),
                ),
                Spacer(),

              ]

            ),
            Row(
              children: [
                Text(
                  "1000",
                  style: TextStyleHelper.of(context)
                      .h_14
                      .copyWith(color: ThemeClass.of(context).secondary),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // DialogHelper.custom(context: context).customDialog(
                    //   dialogWidget: const DetailsOfPreviousService(),
                    // );
                  },
                  child: Text(
                    Strings.viewDetails.tr,
                    style: TextStyleHelper.of(context).h_15.copyWith(
                        decoration: TextDecoration.underline,
                        color: ThemeClass.of(context).primaryColor),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
