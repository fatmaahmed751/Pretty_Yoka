import 'package:Pretty/core/Language/locales.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/strings.dart';
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

  final List<String> services = [
    Strings.bridalMakeup.tr,
    Strings.eventMakeUp.tr,
    Strings.eyeBrow.tr,
    Strings.eyeLash.tr,
  ];

}


