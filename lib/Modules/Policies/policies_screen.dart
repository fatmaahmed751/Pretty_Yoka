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

class PoliciesScreen extends StatefulWidget {
  static const routeName = "Policies";
  // final PoliciesModel? policiesModel;
  const PoliciesScreen({
    super.key,
    // this.policiesModel
  });

  @override
  createState() => _PoliciesScreenState();
}

class _PoliciesScreenState extends StateMVC<PoliciesScreen> {
  _PoliciesScreenState() : super(PoliciesController()) {
    con = PoliciesController();
  }

  late PoliciesController con;

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
              Gap(24.h),
              Text(
                "Booking & Payment\nUsers can browse and book beauty services from verified service providers."
                "Payments are securely processed within the app and held by Pretty Yuka until the service is completed."
                "  Prices are set by service providers, and any additional charges will be communicated before booking."
                " If a user fails to show up for an appointment without cancellation, the payment may be non-refundable\nData Privacy & Security\nPretty Yuka values your privacy and ensures that personal data is protected"
                "  We do not share your information with third parties without consent, except for legal reasons."
                "  Users can request data deletion by contacting our support team.",
                style: TextStyle(height: 2.h),
              )
//                   Html(
//                 data:"Booking & Payment\nUsers can browse and book beauty services from verified service providers."
// "                  Payments are securely processed within the app and held by Pretty Yuka until the service is completed."
// "                  Prices are set by service providers, and any additional charges will be communicated before booking."
// "                 If a user fails to show up for an appointment without cancellation, the payment may be non-refundable."
// "                  Data Privacy & Security"
// "                      Pretty Yuka values your privacy and ensures that personal data is protected."
// "                  We do not share your information with third parties without consent, except for legal reasons."
// "                  Users can request data deletion by contacting our support team.",
//     style: {
//     "body": Style(
//     color: Colors.black, // 👈 Set text color to black
//     fontSize: FontSize(14.sp), // Optional: adjust font size
//     )
//               }
//             ),
            ]),
          ),
        ),
      ),
    );
  }
}
