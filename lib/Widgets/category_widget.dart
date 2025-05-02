import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../Models/categoryModel.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../generated/assets.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryWidget({
    super.key, required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //GoRouter.of(context).pushNamed(ServicesListScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
           // color: ThemeClass.of(context).background,
            borderRadius: BorderRadius.circular(20.r)
        ),
        child: Padding(
          padding:  EdgeInsetsDirectional.symmetric(horizontal: 8.w,vertical:5.h),
          child: Column(
            children: [
              CircleAvatar(
                radius: 40.r,
                backgroundImage:const AssetImage(Assets.imagesFaceCare) ,
              ),
              Gap(8.h),
              Text(
                categoryModel.name,
                style: TextStyleHelper.of(context).b_15.copyWith(
                    color: ThemeClass.of(context).secondaryBlackColor,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}