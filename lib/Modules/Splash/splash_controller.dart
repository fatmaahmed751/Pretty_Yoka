import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:mvc_pattern/mvc_pattern.dart";
import "../../../Utilities/shared_preferences.dart";
import "../../Utilities/router_config.dart";
import "package:flutter/services.dart";
import "package:geolocator/geolocator.dart";
import "../../Widgets/location_services.dart";
import "../Bookings/bookings_screen.dart";
import "../Favotites/favorite_screen.dart";
import "../OnBoarding/onboarding_screen.dart";
import "../RequestService/request_service_screen.dart";
import "../ServiceProviderInformation/service_provider_information_screen.dart";
import "../UserSignUp/user_sign_up_screen.dart";


class SplashController extends ControllerMVC with WidgetsBindingObserver {
  // singleton
  factory SplashController() {
    _this ??= SplashController._();
    return _this!;
  }
  static SplashController? _this;
  bool isFirstImage = true;
  SplashController._(){
    WidgetsBinding.instance.addObserver(this); // Add observer for lifecycle events
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Remove observer when done
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // App resumed, re-check location services
      print("App resumed. Re-checking location services...");
      checkLocationServices(currentContext_!);
    }
  }
  Future<void> checkLocationServices(BuildContext context) async {
    final locationService = LocationService();
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await showEnableLocationDialog(context);
    }else{
      await locationService.getCurrentLocationAndAddress();
      navigateToNextScreen(context);
    }

  }

  Future<void> showEnableLocationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // User must enable location services
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Location Services Required"),
          content: Text("Please enable location services to continue."),
          actions: <Widget>[
            TextButton(
              child: Text("cancel"),
              onPressed: ()  {
                SystemNavigator.pop();
              },
            ),
            TextButton(
              child: Text("Open Settings"),
              onPressed: () async {
                await Geolocator.openLocationSettings();
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }
  void navigateToNextScreen(BuildContext context) {
    if (SharedPref.isLogin()) {
    GoRouter.of(context).goNamed(OnBoardingScreen.routeName);
    } else {
      GoRouter.of(context).goNamed(BookingsScreen.routeName);
    }
  }

  Future init(BuildContext context)async{
    await Future.delayed(const Duration(seconds: 2));

    // if (currentContext_!.mounted) {
    //   setState(() {
    //     isFirstImage = false;
    //   });
    // }
    //  await SplashDataHandler.getCurrentUser();
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      await checkLocationServices(context);
    }
  }
}

