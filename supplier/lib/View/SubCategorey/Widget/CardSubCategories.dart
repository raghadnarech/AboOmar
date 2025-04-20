// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Model/Category.dart';
import 'package:supplier/Model/SubCategory.dart';
import 'package:supplier/Services/Responsive.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/View/Product/Controller/ProductPageController.dart';
import 'package:supplier/View/Product/ProductPage.dart';
import 'package:supplier/View/SubCategorey/Edit/Controller/EditeSubCategoreyController.dart';
import 'package:supplier/View/SubCategorey/Edit/EditeSubCategorey.dart';

class CardSubCategories extends StatelessWidget {
  CardSubCategories({this.text, this.subCategory, this.category});
  String? text;
  SubCategory? subCategory;
  Category? category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomRoute.RouteTo(
          context,
          ChangeNotifierProvider<ProductPageController>(
            create: (context) =>
                ProductPageController()..GetProduct(subCategory!.id!),
            lazy: true,
            builder: (context, child) => ProductPage(
              subCategory: subCategory,
              category: category,
            ),
          ),
        );
      },
      child: Container(
        height: Responsive.getHeight(context) * 0.14,
        width: Responsive.getWidth(context) * 0.29,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
          color: kFourthColor.withAlpha(150),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 0,
                      child: Text("تعديل"),
                      onTap: () => CustomRoute.RouteReplacementTo(
                          context,
                          ChangeNotifierProvider<EditeSubCategoreyController>(
                            create: (context) => EditeSubCategoreyController()
                              ..initstate(subCategory!),
                            builder: (context, child) => EditeSubCategorey(
                              subCategory: subCategory,
                              category: category,
                            ),
                          )),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: Text("حذف"),
                      onTap: () => showDialog(
                        context: context,
                        barrierDismissible: false,
                        barrierLabel: '',
                        barrierColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Dialog(
                              insetPadding: EdgeInsets.all(15),
                              elevation: 10,
                              alignment: Alignment(0, -.4),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: GestureDetector(
                                        onTap: () {
                                          CustomRoute.RoutePop(context);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: kBaseThirdyColor,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "هل انت متأكد من حذف التصنيف الفرعي مع العلم انه سيتم حذف جميع المنتجات الفرعية ؟",
                                            style: TextStyle(
                                                color: kFourthColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Gap(20),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Consumer<
                                                    EditeSubCategoreyController>(
                                                  builder: (context, controller,
                                                      child) {
                                                    return GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .DeleteSubCategory(
                                                            context,
                                                            category!,
                                                            subCategory!.id!,
                                                          );
                                                        },
                                                        child: Text(
                                                          "نعم ",
                                                          style: TextStyle(
                                                              color:
                                                                  kFourthColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ));
                                                  },
                                                ),
                                                Gap(10),
                                                GestureDetector(
                                                    onTap: () {
                                                      CustomRoute.RoutePop(
                                                          context);
                                                    },
                                                    child: Text(
                                                      "لا ",
                                                      style: TextStyle(
                                                          color:
                                                              kBaseThirdyColor,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 27,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(27),
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/splash.png",
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                        image: "${AppApi.IMAGEURL}${subCategory!.image}",
                        imageErrorBuilder: (context, error, stackTrace) =>
                            Image.asset("assets/images/splash.png"),
                      ),
                    ),
                  ),
                ),
                Gap(10),
                Text(
                  text!,
                  style: style12semibold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
