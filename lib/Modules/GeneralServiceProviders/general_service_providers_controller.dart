import 'package:Pretty/core/Language/locales.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/strings.dart';

class GeneralServiceProvidersController extends ControllerMVC {
  // singleton
  factory GeneralServiceProvidersController() {
    _this ??= GeneralServiceProvidersController._();
    return _this!;
  }

  static GeneralServiceProvidersController? _this;

  GeneralServiceProvidersController._();

  bool loading = false;

}