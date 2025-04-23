import 'package:flutter/material.dart';

import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';

class CustomMainSideTextWidget extends StatelessWidget {
  final String text;
  const CustomMainSideTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyleHelper.of(context)
          .h_16
          .copyWith(color: ThemeClass.of(context).secondaryBlackColor),
    );
  }
}
