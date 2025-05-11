import 'package:Pretty/Modules/Policies/policies_controller.dart';
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
import '../../Widgets/custom_app_bar_widget.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = "Payment";
  // final PaymentModel? policiesModel;
  const PaymentScreen({
    super.key,
    // this.policiesModel
  });

  @override
  createState() => _PaymentScreenState();
}

class _PaymentScreenState extends StateMVC<PaymentScreen> {
  _PaymentScreenState() : super(PaymentController()) {
    con = PaymentController();
  }

  late PaymentController con;

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
          ]
    ),
    ),
        ),
    ),
    );
  }
}