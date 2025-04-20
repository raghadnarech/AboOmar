// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Services/Responsive.dart';
import 'package:supplier/Services/Routes.dart';

import 'package:supplier/View/Drawer/Drawer.dart';
import 'package:supplier/View/MainCategorey/Add/AddMainCategorey.dart';
import 'package:supplier/View/MainCategorey/Widget/CardCategory.dart';
import 'package:supplier/View/MainCategorey/Add/Controller/AddMainCategoryController.dart';
import 'package:supplier/View/MainPage/Controller/MainPageController.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class MainCategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: Icon(
        //     Icons.message,
        //     color: kBaseColor,
        //   ),
        // ),
        key: scaffoldKey,
        drawer: CustomDrawer(),
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => scaffoldKey.currentState?.openDrawer(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/svg/menu.svg',
                width: 15,
                height: 15,
              ),
            ),
          ),
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: Text(
            "التصنيفات الرئيسية",
            style: style15semiboldwhite,
          ),
        ),
        body: Consumer<MainPageController>(
          builder: (context, controller, child) => RefreshIndicator(
            onRefresh: () => controller.GetMainCategory(),
            child: ListView(
              padding: EdgeInsets.all(15),
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "التصنيفات الرئيسية",
                      style: style15semibold,
                    ),
                    GestureDetector(
                      onTap: () {
                        CustomRoute.RouteReplacementTo(
                            context,
                            ChangeNotifierProvider(
                              create: (context) => AddMainCategoryController(),
                              builder: (context, child) => AddMainCategorey(),
                            ));
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: kFourthColor,
                        ),
                        child: Icon(
                          Icons.add,
                          color: kBaseColor,
                        ),
                      ),
                    )
                  ],
                ),
                Gap(30),
                controller.isloadingmaincategory
                    ? GridView.builder(
                        itemCount: 6,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 45,
                          crossAxisSpacing: 30,
                        ),
                        itemBuilder: (context, index) => Shimmer.fromColors(
                          baseColor:
                              Color.fromARGB(255, 229, 229, 229).withAlpha(150),
                          highlightColor: kBaseColor.withAlpha(100),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: kBaseColor,
                            ),
                            width: double.infinity,
                            child: Text(''),
                          ),
                        ),
                      )
                    : controller.listcategory.isEmpty
                        ? SizedBox(
                            height: Responsive.getHeight(context),
                            child: Text("لايوجد تصنيفات رئيسية بعد"),
                          )
                        : GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 45,
                              crossAxisSpacing: 30,
                            ),
                            itemCount: controller.listcategory.length,
                            itemBuilder: (context, index) => CardCategory(
                              color: index % 4 == 0
                                  ? kSecendryColor
                                  : (index % 4 == 1 || index % 4 == 2
                                      ? kThirdryColor
                                      : kSecendryColor),
                              category: controller.listcategory[index],
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
