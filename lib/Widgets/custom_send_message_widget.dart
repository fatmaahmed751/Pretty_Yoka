import 'package:Pretty/Widgets/custom_textfield_widget.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../Utilities/shared_preferences.dart';
import '../Utilities/strings.dart';
import '../Utilities/theme_helper.dart';
import '../generated/assets.dart';

class CustomSendMessageWidget extends StatelessWidget {
  const CustomSendMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextFieldWidget(
          width: 265.w,
            height: 40.h,
            hint: Strings.writeAMessage.tr,
    backGroundColor: ThemeClass.of(context).labelColor,
          ),
            Gap(10.w),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 40.w,
            height: 40.h,
           decoration: BoxDecoration(
               color:
               ThemeClass.of(context).primaryColor,
             borderRadius: BorderRadius.circular(12.r)
           ),

            child: Transform.flip(
              flipX: SharedPref.getCurrentLanguage() == "ar" ? true : false,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: SvgPicture.asset(
                  Assets.imagesAttach,
                //  width: 20.w,
                 // height: 20.h,
                ),
              ),
            ),
          ),
        ),
          ],
        );
  }
}
