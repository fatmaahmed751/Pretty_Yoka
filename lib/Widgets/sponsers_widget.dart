import 'package:flutter/material.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../generated/assets.dart';


class SponsorsWidget extends StatelessWidget{
  const SponsorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return Container(
     width: 327.w,
     height: 56.h,
     decoration: BoxDecoration(
       color: ThemeClass
           .of(context)
           .background,
       borderRadius: BorderRadius.circular(12.r),
       boxShadow: [
         BoxShadow(
           color: ThemeClass
               .of(context)
               .waiting.withAlpha(20),
           //blurRadius: 0.5,
           spreadRadius: 0.5,
           offset: const Offset(
               0, 2), // Shadow only appears below
         ),
       ],
     ),
     child: Padding(
       padding: EdgeInsetsDirectional.symmetric(
         vertical: 8.h,
       ),
       child: Row(
         children: [
           CircleAvatar(
             radius: 30.r,
             backgroundImage: const AssetImage(
                 Assets.imagesPharmacy),
           ),
           Gap(2.w),
           Text(
             Strings.pharmacies.tr,
             style: TextStyleHelper
                 .of(context)
                 .h_13
                 .copyWith(
                 color: ThemeClass
                     .of(context)
                     .secondaryBlackColor),
           ),
           const Spacer(),
           SvgPicture.asset(Assets.imagesArrowForward),
           Gap(16.w)
         ],
       ),
     ),
   );
  }

}