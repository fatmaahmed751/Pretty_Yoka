
import 'package:Pretty/core/Language/locales.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';

import '../../Models/categoryModel.dart';
import '../../Utilities/strings.dart';
import '../../core/Language/app_languages.dart';
import '../../generated/assets.dart';

class ServiceProviderHomeController extends ControllerMVC {
  // singleton
  factory ServiceProviderHomeController() {
    _this ??= ServiceProviderHomeController._();
    return _this!;
  }

  static ServiceProviderHomeController? _this;
  int selectedLanguage = 1;
  late TextEditingController searchController;
  int activeIndex=0;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }
List<CategoryModel>model=[
  CategoryModel(image: Assets.imagesFaceCare, name: Strings.makeUpArtist.tr),
  CategoryModel(image: Assets.imagesFaceCare, name:Strings.makeUpArtist.tr),
  CategoryModel(image: Assets.imagesFaceCare, name: Strings.makeUpArtist.tr),
  CategoryModel(image: Assets.imagesFaceCare, name: Strings.makeUpArtist.tr),
  CategoryModel(image: Assets.imagesFaceCare, name: Strings.makeUpArtist.tr),
];


  onPageChange(int index)
  {
    setState(() {
      activeIndex=index;
    });
    activeIndex=index;
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> loadCurrentLanguage(BuildContext ctx) async {
    await Provider.of<AppLanguage>(ctx, listen: false).fetchLocale(ctx);

    final currentLanguage =
        Provider
            .of<AppLanguage>(ctx, listen: false)
            .appLang;

    print("Current language: $currentLanguage");
    setState(() {
      selectedLanguage = currentLanguage == Languages.en ? 1 : 2;
    });
  }

  ServiceProviderHomeController._();

  bool loading = false;
}