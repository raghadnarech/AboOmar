// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Model/Category.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/View/Drawer/Drawer.dart';
import 'package:supplier/View/Product/Add/AddProduct.dart';
import 'package:supplier/View/Product/Add/Controller/AddProcductController.dart';
import 'package:supplier/View/Product/Widgets/CardProduct.dart';
import 'package:supplier/View/SubCategorey/Add/AddSubCategorey.dart';
import 'package:supplier/View/SubCategorey/Add/Controller/AddSubCategoryController.dart';
import 'package:supplier/View/SubCategorey/Controller/SubCategoreyController.dart';
import 'package:supplier/View/SubCategorey/Widget/CardSubCategories.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class SubCategoreyPage extends StatelessWidget {
  SubCategoreyPage({this.category});
  Category? category;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: CustomDrawer(),
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () => scaffoldKey.currentState?.openEndDrawer(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/svg/menu.svg',
                  width: 30,
                  height: 25,
                ),
              ),
            ),
          ],
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: Text(
            "${category!.name!} - التصنيفات الفرعية",
            style: style15semiboldwhite,
          ),
        ),
        body: Consumer<SubCategoreyController>(
          builder: (context, controller, child) => RefreshIndicator(
            onRefresh: () => controller.GetSubCategory(category!.id!),
            child: ListView(
              children: [
                controller.listproduct.isNotEmpty
                    ? Container()
                    : Padding(
                        padding:
                            const EdgeInsets.only(top: 16, right: 12, left: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "التصنيفات الفرعية",
                              style: style15semibold,
                            ),
                            GestureDetector(
                              onTap: () {
                                CustomRoute.RouteReplacementTo(
                                    context,
                                    ChangeNotifierProvider(
                                        create: (context) =>
                                            AddSubCategoryController(),
                                        builder: (context, child) =>
                                            AddSubCategorey(
                                              category: category!,
                                            )));
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
                      ),
                controller.listsubcategory.isNotEmpty
                    ? Container()
                    : Padding(
                        padding:
                            const EdgeInsets.only(top: 16, right: 12, left: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "المنتجات الفرعية",
                              style: style15semibold,
                            ),
                            GestureDetector(
                              onTap: () {
                                CustomRoute.RouteReplacementTo(
                                    context,
                                    ChangeNotifierProvider(
                                        create: (context) =>
                                            AddProductController(),
                                        builder: (context, child) => AddProduct(
                                              category: category!,
                                              isfromcat: true,
                                            )));
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
                      ),
                controller.isloadinggetsubcaegory
                    ? controller.listsubcategory.isEmpty
                        ? GridView.builder(
                            itemCount: 6,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            padding: EdgeInsets.all(16),
                            itemBuilder: (context, index) => Shimmer.fromColors(
                              baseColor: Color.fromARGB(255, 229, 229, 229)
                                  .withAlpha(150),
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
                        : GridView.builder(
                            itemCount: 6,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                            ),
                            padding: EdgeInsets.all(10),
                            itemBuilder: (context, index) => Shimmer.fromColors(
                              baseColor: Color.fromARGB(255, 229, 229, 229)
                                  .withAlpha(150),
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
                    : (controller.listsubcategory.isEmpty &&
                            controller.listproduct.isEmpty)
                        ? Center(
                            child: Text("لايوجد بيانات  بعد"),
                          )
                        : controller.listproduct.isNotEmpty
                            ? GridView.builder(
                                padding: EdgeInsets.all(16),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        // childAspectRatio: 2,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.listproduct.length,
                                itemBuilder: (context, index) => CardProduct(
                                      category: category,
                                      product: controller.listproduct[index],
                                    ))
                            : GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20),
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.all(10),
                                shrinkWrap: true,
                                itemCount: controller.listsubcategory.length,
                                itemBuilder: (context, index) =>
                                    CardSubCategories(
                                  text: controller.listsubcategory[index].name!,
                                  subCategory:
                                      controller.listsubcategory[index],
                                  category: category,
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
