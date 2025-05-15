import 'package:mvc_pattern/mvc_pattern.dart';

class ServiceProviderSponsorsController extends ControllerMVC {
  // singleton
  factory ServiceProviderSponsorsController() {
    _this ??= ServiceProviderSponsorsController._();
    return _this!;
  }

  static ServiceProviderSponsorsController? _this;

  ServiceProviderSponsorsController._();

  bool loading = false;

}