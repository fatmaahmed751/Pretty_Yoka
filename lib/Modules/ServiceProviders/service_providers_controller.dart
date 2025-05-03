import 'package:Pretty/core/Language/locales.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/strings.dart';

class ServiceProvidersController extends ControllerMVC {
  // singleton
  factory ServiceProvidersController() {
    _this ??= ServiceProvidersController._();
    return _this!;
  }

  static ServiceProvidersController? _this;

  ServiceProvidersController._();

  bool loading = false;

}