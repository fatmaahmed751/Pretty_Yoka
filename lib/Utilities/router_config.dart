import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Modules/OnBoarding/onboarding_screen.dart';
import '../Modules/SelectRole/select_role_screen.dart';
import '../Modules/Splash/splash_screen.dart';
import '../Modules/UserSignUp/user_sign_up_screen.dart';
BuildContext? get currentContext_ => GoRouterConfig.router.routerDelegate.navigatorKey.currentContext;
class GoRouterConfig{
  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: SplashScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const SplashScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: OnBoardingScreen.routeName,
        path: "/${OnBoardingScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const OnBoardingScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),

      GoRoute(
        name: UserSignUpScreen.routeName,
        path: "/${UserSignUpScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const UserSignUpScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: SelectRoleScreen.routeName,
        path: "/${SelectRoleScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const SelectRoleScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),

    ],
    // redirect: (BuildContext context, GoRouterState state) {
    //   if(!SharedPref.isLogin()) return LoginScreen.routeName;
    //   if(state.matchedLocation == LoginScreen.routeName && SharedPref.isLogin()) return "/${HomeScreen.routeName}";
    //
    //   if(state.matchedLocation == OtpScreen.routeName && state.extra == null){
    //     return ForgotPasswordScreen.routeName;
    //   }
    // },
  );

  static CustomTransitionPage getCustomTransitionPage({required GoRouterState state, required Widget child}){
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}





