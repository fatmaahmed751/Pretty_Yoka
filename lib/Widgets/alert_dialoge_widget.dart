import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../Utilities/strings.dart';
import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';

class AlertWarningWidget extends StatelessWidget {
  final Function()? onButtonAccept, onButtonReject;
  final String secondButtonText;
  final String? des, titleButtonAccept, titleButtonReject, mainText;
  const AlertWarningWidget(
      {super.key,
      this.mainText,
      this.onButtonAccept,
      this.des,
      this.onButtonReject,
      this.titleButtonAccept,
      this.titleButtonReject,
      required this.secondButtonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 277.h,
      // height: 252.h,
      decoration: BoxDecoration(
        color: ThemeClass.of(context).background,
        borderRadius: BorderRadius.circular((20.r)),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            start: 23.w, top: 24.h, end: 23.w, bottom: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          //mainAxisSize: MainAxisSize.min,
          children: [
            //Gap(32.h),
            Text(mainText ?? '',
                style: TextStyleHelper.of(context).h_16.copyWith(
                    color: ThemeClass.of(context).mainBlack,
                    fontWeight: FontWeight.w500)),
            Gap(des!=null?16.h:1.h),
            SizedBox(
                width: 337.w,
                // height: 111.h,
                child: Text(
                  des ?? '',
                  style: TextStyleHelper.of(context).b_16.copyWith(
                      color: ThemeClass.of(context).secondaryBlackColor,
                      fontWeight: FontWeight.w400),
                )),
            Gap(des!=null?30.h:1.h),
            Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onButtonReject,
                  child: Container(
                    width: 135.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: ThemeClass.of(context).secondaryBlackColor),
                        borderRadius: BorderRadius.circular(20.r),
                        ),
                    child: Center(
                      child: Text(
                        Strings.cancel.tr,
                        style: TextStyleHelper.of(context).h_16.copyWith(
                            color: ThemeClass.of(context).secondaryBlackColor),
                      ),
                    ),
                  ),
                ),
                Gap(16.w),
                GestureDetector(
                  onTap: onButtonAccept,
                  child: Container(
                    width: 135.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ThemeClass.of(context).cancel
                        // ThemeClass.of(context).background.withValues(0.20)
                        ),
                    //  backgroundColor: ThemeClass.of(context).primaryColor,
                    child: Center(
                      child: Text(
                        secondButtonText,
                        style: TextStyleHelper.of(context).h_16.copyWith(
                              color: ThemeClass.of(context).background,
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
