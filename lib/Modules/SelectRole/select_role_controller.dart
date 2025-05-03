
import 'package:mvc_pattern/mvc_pattern.dart';

class SelectRoleController extends ControllerMVC {
  // singleton
  factory SelectRoleController() {
    _this ??= SelectRoleController._();
    return _this!;
  }

  static SelectRoleController? _this;

  SelectRoleController._();

  bool loading = false,
      autoValidate = false;
  int selectRole = 1;

  void updateRole(int newRole) {
    selectRole = newRole;
    setState(() {}); // Notify listeners when the role changes
  }

}
