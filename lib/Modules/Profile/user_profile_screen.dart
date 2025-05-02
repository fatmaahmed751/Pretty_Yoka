
import 'package:Pretty/Modules/Profile/user_profile_controller.dart';
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
    print(SharedPref.getCurrentUser().toString());
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
              Container(
              height:88.h,
              decoration: BoxDecoration(
                color: ThemeClass.of(context).background,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow:  [
                  BoxShadow(
                    color:ThemeClass.of(context).waiting,
                    spreadRadius: 1,
                    blurRadius: 1,
                  ),
                ],
              ),
              child:Padding(
                padding:  EdgeInsetsDirectional.symmetric(horizontal: 8.w,),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 72.h,
                      width: 72.w,
                      child:  CircleAvatar(
                        radius: 72.r,
                        backgroundImage:const AssetImage(Assets.imagesUserDefaultImage)
                      ),
                    ),
                    Gap(8.w),
                    Padding(
                      padding:  EdgeInsetsDirectional.only(top:12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Linda Ahmed",
                            style: TextStyleHelper.of(context).h_18,
                          ),
                          //Gap(4.h),
                          Text(
                            "LindaAhmed@gmail.com",
                            style: TextStyleHelper.of(context).b_14.copyWith(
                              color: ThemeClass.of(context).secondaryBlackColor
                            ),

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ),
                Gap(20.h),
                Container(
                    height:440.h,
                    decoration: BoxDecoration(
                      color: ThemeClass.of(context).background,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow:  [
                        BoxShadow(
                          color:ThemeClass.of(context).waiting,
                          spreadRadius: 1,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.only(top: 24.h, bottom: 24.h),
                      child:
                      ListView(
                        // children: [
                        //   GestureDetector(
                        //     onTap: () {
                        //     //  context.pushNamed(PersonalDataScreen.routeName);
                        //     },
                        //     child: UserProfileContainerWidget(
                        //       image: (Assets.imagesPersonalIcon),
                        //       text: Strings.personalData.tr,
                        //     ),
                        //   ),
                        //   // Gap(10.h),
                        //   GestureDetector(
                        //     onTap: () {
                        //       context.pushNamed(
                        //         SecurityDataScreen.routeName,
                        //         // extra:OrderInfoModel()
                        //       );
                        //     },
                        //     child: UserProfileContainerWidget(
                        //       image: (Assets.imagesSecurityIcon),
                        //       text: Strings.securityData.tr,
                        //     ),
                        //   ),
                        //   GestureDetector(
                        //     onTap: () async {
                        //       await con.changeLanguageOfApp(context);
                        //     },
                        //     child: UserProfileContainerWidget(
                        //       image: (Assets.imagesLanguagesIcon),
                        //       text: Strings.languages.tr,
                        //     ),
                        //   ),
                        //   GestureDetector(
                        //     onTap: () {
                        //       context.pushNamed(SupportScreen.routeName);
                        //     },
                        //     child: UserProfileContainerWidget(
                        //       image: (Assets.imagesSupportIcon),
                        //       text: Strings.support.tr,
                        //     ),
                        //   ),
                        //
                        //
                        //
                        //   GestureDetector(
                        //     onTap: () {
                        //       context.pushNamed(PoliciesScreen.routeName);
                        //           // ,extra:PoliciesModel());
                        //     },
                        //     child: UserProfileContainerWidget(
                        //       image: (Assets.imagesPoliciesIcon),
                        //       text: Strings.policy.tr,
                        //     ),
                        //   ),
                        //
                        //   GestureDetector(
                        //     onTap: () {
                        //       con.deleteUserAccountPop(context);
                        //     },
                        //     child: UserProfileContainerWidget(
                        //       image: (Assets.imagesDeleteIcon),
                        //       text: Strings.deleteAccount.tr,
                        //     ),
                        //   ),
                        //
                        //   GestureDetector(
                        //     onTap: () {
                        //       con.userLogOutPop(context);
                        //     },
                        //     child: UserProfileContainerWidget(
                        //       image: (Assets.imagesLogOutIcon),
                        //       text: Strings.logOut.tr,
                        //     ),
                        //   ),
                        // ],
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

