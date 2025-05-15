import 'package:Pretty/Modules/ServiceProviderBookings/service_provider_bookings_screen.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/strings.dart';
import '../Bookings/bookings_screen.dart';


class ServiceProviderBookingsController extends ControllerMVC {
  // singleton
  factory ServiceProviderBookingsController() {
    _this ??= ServiceProviderBookingsController._();
    return _this!;
  }

  static ServiceProviderBookingsController? _this;

  ServiceProviderBookingsController._();
  ServiceBookingTab serviceSelectedTab = ServiceBookingTab.pending;
  bool loading = false;
  bool isLogin = false;
  bool isClick = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  final List<String> services = [
    Strings.bridalMakeup.tr,
    Strings.eventMakeUp.tr,
    Strings.eyeBrow.tr,
    Strings.eyeLash.tr,
  ];


}
