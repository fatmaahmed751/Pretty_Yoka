import 'package:mvc_pattern/mvc_pattern.dart';

import "../../Widgets/toast_helper.dart";

class WalletController extends ControllerMVC {
  // singleton
  factory WalletController() {
    _this ??= WalletController._();
    return _this!;
  }

  static WalletController? _this;

  WalletController._();

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


