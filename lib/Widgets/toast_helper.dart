// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../Utilities/router_config.dart';
// import '../Utilities/text_style_helper.dart';
// import '../Utilities/theme_helper.dart';
//
// class ToastHelper {
//   static final FToast _fToast = FToast();
//
//   static void init(BuildContext context) {
//     _fToast.init(context);
//   }
//
//   static Future showError(
//       {required String? message, Color? backgroundColor,required BuildContext context}) async {
//     await Fluttertoast.showToast(
//       msg: message ?? "error",
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 2,
//       backgroundColor:ThemeClass.of(context).textFieldBackground,
//       textColor:ThemeClass.of(context).mainBlack,
//       fontSize: 16.sp,
//     );
//   }
//
//   static void _showCustomOverlay({
//     required BuildContext context,
//     required String message,
//     required Color backgroundColor,
//     required Widget? icon,
//   }) {
//     OverlayEntry overlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//         bottom: 70,
//         left: 50,
//         child: Material(
//           color: Colors.transparent,
//           child: Container(
//             height: 54.h,
//             width: 313.w,
//             padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12.r),
//               color: ThemeClass.of(context).textFieldBackground,
//             ),
//             child: Row(
//              mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   width: 14.w,
//                   height: 54.h,
//                   decoration: BoxDecoration(
//                       color: ThemeClass.of(context).primaryColor
//                   ),
//                 ),
//                 icon ??  Icon(Icons.error, color: Colors.white,
//                 size: 15.r,),
//                 Expanded(
//                   child: Text(
//                     message,
//                     style: TextStyleHelper.of(context).h_16.copyWith(
//                           color: ThemeClass.of(context).mainBlack,
//                         ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//
//     // Insert the overlay into the overlay stack
//     Overlay.of(context).insert(overlayEntry);
//
//     // Remove the overlay after a delay
//     Future.delayed(const Duration(seconds:100), () {
//       overlayEntry.remove();
//     });
//   }
//
//   static Future showSuccess({
//     required String? message,
//     Color? backgroundColor,
//     required Widget icon,
//     required BuildContext context,
//   }) async {
//     _showCustomOverlay(
//       context: context,
//       message: message ?? "success",
//       backgroundColor:
//          ThemeClass.of(context).labelColor,
//       icon: icon,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import '../Utilities/router_config.dart';
import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';

class ToastHelper {
  static final FToast _fToast = FToast();

  static void init(BuildContext context) {
    _fToast.init(context);
  }

  /// Show an error toast message.
  static Future showError({
    required String? message,
    Color? backgroundColor,
    required BuildContext context,
  }) async {
    await Fluttertoast.showToast(
      msg: message ?? "error",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: ThemeClass.of(context).textFieldBackground,
      textColor: ThemeClass.of(context).mainBlack,
      fontSize: 16.sp,
    );
  }

  /// Show a custom overlay toast with animation.
  static void _showCustomOverlay({
    required BuildContext context,
    required String message,
    required String secondMessage,
    required Color backgroundColor,
    required Widget icon,
  }) {
    // Create the overlay entry
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 90.h, // Adjust the position from the bottom
        left: 50.w, // Horizontal padding
        child: Material(
          color: Colors.transparent,
          child: AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Container(
              height: 54.h,
              width: 300.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: backgroundColor,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Colored indicator
                  Container(
                    width: 14.w,
                    height: 54.h,
                    decoration: BoxDecoration(
                      color: ThemeClass.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        bottomLeft: Radius.circular(12.r),
                      ),
                    ),
                  ),

                  // Icon
                Gap(8.w),// Spacing between indicator and icon
                  icon,
                  // Message text
                  Gap(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        message,
                        style: TextStyleHelper.of(context).h_16.copyWith(
                          color: ThemeClass.of(context).mainBlack,
                        ),
                      ),
                      Text(
                        secondMessage,
                        style: TextStyleHelper.of(context).b_12.copyWith(
                          color: ThemeClass.of(context).labelColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // Insert the overlay into the overlay stack
    Overlay.of(context).insert(overlayEntry);

    // Remove the overlay after a delay
    Future.delayed(const Duration(seconds: 3), () {
      // Fade out animation before removing
      overlayEntry.markNeedsBuild();
      Future.delayed(const Duration(milliseconds: 600), () {
        overlayEntry.remove();
      });
    });
  }

  /// Show a success toast message.
  static void showSuccess({
    required String? message,
    required Widget icon,
    required String secondMessage,
    required BuildContext context,
  }) {
    _showCustomOverlay(
      secondMessage: secondMessage,
      context: context,
      message: message ?? "success",
      backgroundColor: ThemeClass.of(context).textFieldBackground,
      icon: icon,
    );
  }
}