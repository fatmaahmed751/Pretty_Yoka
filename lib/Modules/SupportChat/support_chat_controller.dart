import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class SupportChatController extends ControllerMVC {
  // singleton
  factory SupportChatController() {
    _this ??= SupportChatController._();
    return _this!;
  }

  static SupportChatController? _this;

  SupportChatController._();
  bool loading = false;
  int selectedIndex = 2;
  TextEditingController controller = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


}
