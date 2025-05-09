import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../Utilities/dialog_helper.dart';
import '../../../Utilities/shared_preferences.dart';
import '../../../Utilities/strings.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../Widgets/custom_side_text_widget.dart';
import '../../../generated/assets.dart';

class ServiceCardWidget extends StatelessWidget {
  const ServiceCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // GoRouter.of(context).pushNamed(ServiceDetailsScreen.routeName);
      },
      child: Container(
        //  height: 247.h,
        width: 157.5.w,
        decoration: BoxDecoration(
          color: ThemeClass.of(context).background,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: ThemeClass.of(context).waiting.withAlpha(20),
              blurRadius: 4,
              //spreadRadius: 0.5,
              offset: const Offset(0, 2), // Shadow only appears below
            ),
          ],
        ),
        child: Padding(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 12.h),
          child:
              Column(
               mainAxisAlignment: MainAxisAlignment.center,
                 // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage: const AssetImage(Assets.imagesFaceCare),
            ),
            Gap(4.h),
            CustomSideTextWidget(
              text: Strings.makeUpArtist.tr,
            ),
          ]
                  //  Gap(2.h),
                  ),
        ),
      ),
    );
  }
}
