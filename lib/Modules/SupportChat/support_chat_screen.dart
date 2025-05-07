
import 'package:Pretty/Modules/SupportChat/support_chat_controller.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Utilities/strings.dart';
import '../../../Widgets/loading_screen.dart';
import '../../../generated/assets.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/custom_bubble_chat_widget.dart';
import '../../Widgets/custom_send_message_widget.dart';

class SupportChatScreen extends StatefulWidget {
  static const routeName = "SupportChatScreen";
  const SupportChatScreen({super.key});

  @override
  SupportChatScreenState createState() => SupportChatScreenState();
}

class SupportChatScreenState extends StateMVC<SupportChatScreen> {
  SupportChatScreenState() : super(SupportChatController()) {
    con = SupportChatController();
  }

  late SupportChatController con;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
      child: LoadingScreen(
      loading: con.loading,
        child: Padding(
          padding:  EdgeInsetsDirectional.symmetric(horizontal:24.w),
          child: ListView(
                  children: [
                    Gap(12.h),
                    CustomAppBarWidget.mainScreen(
                      title: Strings.support.tr,
                      space: 100.w,
                    ),
                    Gap(24.h),
                    const BubbleChat(
                      message:
                         " Hi, i am lina and i have a problem on my" ,
                      senderName: "Ahmed Mohammed",
                      time: "2:00",
                      isSent: false,
                    ),
                    const BubbleChat(
                      message:
                         " Hi, i am lina and i have a problem on my" ,
                      time: "2:05",
                      isSent: true,
                    ),
                    const BubbleChat(
                      message:
                         " Hi, i am lina and i have a problem on my" ,
                      time: "2:05",
                      isSent: true,
                    ),
                    const BubbleChat(
                      message:
                         " Hi, i am lina and i have a problem on my" ,
                      senderName: "Ahmed Mohammed",
                      time: "2:00",
                      isSent: false,
                    ),
                  ],
                ),
        ),
      ),
      ),
    bottomNavigationBar:  Container(
              color: Colors.transparent,
    child: Padding(
    padding:
    EdgeInsetsDirectional.symmetric(horizontal: 24.w, vertical: 24.h),
        child: const CustomSendMessageWidget()),
    ),
    );
  }
}

