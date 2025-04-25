import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../Utilities/text_style_helper.dart';
import '../../../../Utilities/theme_helper.dart';

class UserStatusRow extends StatelessWidget {
  final String text;
  final String nextText;
  final void Function() onNextTextTap;
  const UserStatusRow(
      {super.key,
      required this.text,
      required this.nextText,
      required this.onNextTextTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyleHelper.of(context).b_16.copyWith(
                color:
                    ThemeClass.of(context).labelColor)),
          Gap(8.w),
          GestureDetector(
            onTap: onNextTextTap,
            child: Text(
              nextText,
              style: TextStyleHelper.of(context)
                  .h_13
                  .copyWith(color: ThemeClass.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
