import 'package:mvc_pattern/mvc_pattern.dart';

class FavoriteController extends ControllerMVC {
  // singleton
  factory FavoriteController() {
    _this ??= FavoriteController._();
    return _this!;
  }

  static FavoriteController? _this;
  bool isUserHaveFavorites = false;

  FavoriteController._();

  bool loading = false;
  bool isLogin = true;
}