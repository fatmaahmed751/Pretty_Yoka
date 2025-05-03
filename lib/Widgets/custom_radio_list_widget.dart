import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../generated/assets.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Utilities/theme_helper.dart';
import '../Utilities/strings.dart';

class CustomRadioListTileExample extends StatelessWidget {
  final bool showAdditionalTile;
  final String firstText;
  final String secondText;
  final int groupValue; // Add this
  final Function(int) onValueChanged;

  const CustomRadioListTileExample({
    super.key,
    this.showAdditionalTile = false,
    required this.firstText,
    required this.secondText,
    required this.onValueChanged,
    required this.groupValue, // Add this
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => onValueChanged(1),
          child: ListTile(
            dense: true,
            visualDensity: VisualDensity.compact,
            contentPadding: EdgeInsets.zero,
            title: Row(
              children: [
                SvgPicture.asset(
                  groupValue == 1
                      ? Assets.imagesCheckBox
                      : Assets.imagesUnCheckBox,
                ),
                Gap(12.w),
                Expanded(
                  child: Text(
                    firstText,
                    style: TextStyleHelper.of(context).b_16.copyWith(
                        color: ThemeClass.of(context).secondaryBlackColor),
                    softWrap: true, // Enable text wrapping
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onValueChanged(2),
          child: ListTile(
            dense: true,
            visualDensity: VisualDensity.compact,
            contentPadding: EdgeInsets.zero,
            title: Row(
              children: [
                SvgPicture.asset(
                  groupValue == 2
                      ? Assets.imagesCheckBox
                      : Assets.imagesUnCheckBox,
                ),
                Gap(12.w),
                Text(
                  secondText,
                  style: TextStyleHelper.of(context).b_16.copyWith(
                        color: ThemeClass.of(context).secondaryBlackColor,
                      ),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
