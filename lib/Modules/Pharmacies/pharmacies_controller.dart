import 'package:mvc_pattern/mvc_pattern.dart';

class PharmaciesController extends ControllerMVC {
  // singleton
  factory PharmaciesController() {
    _this ??= PharmaciesController._();
    return _this!;
  }

  static PharmaciesController? _this;

  PharmaciesController._();

  bool loading = false;
}