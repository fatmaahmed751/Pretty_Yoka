import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';

class ContainerEmptyContentWidget extends StatelessWidget {
  final String image;
  final String mainText;
  final String descText;
  final Widget? button;
  const ContainerEmptyContentWidget(
      {super.key,
      required this.image,
      required this.mainText,
      required this.descText,
      this.button});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
       horizontal: 24.w,

      ),
      child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              width: 200.w,
              height: 200.h,
              fit: BoxFit.cover,
                         //   allowDrawingOutsideViewBox: true,
            ),
            Gap(12.h),
            Text(
              mainText,
              textAlign: TextAlign.center,
              style: TextStyleHelper.of(context)
                  .b_21
                  .copyWith(color: ThemeClass.of(context).mainBlack),
            ),
            Gap(8.h),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 4.w),
              child: Text(
                descText,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyleHelper.of(context).b_16.copyWith(
                    color: ThemeClass.of(context).labelColor),
              ),
            ),
            Gap(20.h),
            button ?? const SizedBox(),
            Gap(50.h)
          ]),
    );
  }
}
