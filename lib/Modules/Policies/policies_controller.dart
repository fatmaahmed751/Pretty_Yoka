import 'package:mvc_pattern/mvc_pattern.dart';

import "../../Widgets/toast_helper.dart";

class PoliciesController extends ControllerMVC {
  // singleton
  factory PoliciesController() {
    _this ??= PoliciesController._();
    return _this!;
  }

  static PoliciesController? _this;

  PoliciesController._();

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


