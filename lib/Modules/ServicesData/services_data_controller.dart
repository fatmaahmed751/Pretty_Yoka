
import 'package:mvc_pattern/mvc_pattern.dart';

class ServicesDataController extends ControllerMVC {
  // singleton
  factory ServicesDataController() {
    _this ??= ServicesDataController._();
    return _this!;
  }

  static ServicesDataController? _this;

  ServicesDataController._();

  bool loading = false,
      autoValidate = false;


  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}