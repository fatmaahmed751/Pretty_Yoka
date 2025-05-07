
import 'package:Pretty/Modules/ChangePassword/change_password_screen.dart';
import 'package:Pretty/Modules/ChangePhoneNumber/change_phone_number_screen.dart';
import 'package:Pretty/Modules/EditProfile/edit_profile_screen.dart';
import 'package:Pretty/Modules/Profile/user_profile_controller.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import '../Policies/policies_screen.dart';
import '../SupportChat/support_chat_screen.dart';
import 'Widget/user_profile_container_widget.dart';

class UserProfileScreen extends StatefulWidget {
  static const routeName = "UserProfile";

  const UserProfileScreen({super.key});

  @override
  createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends StateMVC<UserProfileScreen> {
  _UserProfileScreenState() : super(UserProfileController()) {
    con = UserProfileController();
  }
  late UserProfileController con;

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

      bottomNavigationBar: const BottomNavBarWidget(
        selected: SelectedBottomNavBar.profile,
      ),
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Padding(
            padding:  EdgeInsetsDirectional.symmetric(horizontal:24.w,vertical:24.h ),
            child: Column(
              children: [
              Padding(
                padding:  EdgeInsetsDirectional.symmetric(horizontal: 8.w,),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                  //    width: 80.w,
                     // height: 80.h,
                      child: CircleAvatar(
                        backgroundColor: ThemeClass.of(context).primaryColor,
                        radius: 34.r,
                        child: CircleAvatar(
                          radius: 32.r,
                          backgroundImage:const AssetImage(Assets.imagesFavoriteServiceProvider)
                        ),
                      ),
                    ),
                    Gap(8.w),
                    Text(
                      "Linda Ahmed",
                      style: TextStyleHelper.of(context).h_20,
                    ),

                  ],
                ),
              ),
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
                             context.pushNamed(EditProfileScreen.routeName);
                            },
                            child: UserProfileContainerWidget(
                              image: (Assets.imagesEditP),
                              text: Strings.editProfile.tr,
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
                              context.pushNamed(SupportChatScreen.routeName);
                            },
                            child: UserProfileContainerWidget(
                              image: (Assets.imagesSupportP),
                              text: Strings.support.tr,
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
                              con.changeLanguageOfApp(context);
                            },
                            child: UserProfileContainerWidget(
                              image: (Assets.imagesSupportP),
                              text: Strings.language.tr,
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

