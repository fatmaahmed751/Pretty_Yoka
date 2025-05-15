import 'package:flutter/material.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../Utilities/format_date_helper.dart';
import '../../../Utilities/strings.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Utilities/theme_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Widgets/custom_main_side_text_widget.dart';
import '../../../generated/assets.dart';

class WalletWidget extends StatelessWidget {
  const WalletWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      //  height: 140.h,
      decoration: BoxDecoration(
        color: ThemeClass.of(context).background,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
              color: ThemeClass.of(context).waiting,
              blurRadius: 4,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Padding(
        padding:
        EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical:8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "10.000 ${Strings.egp.tr}",
                  style: TextStyleHelper.of(context).b_17.copyWith(
                      color: ThemeClass.of(context).secondaryBlackColor),
                ),
                const Spacer(),
                Container(
                  width: 80.w,
                  height: 26.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: const Color(0xffCBF6DF),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Text(Strings.successful.tr,
                          style: TextStyleHelper.of(context)
                              .b_14
                              .copyWith(color: const Color(0xff189653))),
                    ),
                  ),
                ),
              ],
            ),
            Gap(8.h),
            Row(
              children: [
                Container(
                    width: 38.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: const Color(0xffF1B0CE)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        Assets.imagesTransferIcon,
                        width: 16.w,
                        height: 16.h,
                      ),
                    )),
                Gap(8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Strings.nameOrEmail.tr,
                    style: TextStyleHelper.of(context).b_12.copyWith(
                      color: ThemeClass.of(context).labelColor
                    ),),
                    Gap(8.h),
                    SizedBox(
                      width: 256.w,
                      height: 20.h,
                      child: Row(
                        children: [
                          const CustomMainSideTextWidget(
                            text: "6458582123",
                          ),
                          Spacer(),
                          Text(Strings.bankAccount.tr,
                            style: TextStyleHelper.of(context).b_12.copyWith(
                                color: ThemeClass.of(context).labelColor)),
                        ],
                      ),
                    ),
                    Gap(8.h),
                    Text(
                      FormatDateHelper.formatterCustomFullDate
                          .format(DateTime.now()),
                      style: TextStyleHelper.of(context).b_12.copyWith(
                        color: ThemeClass.of(context).labelColor),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}