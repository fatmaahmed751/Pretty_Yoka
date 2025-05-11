import 'package:mvc_pattern/mvc_pattern.dart';

import "../../Widgets/toast_helper.dart";

class PaymentController extends ControllerMVC {
  // singleton
  factory PaymentController() {
    _this ??= PaymentController._();
    return _this!;
  }

  static PaymentController? _this;

  PaymentController._();

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


