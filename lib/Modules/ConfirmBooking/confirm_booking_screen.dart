import 'package:Pretty/Modules/Policies/policies_controller.dart';
import 'package:Pretty/Modules/UserPayment/user_payment_controller.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import "package:flutter_html/flutter_html.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Widgets/loading_screen.dart';
import '../../Utilities/format_date_helper.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import '../../Widgets/customSolidSideText.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../generated/assets.dart';
import '../Bookings/widgets/pending_service_widget.dart';
import '../UserPayment/user_payment_screen.dart';
import 'confirm_booking_controller.dart';

class ConfirmBookingScreen extends StatefulWidget {
  static const routeName = "ConfirmBooking";
  // final ConfirmBookingModel? policiesModel;
  const ConfirmBookingScreen({
    super.key,
    // this.policiesModel
  });

  @override
  createState() => _ConfirmBookingScreenState();
}

class _ConfirmBookingScreenState extends StateMVC<ConfirmBookingScreen> {
  _ConfirmBookingScreenState() : super(ConfirmBookingController()) {
    con = ConfirmBookingController();
  }

  late ConfirmBookingController con;

  @override
  void initState() {
    super.initState();
    con.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingScreen(
        loading: con.loading,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
            child: ListView(children: [
              Gap(12.h),
              CustomAppBarWidget.mainScreen(
                title: Strings.confirmBooking.tr,
                space: 85.w,
              ),
              Gap(24.h),
              Container(
                width: 327.w,
                //  height: 140.h,
                decoration: BoxDecoration(
                  color: ThemeClass.of(context).background,
                  // color:Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                        color: ThemeClass.of(context).waiting,
                        blurRadius: 4,
                        offset: Offset(0, 2)),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 8.w, vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RowOfListOfBookingDetails(
                        firstText: "${Strings.serviceProvider.tr}:",
                        secondText: Strings.serviceProviderName.tr,
                      ),
                      Gap(4.h),
                      RowOfListOfBookingDetails(
                        firstText: Strings.yourLocation.tr,
                        secondText: Strings.locationDesc.tr,
                      ),
                      Gap(4.h),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.imagesCalenderIcon),
                          Gap(4.w),
                          Padding(
                            padding: EdgeInsetsDirectional.only(top: 4.h),
                            child: Text(
                              FormatDateHelper.formatWalletDate
                                  .format(DateTime.now()),
                              style: TextStyleHelper.of(context).b_14.copyWith(
                                  color: ThemeClass.of(context)
                                      .secondaryBlackColor),
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(Assets.imagesTimeIcon),
                          Gap(4.w),
                          Padding(
                            padding: EdgeInsetsDirectional.only(top: 4.h),
                            child: Text(
                              "12 Am",
                              style: TextStyleHelper.of(context).b_14.copyWith(
                                  color: ThemeClass.of(context)
                                      .secondaryBlackColor),
                            ),
                          ),
                        ],
                      ),
                      Gap(4.h),
                      Row(
                        children: [
                          Text(
                            Strings.price.tr,
                            style: TextStyleHelper.of(context).b_16.copyWith(
                                color:
                                    ThemeClass.of(context).secondaryBlackColor),
                          ),
                          const Spacer(),
                          Text(
                            "2000 ${Strings.egp.tr}",
                            style: TextStyleHelper.of(context)
                                .b_17
                                .copyWith(color: ThemeClass.of(context).orange),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Gap(12.h),
              Container(
                width: 327.w,
                //  height: 140.h,
                decoration: BoxDecoration(
                  color: ThemeClass.of(context).background,
                  // color:Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                        color: ThemeClass.of(context).waiting,
                        blurRadius: 4,
                        offset: Offset(0, 2)),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 8.w, vertical: 8.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSolidSideTextWidget(
                          text: Strings.services.tr,
                        ),
                        Gap(8.h),
                        ...con.services
                            .map((service) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsetsDirectional.symmetric(
                                          horizontal: 8.w,
                                          vertical: 4.h,
                                        ),
                                        child: Icon(
                                          Icons.circle,
                                          size: 5,
                                          color:
                                              ThemeClass.of(context).labelColor,
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        service,
                                        style: TextStyleHelper.of(context)
                                            .b_16
                                            .copyWith(
                                                color: ThemeClass.of(context)
                                                    .labelColor),
                                      )),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ]),
                ),
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: Padding(
          padding:
          EdgeInsetsDirectional.symmetric(horizontal: 24.w, vertical: 24.h),
          child: CustomButtonWidget.primary(
              height: 44.h,
              title: Strings.confirm.tr,
              onTap: () {
                GoRouter.of(context)
                    .pushNamed(PaymentScreen.routeName);
              }),
        ),
      ),
    );
  }
}
