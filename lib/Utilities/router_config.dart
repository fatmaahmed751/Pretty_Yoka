import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Modules/AllServices/all_services_screen.dart';
import '../Modules/Bookings/bookings_screen.dart';
import '../Modules/CategoryForSpecificService/category_for_service_screen.dart';
import '../Modules/ChangePassword/change_password_screen.dart';
import '../Modules/ChangePhoneNumber/change_phone_number_screen.dart';
import '../Modules/ConfirmBooking/confirm_booking_screen.dart';
import '../Modules/EWallet/wallet_screen.dart';
import '../Modules/EditProfile/edit_profile_screen.dart';
import '../Modules/Favotites/favorite_screen.dart';
import '../Modules/ForgetPassword/forget_password_screen.dart';
import '../Modules/GeneralRequest/general_request_screen.dart';
import '../Modules/GeneralServiceProviders/general_service_providers_screen.dart';
import '../Modules/Home/home_screen.dart';
import '../Modules/Login/user_login_screen.dart';
import '../Modules/Notifications/notifications_screen.dart';
import '../Modules/OnBoarding/onboarding_screen.dart';
import '../Modules/Pharmacies/pharmacies_screen.dart';
import '../Modules/Policies/policies_screen.dart';
import '../Modules/Profile/user_profile_screen.dart';
import '../Modules/RequestService/request_service_screen.dart';
import '../Modules/RequestService/widgets/send_resquest_successfully.dart';
import '../Modules/RequestServiceFromSpecificServiceProvider/request_service_from_specific_service_provider_screen.dart';
import '../Modules/ResetPassword/reset_password_screen.dart';
import '../Modules/ResetPassword/widget/verify_password_otp.dart';
import '../Modules/SelectJobTitle/select_job_title_screen.dart';
import '../Modules/SelectRole/select_role_screen.dart';
import '../Modules/ServiceInformationForSpecificCategory/service_information_for_specific_category_screen.dart';
import '../Modules/ServiceProviderBookings/service_provider_bookings_screen.dart';
import '../Modules/ServiceProviderEditService/service_provider_edit_service.dart';
import '../Modules/ServiceProviderHome/service_provider_home_screen.dart';
import '../Modules/ServiceProviderInformation/service_provider_information_screen.dart';
import '../Modules/ServiceProviderLogin/service_provider_login_screen.dart';
import '../Modules/ServiceProviderPayment/service_provider_payment.dart';
import '../Modules/ServiceProviderPersonalData/service_provider_personal_data_screen.dart';
import '../Modules/ServiceProviderProfile/service_provider_profile_screen.dart';
import '../Modules/ServiceProviderSignUp/service_provider_sign_up_screen.dart';
import '../Modules/ServiceProviderSponsers/service_provider_sponsors_screen.dart';
import '../Modules/ServiceProviders/service_providers_screen.dart';
import '../Modules/ServicesData/services_data_screen.dart';
import '../Modules/Splash/splash_screen.dart';
import '../Modules/Sponsors/sponsors_screen.dart';
import '../Modules/SupportChat/support_chat_screen.dart';
import '../Modules/UserInfomations/user_information_screen.dart';
import '../Modules/UserPayment/user_payment_screen.dart';
import '../Modules/UserSignUp/user_sign_up_screen.dart';
import '../Modules/VerificationAccountOtp/verification_otp_screen.dart';
import '../Modules/VerificationServiceProviderScreen/provider_verification_otp_screen.dart';
import '../Modules/serviceProviderFillInformation/service_provider_fill_information_screen.dart';
import '../Modules/serviceProviderSettingsScreen/service_settings_screen.dart';
import '../Widgets/provider_send_request_success.dart';
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
        name: ProviderSendRequestSuccessfully.routeName,
        path: "/${ProviderSendRequestSuccessfully.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ProviderSendRequestSuccessfully(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ServiceProviderEditServiceScreen.routeName,
        path: "/${ServiceProviderEditServiceScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ServiceProviderEditServiceScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ServiceProviderSponsorsScreen.routeName,
        path: "/${ServiceProviderSponsorsScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ServiceProviderSponsorsScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: PharmaciesScreen.routeName,
        path: "/${PharmaciesScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const PharmaciesScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ServiceProvidersScreen.routeName,
        path: "/${ServiceProvidersScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ServiceProvidersScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),

      GoRoute(
        name: BookingsScreen.routeName,
        path: "/${BookingsScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const BookingsScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: SupportChatScreen.routeName,
        path: "/${SupportChatScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const SupportChatScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: PoliciesScreen.routeName,
        path: "/${PoliciesScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const PoliciesScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: EditProfileScreen.routeName,
        path: "/${EditProfileScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const EditProfileScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ChangePhoneScreen.routeName,
        path: "/${ChangePhoneScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ChangePhoneScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ChangePasswordScreen.routeName,
        path: "/${ChangePasswordScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ChangePasswordScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),

      GoRoute(
        name: ServiceProviderInformationScreen.routeName,
        path: "/${ServiceProviderInformationScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ServiceProviderInformationScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ConfirmBookingScreen.routeName,
        path: "/${ConfirmBookingScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ConfirmBookingScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),

      GoRoute(
        name: ServiceProviderPaymentScreen.routeName,
        path: "/${ServiceProviderPaymentScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ServiceProviderPaymentScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: PaymentScreen.routeName,
        path: "/${PaymentScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const PaymentScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: WalletScreen.routeName,
        path: "/${WalletScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const WalletScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ServiceProviderBookingsScreen.routeName,
        path: "/${ServiceProviderBookingsScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ServiceProviderBookingsScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: NotificationsScreen.routeName,
        path: "/${NotificationsScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const NotificationsScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ServicesDataScreen.routeName,
        path: "/${ServicesDataScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ServicesDataScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ServiceProviderPersonalDataScreen.routeName,
        path: "/${ServiceProviderPersonalDataScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ServiceProviderPersonalDataScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ServiceProviderProfileScreen.routeName,
        path: "/${ServiceProviderProfileScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ServiceProviderProfileScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ServiceProviderHomeScreen.routeName,
        path: "/${ServiceProviderHomeScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ServiceProviderHomeScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ServiceProviderSettingsScreen.routeName,
        path: "/${ServiceProviderSettingsScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ServiceProviderSettingsScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ServiceProviderLoginScreen.routeName,
        path: "/${ServiceProviderLoginScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ServiceProviderLoginScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ServiceProviderSignUpScreen.routeName,
        path: "/${ServiceProviderSignUpScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ServiceProviderSignUpScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: SelectJobTitleScreen.routeName,
        path: "/${SelectJobTitleScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const SelectJobTitleScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ServiceProviderFillInformationScreen.routeName,
        path: "/${ServiceProviderFillInformationScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ServiceProviderFillInformationScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: GeneralServiceProvidersScreen.routeName,
        path: "/${GeneralServiceProvidersScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const GeneralServiceProvidersScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: GeneralRequestServiceScreen.routeName,
        path: "/${GeneralRequestServiceScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const GeneralRequestServiceScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: RequestServiceFromSpecificServiceProviderScreen.routeName,
        path: "/${RequestServiceFromSpecificServiceProviderScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const RequestServiceFromSpecificServiceProviderScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: ServiceProviderInformationForSpecificScreen.routeName,
        path: "/${ServiceProviderInformationForSpecificScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ServiceProviderInformationForSpecificScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: AllServicesScreen.routeName,
        path: "/${AllServicesScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const AllServicesScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: CategoryForServicesScreen.routeName,
        path: "/${CategoryForServicesScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const CategoryForServicesScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: UserProfileScreen.routeName,
        path: "/${UserProfileScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const UserProfileScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: FavoriteScreen.routeName,
        path: "/${FavoriteScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const FavoriteScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: SendRequestSuccessfully.routeName,
        path: "/${SendRequestSuccessfully.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const SendRequestSuccessfully(),
          );
        },
        routes: const <RouteBase>[],
      ),

      GoRoute(
        name: ProviderVerificationScreen.routeName,
        path: "/${ProviderVerificationScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const ProviderVerificationScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      GoRoute(
        name: RequestServiceScreen.routeName,
        path: "/${RequestServiceScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const RequestServiceScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),

      GoRoute(
        name: SponsorsScreen.routeName,
        path: "/${SponsorsScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const SponsorsScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),



      GoRoute(
        name: HomeScreen.routeName,
        path: "/${HomeScreen.routeName}",
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child:  const HomeScreen(),
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





