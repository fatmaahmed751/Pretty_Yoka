import 'dart:ui';
import 'package:Pretty/Widgets/toast_helper.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../Utilities/strings.dart';
import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';
import '../generated/assets.dart';
import 'custom_button_widget.dart';

class ConnectivityWrapper extends StatelessWidget {
  final Widget child;

  const ConnectivityWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isConnected = Provider.of<bool>(context);
    print("Connectivity Status: $isConnected");

    if (!isConnected) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body:
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 20.w,
              end: 20.w,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(120.h),
                  SizedBox(
                    height: 250.h,
                    width: double.infinity,
                    child: SvgPicture.asset(
                    ""
                      // fit: BoxFit.cover,
                    ),
                  ),
                  Gap(10.h),
                  Text(

                 Strings.noInternet.tr,
                    textAlign: TextAlign.center,
                    style: TextStyleHelper.of(context)
                        .h_20
                        .copyWith(color: ThemeClass.of(context).mainBlack),
                  ),
                  Gap(10.h),
                  SizedBox(
                    //width: 382.w,
                    // height: 85.h,
                    child: Text(
                     Strings.checkNet.tr,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyleHelper.of(context).b_16.copyWith(
                          color: ThemeClass.of(context).secondaryBlackColor),
                    ),
                  ),
                  Gap(30.h),
                  CustomButtonWidget.primary(
                      height: 48.h,
                      width: 155.w,
                      radius: 30.r,
                      title:
                      Strings.reload.tr,
                      onTap: () {
                        ToastHelper.showError(message:
                        Strings.offline.tr,
                        context: context);
                      }),
                  Gap(120.h)
                ]

            ),
          ),
        ),
      );
    }

    return child;
  }
}