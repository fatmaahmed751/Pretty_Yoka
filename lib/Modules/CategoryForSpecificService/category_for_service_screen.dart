import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Utilities/strings.dart';
import '../../Utilities/text_style_helper.dart';
import '../../Utilities/theme_helper.dart';
import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/loading_screen.dart';
import '../../Widgets/service_provider_widget.dart';
import '../../generated/assets.dart';
import '../RequestServiceFromSpecificServiceProvider/request_service_from_specific_service_provider_screen.dart';
import '../ServiceInformationForSpecificCategory/service_information_for_specific_category_screen.dart';
import '../ServiceProviderInformation/service_provider_information_screen.dart';
import 'category_for_service_controller.dart';

class CategoryForServicesScreen extends StatefulWidget {
  static const routeName = "CategoryForServices";
  const CategoryForServicesScreen({super.key});

  @override
  createState() => _CategoryForServicesScreenState();
}

class _CategoryForServicesScreenState
    extends StateMVC<CategoryForServicesScreen> {
  _CategoryForServicesScreenState() : super(CategoryForServicesController()) {
    con = CategoryForServicesController();
  }

  late CategoryForServicesController con;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.of(context).background,
      appBar: CustomAppBarWidget.detailsScreen(
        title: Strings.makeUpArtist.tr,
        space: 1.w,
      ),
      body: SafeArea(
        child: LoadingScreen(
            loading: con.loading,
            child: Padding(
              padding:  EdgeInsetsDirectional.symmetric(horizontal: 24.w),
              child: ListView(
                children: [
                  Container(
                    width: 260.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                        color: ThemeClass.of(context).textFieldBackground,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      child: Row(
                        children: [
                          Text(
                            Strings.requestAnyService.tr,
                            style: TextStyleHelper.of(context).b_14.copyWith(
                                color: ThemeClass.of(context).primaryColor),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: (){
                              context.pushNamed(RequestServiceFromSpecificServiceProviderScreen.routeName);
                            },
                              child: SvgPicture.asset(Assets.imagesAddIcon))
                        ],
                      ),
                    ),
                  ),
                  Gap(12.h),
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 12.h,
                    children: List.generate(
                      20,
                      (index) => GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pushNamed(
                              ServiceProviderInformationForSpecificScreen.routeName);
                        },
                        child: ServiceProviderWidget(
                          width: 157.5.w,
                          height: 155.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
