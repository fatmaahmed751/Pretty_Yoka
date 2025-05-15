import 'package:Pretty/Modules/Favotites/favorite_screen.dart';
import 'package:Pretty/Modules/Home/home_screen.dart';
import 'package:Pretty/Modules/ServiceProviderHome/service_provider_home_screen.dart';
import 'package:Pretty/Utilities/text_style_helper.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../Utilities/strings.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../Widgets/custom_button_widget.dart';
import '../../../generated/assets.dart';

class ProviderSendRequestSuccessfully extends StatelessWidget {
  static const routeName = "ProviderSendSuccessfully";
  const ProviderSendRequestSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesRequestSend,
              width: 263.w,
              height: 135.h,
            ),
            Gap(8.h),
            Text(
              Strings.sendSuccessfully.tr,
              style: TextStyleHelper.of(context)
                  .b_21
                  .copyWith(color: ThemeClass.of(context).secondaryBlackColor),
            ),
            Gap(8.h),
            Text(
              Strings.waitForResponse.tr,
              textAlign: TextAlign.center,
              style: TextStyleHelper.of(context)
                  .b_16
                  .copyWith(color: ThemeClass.of(context).labelColor),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: Padding(
          padding:
          EdgeInsetsDirectional.symmetric(horizontal: 24.w, vertical: 24.h),
          child: CustomButtonWidget.primary(
              height: 44.h,
              title: Strings.backToHome.tr,
              onTap: () {
                GoRouter.of(context).pushNamed(ServiceProviderHomeScreen.routeName);
              }),
        ),
      ),
    );
  }
}
