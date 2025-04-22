import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Utilities/router_config.dart';
import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';

class ToastHelper {
  static final FToast _fToast = FToast();

  static void init(BuildContext context) {
    _fToast.init(context);
  }

  static Future showError(
      {required String? message, Color? backgroundColor,required BuildContext context}) async {
    await Fluttertoast.showToast(
      msg: message ?? "error",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor:ThemeClass.of(context).primaryColor,
      textColor: Colors.white,
      fontSize: 16.sp,
    );
  }

  static void _showCustomOverlay({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
    required Widget? icon,
  }) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 70,
        left: 50,
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: 52.h,
            width: 269.w,
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: backgroundColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon ?? const Icon(Icons.error, color: Colors.white),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyleHelper.of(context).h_16.copyWith(
                          color: ThemeClass.of(context).background,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Insert the overlay into the overlay stack
    Overlay.of(context).insert(overlayEntry);

    // Remove the overlay after a delay
    Future.delayed(const Duration(seconds: 1), () {
      overlayEntry.remove();
    });
  }

  static Future showSuccess({
    required String? message,
    Color? backgroundColor,
    required Widget icon,
    required BuildContext context,
  }) async {
    _showCustomOverlay(
      context: context,
      message: message ?? "success",
      backgroundColor:
          backgroundColor ?? ThemeClass.of(currentContext_!).primaryColor,
      icon: icon,
    );
  }
}
