import 'package:mvc_pattern/mvc_pattern.dart';

import "../../Widgets/toast_helper.dart";

class ServiceProviderPaymentController extends ControllerMVC {
  // singleton
  factory ServiceProviderPaymentController() {
    _this ??= ServiceProviderPaymentController._();
    return _this!;
  }

  static ServiceProviderPaymentController? _this;

  ServiceProviderPaymentController._();

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


