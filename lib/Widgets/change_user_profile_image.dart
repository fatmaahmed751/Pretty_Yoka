import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../../../../generated/assets.dart';
import '../Modules/UserInfomations/user_information_controller.dart';

class ChangeImageWidget extends StatefulWidget {
  final dynamic image;
  const ChangeImageWidget({super.key, this.image});

  @override
  createState() => ChangeImageWidgetState();
}

class ChangeImageWidgetState extends StateMVC<ChangeImageWidget> {
  ChangeImageWidgetState() : super(UserInformationController()) {
    con = UserInformationController();
  }
  late UserInformationController con;

  @override
  void initState() {
    con.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          SizedBox(
            height: 120.h,
            width: 120.w,
            child: CircleAvatar(
              radius: 107,
              backgroundImage:
              con.image != null
                  ? FileImage(con.image!)
                  : con.buildImageProvider(""),
            ),
          ),

          GestureDetector(
            onTap: () {
              con.getImage();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(
                Assets.imagesPinkImage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
