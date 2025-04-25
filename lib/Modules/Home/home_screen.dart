import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC<HomeScreen> {
  _HomeScreenState() : super(HomeController()) {
    con = HomeController();
  }

  late HomeController con;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget.mainScreen(title: "",
        space: 1,),
      bottomNavigationBar: const BottomNavBarWidget(
        selected: SelectedBottomNavBar.home,
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SafeArea(
          child: LoadingScreen(
            loading: con.loading,
            // color: Colors.transparent,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Gap(12.h),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                        child: SearchWidget(
                            backGroundColor: ThemeClass.of(context).background,
                            onSearch: (String? text) {},
                            isSearch: true,
                            controller: con.searchController,
                            onRemove: () {},
                            onChange: (String? value) {}),
                      ),
                      Gap(12.h),
                      SizedBox(
                        height: 265.h,
                        child: HomeCarouselWidget(
                          activeIndex: con.activeIndex,
                          onPageChange: (index) {
                            setState(() {
                              con.activeIndex = index;
                            });
                          },
                        ),
                      ),
                      Gap(12.h),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.symmetric(horizontal: 24.w),
                        child: Row(
                          children: [
                            CustomSideTextWidget(
                              text: Strings.ourServices.tr,
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: (){
                                GoRouter.of(context).pushNamed(AllServicesScreen.routeName);
                              },
                              child: Text(
                                Strings.viewAll.tr,
                                style: TextStyleHelper.of(context).b_16.copyWith(
                                    decoration: TextDecoration.underline,
                                    color: ThemeClass.of(context).primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(12.h),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 20.w),
                        child: SizedBox(
                          height: 125.h,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => CategoryWidget(
                                categoryModel: con.model[index],
                              ),
                              separatorBuilder: (context, index) => Gap(8.w),
                              itemCount: con.model.length),
                        ),
                      ),
                      Gap(16.h),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 20.w),
                        child: SizedBox(
                          height: 200.h,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  Image.asset(Assets.imagesOffers),
                              separatorBuilder: (context, index) => Gap(8.w),
                              itemCount: 3),
                        ),
                      ),
                      Gap(16.h),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.w,
                      mainAxisSpacing: 8.h,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                Assets.imagesPinkImage,
                              ),
                            ),
                          ),

                        );
                      },
                      childCount: 6,
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