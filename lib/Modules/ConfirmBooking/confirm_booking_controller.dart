import 'package:mvc_pattern/mvc_pattern.dart';

import "../../Widgets/toast_helper.dart";

class ConfirmBookingController extends ControllerMVC {
  // singleton
  factory ConfirmBookingController() {
    _this ??= ConfirmBookingController._();
    return _this!;
  }

  static ConfirmBookingController? _this;

  ConfirmBookingController._();

  bool loading = false;
  bool autoValidate = false;
  String? privacyText;
  @override
  void initState() {
    super.initState();
  }

  init() {

  }
  @override
  void dispose() {
    super.dispose();
  }

}


