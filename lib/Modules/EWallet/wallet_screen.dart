import 'package:Pretty/Modules/EWallet/wallet_controller.dart';
import 'package:Pretty/Modules/EWallet/widget/wallet_details.dart';
import 'package:Pretty/Modules/Policies/policies_controller.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import "package:flutter_html/flutter_html.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Widgets/loading_screen.dart';

import '../../Utilities/strings.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import '../../Widgets/customSolidSideText.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/custom_main_side_text_widget.dart';
import '../../generated/assets.dart';

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
                title: Strings.wallet.tr,
                space: 110.w,
              ),
              Gap(24.h),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        Assets.imagesPayment,
                        // cacheColorFilter: true,
                        height: 176.h,
                        width: 176.w,
                      ),
                      CircleAvatar(
                        radius: 78.r,
                        // width: 174.w,

                        backgroundColor:
                            ThemeClass.of(context).textFieldBackground,
                        child: Container(
                          height: 26.h,
                          width: 125.w,
                          color: ThemeClass.of(context).textFieldBackground,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 0.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(end: 0.w),
                                  child: Text(
                                    "1000.000",
                                    style: TextStyleHelper.of(context)
                                        .h_24
                                        .copyWith(
                                            color: ThemeClass.of(context)
                                                .secondaryBlackColor),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 12.h),
                                  child: Text(
                                    Strings.egp.tr,
                                    style: TextStyleHelper.of(context)
                                        .h_16
                                        .copyWith(
                                            color: ThemeClass.of(context)
                                                .secondaryBlackColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(20.h),
                Container(
                  height: 54.h,
                  decoration: BoxDecoration(
                      color: ThemeClass.of(context).textFieldBackground,
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 8.w, vertical: 8.h),
                    child: Row(
                      children: [
                        Container(
                            width: 38.w,
                            height: 38.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: const Color(0xffF1B0CE)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                Assets.imagesTransferIcon,
                                width: 16.w,
                                height: 16.h,
                              ),
                            )),
                        Gap(8.w),
                        Padding(
                          padding:  EdgeInsets.only(top: 4.h),
                          child: CustomMainSideTextWidget(text: Strings.sendMoney.tr),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(20.h),
                CustomSolidSideTextWidget(text: Strings.history.tr),
                Gap(20.h),
                ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const WalletWidget(),
                  itemCount: 10,
                  separatorBuilder: (context, index) => Gap(8.h),
                ),
                Gap(20.h)
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}


