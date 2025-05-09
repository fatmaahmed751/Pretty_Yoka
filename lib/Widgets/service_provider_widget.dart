import 'package:Pretty/Modules/ServiceInformationForSpecificCategory/service_information_for_specific_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../generated/assets.dart';


class ServiceProviderWidget extends StatelessWidget{
  final double width;
  final double height;
  const ServiceProviderWidget({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,
      height: height,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(12.r),
          color:
          ThemeClass
              .of(context)
              .background,
          boxShadow: [
            BoxShadow(
              color: ThemeClass
                  .of(context)
                  .waiting
                  .withAlpha(20),
              blurRadius: 4,
              //spreadRadius: 0.5,
              offset: const Offset(0,
                  3), // Shadow only appears below
            ),
          ]),
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: 8.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          mainAxisAlignment:
          MainAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 30.r,
                backgroundImage:  const AssetImage(
                    Assets.imagesFavoriteServiceProvider),
              ),
            ),
            Gap(8.h),
            Text(
              Strings.serviceProviderName.tr,
              style: TextStyleHelper
                  .of(context)
                  .h_13
                  .copyWith(
                  color: ThemeClass
                      .of(
                      context)
                      .secondaryBlackColor),
            ),
            Gap(8.h),
            Text(
              Strings.makeUpArtist.tr,
              style: TextStyleHelper
                  .of(context)
                  .b_12
                  .copyWith(
                  color: ThemeClass
                      .of(
                      context)
                      .secondaryBlackColor),
            ),
            Gap(8.h),
            Row(
              children: [
                SvgPicture.asset(
                    Assets.imagesStarIcon),
                Gap(2.w),
                Padding(
                  padding:
                  EdgeInsets.only(top: 4.h),
                  child: Text(
                    "4.5",
                    style: TextStyleHelper
                        .of(
                        context)
                        .b_12
                        .copyWith(
                        color: ThemeClass
                            .of(
                            context)
                            .labelColor),
                  ),
                ),
                Spacer(),
                Text(
                  "(${"44"})",
                  style:
                  TextStyleHelper
                      .of(context)
                      .b_12
                      .copyWith(
                      color: ThemeClass
                          .of(context)
                          .labelColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


}