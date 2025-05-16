
import 'package:Pretty/Modules/ChangePassword/change_password_screen.dart';
import 'package:Pretty/Modules/ChangePhoneNumber/change_phone_number_screen.dart';
import 'package:Pretty/Modules/EditProfile/edit_profile_screen.dart';
import 'package:Pretty/Modules/Profile/user_profile_controller.dart';
import 'package:Pretty/Modules/serviceProviderSettingsScreen/service_settings_controller.dart';
import 'package:Pretty/Widgets/custom_textfield_widget.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../../Widgets/loading_screen.dart';
import '../../../Utilities/strings.dart';
import '../../../generated/assets.dart';
import '../../Utilities/shared_preferences.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import '../../Widgets/bottom_navbar_widget.dart';
import '../../Widgets/service_bottom_navbar_widget.dart';
import '../EWallet/wallet_screen.dart';
import '../Policies/policies_screen.dart';
import '../Profile/Widget/user_profile_container_widget.dart';
import '../SupportChat/support_chat_screen.dart';

class ServiceProviderSettingsScreen extends StatefulWidget {
  static const routeName = "ServiceProviderSettings";

  const ServiceProviderSettingsScreen({super.key});

  @override
  createState() => _ServiceProviderSettingsScreenState();
}

class _ServiceProviderSettingsScreenState extends StateMVC<ServiceProviderSettingsScreen> {
  _ServiceProviderSettingsScreenState() : super(ServiceProviderSettingsController()) {
    con = ServiceProviderSettingsController();
  }
  late ServiceProviderSettingsController con;

  @override
  void initState() {
    con.init();
    // con.updateNotifications(context);
    //con.unReadNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar:  const ServiceBottomNavBarWidget(
        selected: ServiceSelectedBottomNavBar.settings,
      ),
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Padding(
            padding:  EdgeInsetsDirectional.symmetric(horizontal:24.w,vertical:24.h ),
            child: Column(
              children: [
                Gap(20.h),
                Container(
                  height:460.h,
                  decoration: BoxDecoration(
                    color: ThemeClass.of(context).textFieldBackground,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsetsDirectional.only(top: 12.h, bottom:12.h),
                    child:
                    ListView(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(WalletScreen.routeName);
                          },
                          child: UserProfileContainerWidget(
                            image: (Assets.imagesWallet),
                            text: Strings.wallet.tr,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(SupportChatScreen.routeName);
                          },
                          child: UserProfileContainerWidget(
                            image: (Assets.imagesSupportP),
                            text: Strings.support.tr,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            con.changeLanguageOfApp(context);
                          },
                          child: UserProfileContainerWidget(
                            image: (Assets.imagesSupportP),
                            text: Strings.language.tr,
                          ),
                        ),

                        // Gap(10.h),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(
                              ChangePhoneScreen.routeName,
                              // extra:OrderInfoModel()
                            );
                          },
                          child: UserProfileContainerWidget(
                            image: (Assets.imagesChangePhP),
                            text: Strings.changePhone.tr,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(ChangePasswordScreen.routeName);
                          },
                          child: UserProfileContainerWidget(
                            image: (Assets.imagesChangePassP),
                            text: Strings.changePassword.tr,
                          ),
                        ),



                        GestureDetector(
                          onTap: () {
                            context.pushNamed(PoliciesScreen.routeName);
                            // ,extra:PoliciesModel());
                          },
                          child: UserProfileContainerWidget(
                            image: (Assets.imagesPoliciesP),
                            text: Strings.policies.tr,
                          ),
                        ),


                        GestureDetector(
                          onTap: () {
                            con.userLogOutPop(context);
                          },
                          child: UserProfileContainerWidget(
                            image: (Assets.imagesLogOut),
                            text: Strings.logOut.tr,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

