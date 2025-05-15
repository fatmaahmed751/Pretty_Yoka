import 'package:Pretty/Modules/Bookings/widgets/pending_service_widget.dart';
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
import '../../../Widgets/details_of_service_widget.dart';
import '../../../generated/assets.dart';


class PreviousServiceProviderWidget extends StatelessWidget {
  const PreviousServiceProviderWidget({
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
              offset: Offset(0, 2)
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w,vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowOfListOfBookingDetails(
              firstText:"${Strings.serviceProvider.tr}:",
              secondText:  Strings.serviceProviderName.tr,
            ),
            Gap(4.h),
            RowOfListOfBookingDetails(
              firstText:Strings.yourLocation.tr,
              secondText:  Strings.locationDesc.tr,
            ),
            Gap(4.h),
            Row(
              children: [
                SvgPicture.asset(Assets.imagesCalenderIcon),
                Gap(4.w),
                Padding(
                  padding:  EdgeInsetsDirectional.only(top: 4.h),
                  child: Text(
                    FormatDateHelper.formatWalletDate.format(DateTime.now()),
                    style: TextStyleHelper.of(context).b_14.copyWith(
                        color: ThemeClass.of(context).secondaryBlackColor),
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(Assets.imagesTimeIcon),
                Gap(4.w),
                Padding(
                  padding:  EdgeInsetsDirectional.only(top: 4.h),
                  child: Text(
                    "12 Am",
                    style: TextStyleHelper.of(context).b_14.copyWith(
                        color: ThemeClass.of(context).secondaryBlackColor),
                  ),
                ),
              ],
            ),
            Gap(4.h),
            Row(
              children: [
                Text(Strings.price.tr,
                  style: TextStyleHelper.of(context).b_12.copyWith(
                      color: ThemeClass.of(context).secondaryBlackColor
                  ),),
                const Spacer(),
                Text("2000 ${Strings.egp.tr}",
                  style: TextStyleHelper.of(context).b_17.copyWith(
                      color: ThemeClass.of(context).orange
                  ),),
              ],
            ),
            Gap(4.h),
            Row(
              children: [
                Text(Strings.transitionMethod.tr,
                  style: TextStyleHelper.of(context).b_12.copyWith(
                      color: ThemeClass.of(context).secondaryBlackColor
                  ),),
                const Spacer(),
                Text(Strings.vodafone.tr,
                  style: TextStyleHelper.of(context).b_17.copyWith(
                      color: ThemeClass.of(context).secondaryBlackColor
                  ),),
              ],
            ),
            Gap(4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    DialogHelper.custom(context: context).customDialog(
                        dialogWidget: const DetailsOfService(),
                    );
                  },
                  child: Text(
                    Strings.viewDetails.tr,

                    style: TextStyleHelper.of(context).h_13.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness:7,
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
