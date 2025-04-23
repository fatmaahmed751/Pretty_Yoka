import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../Utilities/strings.dart';
import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';

class RowOrWidget extends StatelessWidget{
  const RowOrWidget({super.key});


  @override
  Widget build(BuildContext context) {
   return  Row(
      children: [
        Expanded(
          child: Divider(
            color: ThemeClass.of(context).success,
            thickness: 1.w,
          ),
        ),
        Gap(8.w),
        Text(Strings.or.tr,
            style: TextStyleHelper.of(context)
                .b_16
                .copyWith(
                color:
                ThemeClass.of(context).success)),
        Gap(8.w),
        Expanded(
          child: Divider(
            color: ThemeClass.of(context).success,
            thickness: 1.w,
          ),
        ),
      ],
    );

  }
}