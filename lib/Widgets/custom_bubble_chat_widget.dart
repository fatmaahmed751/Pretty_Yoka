
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Utilities/shared_preferences.dart';
import '../Utilities/text_style_helper.dart';
import '../Utilities/theme_helper.dart';
import '../generated/assets.dart';

class BubbleChat extends StatefulWidget {
  final String message;
  final String? senderName;
  final String time;
  final bool isSent;

  const BubbleChat(
      {super.key,
        required this.message,
        this.senderName,
        required this.time,
        required this.isSent});

  @override
  State<BubbleChat> createState() => _BubbleChatState();
}

class _BubbleChatState extends State<BubbleChat> {
  String? _reaction;

  @override
  Widget build(BuildContext context) {
    return    Container(
      width: 390.w,
      margin: widget.isSent? EdgeInsets.only(
          top: 5.h,bottom:5.h):EdgeInsets.only(top:9.h,bottom:9.h),
      decoration: BoxDecoration(
       // image: DecorationImage(image:AssetImage(Assets.imagesPrin)),
        color: widget.isSent
            ? ThemeClass.of(context).primaryColor
            : ThemeClass.of(context).background.withOpacity(0.20),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          topRight: widget.isSent ? Radius.zero : Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
          topLeft: widget.isSent ? Radius.circular(30.r) : Radius.zero,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 18.w, top: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.senderName != null)
              Text(
                widget.senderName ?? "",
                style: TextStyleHelper.of(context).h_20.copyWith(
                  color: ThemeClass.of(context).secondary,
                ),
              ),
            Text(
              widget.message,
              style: TextStyleHelper.of(context).b_16.copyWith(
                color: ThemeClass.of(context).secondary,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:SharedPref.getCurrentLanguage() == "en"? EdgeInsets.only(
                      bottom: 8.h, right: 20.w):EdgeInsets.only(
                      bottom: 8.h, left: 25.w),
                  child: Text(
                    widget.time,
                    style: TextStyleHelper.of(context).b_16.copyWith(
                      color: ThemeClass.of(context).secondary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    //   GestureDetector(
    //   onLongPress: () {
    //     showGeneralDialog(
    //       context: context,
    //       barrierColor: Colors.transparent, // Transparent background
    //       barrierDismissible: true, // Allows dismissal by tapping outside
    //       barrierLabel: '',
    //       pageBuilder: (context, animation, secondaryAnimation) {
    //         return Center(
    //           child: Container(
    //             constraints:  const BoxConstraints(
    //             ),
    //             decoration: BoxDecoration(
    //           // color: Colors.white,
    //               borderRadius: BorderRadius.circular(16.r),
    //             ),
    //             child: CustomReactionWidget(
    //               onReactionSelected: (reaction) {
    //                 setState(() {
    //                   _reaction = reaction;
    //                   print("Updated reaction: $_reaction");
    //                 });
    //                 Navigator.of(context).pop();
    //               },
    //             ),
    //           ),
    //         );
    //       },
    //       transitionBuilder: (context, animation, secondaryAnimation, child) {
    //         return FadeTransition(
    //           opacity: animation,
    //           child: child,
    //         );
    //       },
    //     );
    //   },
    //   child: Stack(
    //     children: [
    //       Container(
    //         width: 390.w,
    //         margin: widget.isSent? EdgeInsets.only(
    //              top: 5.h,bottom:5.h):EdgeInsets.only(top:9.h,bottom:9.h),
    //         decoration: BoxDecoration(
    //           color: widget.isSent
    //               ? ThemeClass.of(context).primaryColor
    //               : ThemeClass.of(context).background.withOpacity(0.20),
    //           borderRadius: BorderRadius.only(
    //             bottomLeft: Radius.circular(30.r),
    //             topRight: widget.isSent ? Radius.zero : Radius.circular(30.r),
    //             bottomRight: Radius.circular(30.r),
    //             topLeft: widget.isSent ? Radius.circular(30.r) : Radius.zero,
    //           ),
    //         ),
    //         child: Padding(
    //           padding: EdgeInsetsDirectional.only(start: 18.w, top: 15.h),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               if (widget.senderName != null)
    //                 Text(
    //                   widget.senderName ?? "",
    //                   style: TextStyleHelper.of(context).h_20.copyWith(
    //                     color: ThemeClass.of(context).secondary,
    //                   ),
    //                 ),
    //               Text(
    //                 widget.message,
    //                 style: TextStyleHelper.of(context).b_16.copyWith(
    //                   color: ThemeClass.of(context).secondary,
    //                 ),
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.end,
    //                 children: [
    //                   Padding(
    //                     padding:SharedPref.getCurrentLanguage() == "en"? EdgeInsets.only(
    //                        bottom: 8.h, right: 20.w):EdgeInsets.only(
    //                         bottom: 8.h, left: 25.w),
    //                     child: Text(
    //                       widget.time,
    //                       style: TextStyleHelper.of(context).b_16.copyWith(
    //                         color: ThemeClass.of(context).secondary,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       if (_reaction != null)
    //         Positioned(
    //           bottom: -1,
    //           right: widget.isSent ? 45.w : null,
    //           left: widget.isSent ? null : 20.w,
    //           child: Container(
    //             width: 30.h,
    //               height: 30.h,
    //               child: Image.asset(_reaction!)),
    //         ),
    //
    //     ],
    //   ),
    // );
  }

}