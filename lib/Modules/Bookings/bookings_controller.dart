import 'package:mvc_pattern/mvc_pattern.dart';

import 'bookings_screen.dart';


class BookingsController extends ControllerMVC {
  // singleton
  factory BookingsController() {
    _this ??= BookingsController._();
    return _this!;
  }

  static BookingsController? _this;

  BookingsController._();
  BookingTab selectedTab = BookingTab.upcoming;
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


}
