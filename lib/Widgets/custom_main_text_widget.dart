import 'package:flutter/material.dart';
import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';

class CustomMainTextWidget extends StatelessWidget {
  final String text;
  const CustomMainTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
     textAlign: TextAlign.center,
      text,
      style: TextStyleHelper.of(context)
          .h_24
          .copyWith(color: ThemeClass.of(context).secondaryBlackColor),
    );
  }
}
