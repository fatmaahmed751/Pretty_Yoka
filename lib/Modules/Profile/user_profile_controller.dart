import 'dart:convert';
import 'dart:io';

import 'package:Pretty/Modules/Login/user_login_screen.dart';
import 'package:Pretty/Widgets/toast_helper.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import '../../../Utilities/strings.dart';
import '../../../core/Language/app_languages.dart';
import '../../Models/user_model.dart';
import '../../Utilities/dialog_helper.dart';
import '../../Utilities/router_config.dart';
import '../../Utilities/shared_preferences.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import '../../Widgets/Alert_for_complete_information.dart';
import '../../Widgets/alert_dialoge_widget.dart';
import '../../Widgets/custom_textfield_widget.dart';
import '../../generated/assets.dart';
import '../SelectRole/select_role_screen.dart';
import 'Widget/change_languages_widget.dart';

class UserProfileController extends ControllerMVC {
  // singleton
  factory UserProfileController() {
    _this ??= UserProfileController._();
    return _this!;
  }

  static UserProfileController? _this;
  UserProfileController._();
  bool loading = false, autoValidate = false;
  bool isEnglishSelected = true;
  bool status = false;
  bool isLogin = true;
  bool isUser = false;
  String? selectedValue = Strings.setLocation.tr;
  dynamic image;
  final ImagePicker picker = ImagePicker();
  @override
  void initState() {
    super.initState();
  }

  init() async {
    loadUserImage();
    loadCurrentLanguage(currentContext_!);
  }

  @override
  void dispose() {
    super.dispose();
  }

  int selectedLanguage = 1;

  void selectLanguage(int language) {
    selectedLanguage = language;
    setState(() {});
  }

  Future<void> loadUserImage() async {
    setState(() {
      loading = true;
    });
    String? userImagePath = await SharedPref.getCurrentUserImage();
    setState(() {
      image =
          userImagePath != null ? File(userImagePath) : null; // Convert to File
      loading = false;
    });
  }

  ImageProvider buildImageProvider(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return const AssetImage(Assets.imagesUserDefaultImage);
    }
    final file = File(imagePath);
    if (file.existsSync()) {
      return FileImage(file); // Return the FileImage if the file exists
    }
    if (Uri.tryParse(imagePath)?.hasAbsolutePath ?? false) {
      return CachedNetworkImageProvider(imagePath);
    } else {
      return AssetImage(Assets.imagesUserDefaultImage);
    }
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    try {
      if (pickedFile != null) {
        final imagePath = pickedFile.path;
        setState(() {
          image = File(imagePath);
        });
        UserModel? currentUser = SharedPref.getCurrentUser();
        await SharedPref.saveCurrentUser(user: currentUser!);
        await SharedPref.saveCurrentUserImage(image);

        // print(pickedFile.path);
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<String> encodeImageToBase64(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    return base64Encode(imageBytes);
  }

  userLogOutPop(BuildContext context) {
    return DialogHelper.custom(context: context).customDialog(
      dialogWidget: AlertWarningWidget(
        des: Strings.deleteLogOutSide.tr,
        secondButtonText: Strings.logOut.tr,
        mainText: Strings.confirmLogout.tr,
        onButtonReject: currentContext_!.pop,
        onButtonAccept: () {
            GoRouter.of(context).pushNamed(SelectRoleScreen.routeName);
        },
      ),
    );
  }

  // userLogOutPop(BuildContext context,Widget widget) {
  //   return
  //     DialogHelper.custom(context: context).customDialog(
  //      dialogWidget:
  //      AlertForCompleteInformation(
  //        thirdText: Strings.id.tr,
  //         des:Strings.cannotBooking.tr,
  //         secondButtonText: Strings.save.tr,
  //         mainText:Strings.uploadId.tr,
  //         onButtonReject: currentContext_!.pop,
  //         onButtonAccept: () {
  //          GoRouter.of(context).pushNamed(SelectRoleScreen.routeName);
  //         }, widget:widget ,
  //
  //            ),
  //   );
  // }

  //
  deleteUserAccountPop(BuildContext context) {
    return DialogHelper.custom(context: context).customDialog(
      dialogWidget: AlertWarningWidget(
        secondButtonText: Strings.delete.tr,
        des: Strings.deleteAccountSide.tr,
        mainText: Strings.confirmDeleteAccount.tr,
        onButtonReject: currentContext_!.pop,
        onButtonAccept: () {
          GoRouter.of(context).pushNamed(UserLoginScreen.routeName);
        },
      ),
    );
  }

  void completeSendRequest(
    BuildContext context,
  ) {
    return DialogHelper.custom(context: context).customDialog(
      dialogWidget: AlertForCompleteInformation(
        thirdText: Strings.id.tr,
        des: Strings.cannotBooking.tr,
        secondButtonText: Strings.save.tr,
        mainText: Strings.uploadId.tr,
        onButtonReject: currentContext_!.pop,
        onButtonAccept: () {
          GoRouter.of(context).pushNamed(SelectRoleScreen.routeName);
        },
        widget: Container(
            width: 267.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: ThemeClass.of(context).mainSecondary,
                borderRadius: BorderRadius.circular(12.r)),
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 0.w, vertical: 0.h),
              child: CustomTextFieldWidget(
                hint: Strings.hintId.tr,
                textAlign: TextAlignVertical.center,
                hintStyle: TextStyleHelper.of(context).b_14.copyWith(
                      color: ThemeClass.of(context).labelColor,
                    ),
                onSuffixTap: () {},
                suffixIcon: SvgPicture.asset(Assets.imagesUploadId),
              ),
            )),
      ),
    );
  }

  changeLanguageOfApp(BuildContext context) async {
    await loadCurrentLanguage(context);
    DialogHelper.custom(context: context)
        .customDialog(dialogWidget: const ChangeLanguage());
  }

  Future<void> loadCurrentLanguage(BuildContext ctx) async {
    await Provider.of<AppLanguage>(ctx, listen: false).fetchLocale(ctx);

    final currentLanguage =
        Provider.of<AppLanguage>(ctx, listen: false).appLang;

    print("Current language: $currentLanguage");
    setState(() {
      selectedLanguage = currentLanguage == Languages.en ? 1 : 2;
    });
  }
}
