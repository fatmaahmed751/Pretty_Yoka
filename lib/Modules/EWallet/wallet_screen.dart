import 'package:Pretty/Modules/EWallet/wallet_controller.dart';
import 'package:Pretty/Modules/Policies/policies_controller.dart';
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

class WalletScreen extends StatefulWidget {
  static const routeName = "Wallet";
  // final WalletModel? policiesModel;
  const WalletScreen({
    super.key,
    // this.policiesModel
  });

  @override
  createState() => _WalletScreenState();
}

class _WalletScreenState extends StateMVC<WalletScreen> {
  _WalletScreenState() : super(WalletController()) {
    con = WalletController();
  }

  late WalletController con;

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
    title: Strings.policies.tr,
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