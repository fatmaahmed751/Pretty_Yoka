import 'package:mvc_pattern/mvc_pattern.dart';

class SponsorsController extends ControllerMVC {
  // singleton
  factory SponsorsController() {
    _this ??= SponsorsController._();
    return _this!;
  }

  static SponsorsController? _this;

  SponsorsController._();

  bool loading = false;

}