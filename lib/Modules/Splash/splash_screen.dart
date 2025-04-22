import 'package:Pretty/Modules/Splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';

import '../../Utilities/theme_helper.dart';
import '../../Widgets/connectivity_check.dart';
import '../../generated/assets.dart';
import "../../main.dart";

class SplashScreen extends StatefulWidget {
  static const routeName = "/";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends StateMVC<SplashScreen> {
  _SplashScreenState() : super(SplashController()) {
    con = SplashController();
  }

  late SplashController con;
  //SplashController get con => controller is SplashController ? controller as SplashController : SplashController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      //con.getToken();
      con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final isConnected = Provider.of<bool>(context);
    return ConnectivityWrapper(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: 812.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: ThemeClass.backgroundGradiant,
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
            ),
          ),
          child: Image.asset(
            Assets.imagesSplash,
            width: 313.w,
            height: 214.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
