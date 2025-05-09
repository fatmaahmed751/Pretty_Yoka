import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/router_config.dart';
import '../../Widgets/rate_service_successfully_widget.dart';

class NotificationsController extends ControllerMVC {
  // singleton
  factory NotificationsController() {
    _this ??= NotificationsController._();
    return _this!;
  }
  static NotificationsController? _this;
  NotificationsController._();
  bool loading = false, autoValidate = false;
  bool isLogin = true;
  double serviceProviderRating = 0.0;
  double serviceRating = 0.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  sendFeedBackSuccess() async {
    setState(() {
      loading = true;
    });

    showDialog(
      context: currentContext_!,
      builder: (context) => const AlertRateServiceSuccessfully(),
    );

    setState(() {
      loading = false;
    });
  }
}
