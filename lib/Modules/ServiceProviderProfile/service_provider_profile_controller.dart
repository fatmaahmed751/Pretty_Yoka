import "package:Pretty/core/Language/locales.dart";
import "package:mvc_pattern/mvc_pattern.dart";

import "../../Utilities/strings.dart";



class ServiceProviderProfileController extends ControllerMVC {
  // singleton
  factory ServiceProviderProfileController() {
    _this ??= ServiceProviderProfileController._();
    return _this!;
  }

  int counter = 1;
  static ServiceProviderProfileController? _this;
  bool isClick = false;

  ServiceProviderProfileController._();

  bool loading = false;
  double productRating = 0.0;

  final List<String> services = [
    Strings.bridalMakeup.tr,
    Strings.eventMakeUp.tr,
    Strings.eyeBrow.tr,
    Strings.eyeLash.tr,
  ];

  final List<String> areas = [
    Strings.downTown.tr,
    Strings.gardenCity.tr,
    Strings.zamalek.tr,
  ];
  @override
  void initState() {
    super.initState();
    // Load cart from SharedPreferences
  }


  @override
  void dispose() {
    super.dispose();
  }
}