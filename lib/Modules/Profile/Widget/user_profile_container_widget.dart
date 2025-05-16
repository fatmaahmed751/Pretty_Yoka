import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../Utilities/shared_preferences.dart';
import '../../../../Utilities/text_style_helper.dart';
import '../../../../Utilities/theme_helper.dart';
import '../../../generated/assets.dart';

class UserProfileContainerWidget extends StatelessWidget {
  final String image;
  final String text;
  //final Function function;
  const UserProfileContainerWidget({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(top: 0.h,bottom: 8.h),
      child: Container(
        height: 58.h,
        width: 303.w,
        decoration: BoxDecoration(
          color: ThemeClass.of(context).textFieldBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                          color: ThemeClass.of(context).background,
                          borderRadius: BorderRadius.circular(30.r)
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: Transform.flip(
                          flipX:
                              SharedPref.getCurrentLanguage() == "ar" ? true : false,
                          child: SizedBox(
                            width: 22.w,
                            height: 22.h,
                            // decoration: BoxDecoration(
                            //   color: ThemeClass.of(context).background,
                            //   borderRadius: BorderRadius.circular(30.r)
                            // ),
                            child: SvgPicture.asset(
                              image,
                            ),
                          ),
                        ),
                      )),
                  Gap(10.w),
                  Text(
                    text,
                    style: TextStyleHelper.of(context).h_15,
                  ),
                  const Spacer(),
                  Transform.flip(
                    flipX: SharedPref.getCurrentLanguage() == "ar" ? true : false,
                    child: Center(
                      child: SvgPicture.asset(Assets.imagesArrowForward),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1.1,
                color: ThemeClass.of(context).background,
                indent: 20.w,
                endIndent: 20.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
