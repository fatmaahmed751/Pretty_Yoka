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

class ServicePendingServiceWidget extends StatelessWidget {
  const ServicePendingServiceWidget({
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
            Text(Strings.waitForServiceResponse.tr,
            style: TextStyleHelper.of(context).b_12.copyWith(
              color: ThemeClass.of(context).secondaryBlackColor
            ),),
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
                    Strings.viewServices.tr,
                    style: TextStyleHelper.of(context).h_13.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness:7,
                        color: ThemeClass.of(context).primaryColor),
                  ),
                ),
              ],
            ),
            Gap(8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: 151.5.w,
                    height: 29.h,
                    decoration: BoxDecoration(
                      border:
                      Border.all(color: ThemeClass.of(context).labelColor.withAlpha((0.6 * 255).toInt())),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Padding(
                        padding:  EdgeInsetsDirectional.only(top: 2.h),
                        child: Text(
                          Strings.reject.tr,
                          style: TextStyleHelper.of(context).h_14.copyWith(
                              color: ThemeClass.of(context).labelColor.withAlpha((0.6 * 255).toInt())),
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(8.w),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: 151.5.w,
                    height: 29.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: ThemeClass.of(context).primaryColor
                      // ThemeClass.of(context).background.withValues(0.20)
                    ),
                    //  backgroundColor: ThemeClass.of(context).primaryColor,
                    child: Center(
                      child: Padding(
                        padding:  EdgeInsetsDirectional.only(top: 2.h),
                        child: Text(
                          Strings.accept.tr,
                          style: TextStyleHelper.of(context).h_14.copyWith(
                            color: ThemeClass.of(context).background,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RowOfListOfBookingDetails extends StatelessWidget {
  final  String firstText;
  final String secondText;
  const RowOfListOfBookingDetails({
    super.key, required this.firstText, required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
      firstText ,
          style: TextStyleHelper.of(context)
              .b_16
              .copyWith(color: ThemeClass.of(context).secondaryBlackColor),
        ),
        Gap(4.w),
        Text(
      secondText,
          style: TextStyleHelper.of(context).b_17.copyWith(
              color: ThemeClass.of(context).secondaryBlackColor,
            ),
        ),
      ],
    );
  }
}
