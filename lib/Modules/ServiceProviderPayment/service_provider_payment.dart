import 'package:Pretty/Modules/Policies/policies_controller.dart';
import 'package:Pretty/Modules/ServiceProviderPayment/service_payment_controller.dart';
import 'package:Pretty/Modules/UserPayment/user_payment_controller.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import "package:flutter_html/flutter_html.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Widgets/loading_screen.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Widgets/customSolidSideText.dart';
import '../../Widgets/custom_app_bar_widget.dart';

class ServiceProviderPaymentScreen extends StatefulWidget {
  static const routeName = "ServiceProviderPayment";
  // final ServiceProviderPaymentModel? policiesModel;
  const ServiceProviderPaymentScreen({
    super.key,
    // this.policiesModel
  });

  @override
  createState() => _ServiceProviderPaymentScreenState();
}

class _ServiceProviderPaymentScreenState extends StateMVC<ServiceProviderPaymentScreen> {
  _ServiceProviderPaymentScreenState() : super(ServiceProviderPaymentController()) {
    con = ServiceProviderPaymentController();
  }

  late ServiceProviderPaymentController con;

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
                title: Strings.payment.tr,
                space: 90.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSolidSideTextWidget(text:Strings.selectPayment.tr),
                  Gap(4.h),
                  CustomSolidSideTextWidget(text:Strings.amount.tr),

                ],
              ),
            ]
            ),
          ),
        ),
      ),
    );
  }
}
