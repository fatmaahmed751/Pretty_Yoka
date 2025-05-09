
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../../Utilities/strings.dart';
import '../../../../Utilities/text_style_helper.dart';
import '../../../../Utilities/theme_helper.dart';
import '../../../../Widgets/custom_button_widget.dart';
import '../../../../generated/assets.dart';
import '../Modules/Notifications/notifications_controller.dart';
import '../Utilities/validate.dart';
import 'custom_textfield_widget.dart';
import 'loading_screen.dart';

class AlertRateServiceSuccessfully extends StatefulWidget {
  const AlertRateServiceSuccessfully({
    super.key,
  });

  @override
  createState() => AlertRateServiceSuccessfullyState();
}

class AlertRateServiceSuccessfullyState
    extends StateMVC<AlertRateServiceSuccessfully> {
  AlertRateServiceSuccessfullyState() : super(NotificationsController()) {
    con = NotificationsController();
  }

  late NotificationsController con;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LoadingScreen(
        loading: con.loading,
        child: Form(
          key: _formKey,
          autovalidateMode: con.autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: SafeArea(
            child: Center(
              child: Container(
                width: 313.w,
                height: 283.h,
                decoration: BoxDecoration(
                  color: ThemeClass.of(context).background,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 24.w, vertical: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.yourServiceComplete.tr,
                        style: TextStyleHelper.of(context)
                            .h_16
                            .copyWith(color: ThemeClass.of(context).mainBlack),
                      ),
                      Gap(12.h),
                      Text(Strings.pleaseRate.tr,
                          style: TextStyleHelper.of(context).b_12.copyWith(
                              color: ThemeClass.of(context).labelColor)),
                      Gap(12.h),
                      Text(Strings.rateService.tr,
                          style: TextStyleHelper.of(context).h_16.copyWith(
                              color: ThemeClass.of(context).mainBlack)),
                      Gap(12.h),
                      Center(
                        child: RatingBar.builder(
                          initialRating: con.serviceProviderRating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          unratedColor: ThemeClass.of(context).labelColor,
                          itemSize: 24,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
                          itemBuilder: (context, index) => SvgPicture.asset(
                            con.serviceProviderRating >= index + 1
                                ? Assets
                                .imagesFilledStar // Filled star SVG asset
                                : Assets.imagesUnratedStar,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              con.serviceProviderRating = rating;
                            });
                          },
                        ),
                      ),
                      Gap(12.h),
                      Text(Strings.rateServiceProvider.tr,
                          style: TextStyleHelper.of(context).h_16.copyWith(
                              color: ThemeClass.of(context).mainBlack)),
                      Gap(12.h),
                      Center(
                        child: RatingBar.builder(
                          initialRating: con.serviceRating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          unratedColor: ThemeClass.of(context).labelColor,
                          itemSize: 24,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
                          itemBuilder: (context, index) => SvgPicture.asset(
                            con.serviceRating >= index + 1
                                ? Assets
                                    .imagesFilledStar // Filled star SVG asset
                                : Assets.imagesUnratedStar,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              con.serviceRating = rating;
                            });
                          },
                        ),
                      ),
                      Gap(16.h),

                      CustomButtonWidget.primary(
                          title: Strings.save.tr,
                          height: 29.h,
                          width: 265.w,
                          onTap: () {
                            context.pop();
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
