import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Modules/ForgetPassword/forget_password_screen.dart';
import '../Modules/Login/user_login_screen.dart';
import '../Modules/OnBoarding/onboarding_screen.dart';
import '../Modules/ResetPassword/reset_password_screen.dart';
import '../Modules/ResetPassword/widget/verify_password_otp.dart';
import '../Modules/SelectRole/select_role_screen.dart';
import '../Modules/Splash/splash_screen.dart';
import '../Modules/UserInfomations/user_information_screen.dart';
import '../Modules/UserSignUp/user_sign_up_screen.dart';
import '../Modules/VerificationAccountOtp/verification_otp_screen.dart';
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
        name: VerificationUserScreen.routeName,
        path: "/${VerificationUserScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const VerificationUserScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),

      GoRoute(
        name: VerificationNewPasswordForUserScreen.routeName,
        path: "/${VerificationNewPasswordForUserScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const VerificationNewPasswordForUserScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ResetPasswordScreen.routeName,
        path: "/${ ResetPasswordScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ResetPasswordScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: UserLoginScreen.routeName,
        path: "/${UserLoginScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const UserLoginScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ForgetPasswordScreen.routeName,
        path: "/${ForgetPasswordScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ForgetPasswordScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: UserInformationScreen.routeName,
        path: "/${UserInformationScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const UserInformationScreen(),
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





