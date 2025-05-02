import 'package:mvc_pattern/mvc_pattern.dart';


class BookingsController extends ControllerMVC {
  // singleton
  factory BookingsController() {
    _this ??= BookingsController._();
    return _this!;
  }

  static BookingsController? _this;

  BookingsController._();

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
