import 'package:Pretty/Modules/ServicesData/services_data_controller.dart';
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mvc_pattern/mvc_pattern.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/theme_helper.dart';

import '../../Widgets/custom_app_bar_widget.dart';
import '../../Widgets/loading_screen.dart';

class ServicesDataScreen extends StatefulWidget {
  static const routeName = "ServicesData";
  const ServicesDataScreen({super.key});

  @override
  createState() => _ServicesDataScreenState();
}

class _ServicesDataScreenState extends StateMVC<ServicesDataScreen> {
  _ServicesDataScreenState() : super(ServicesDataController()) {
    con = ServicesDataController();
  }
  late ServicesDataController con;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.of(context).background,
      body: LoadingScreen(
        loading: con.loading,
        child: Form(
          key: _formKey,
          autovalidateMode: con.autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
              child:
                  ListView(physics: const BouncingScrollPhysics(), children: [
                CustomAppBarWidget.mainScreen(
                  title: Strings.serviceData.tr,
                  space: 110.w,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
