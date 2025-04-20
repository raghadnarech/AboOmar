// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Model/Category.dart';
import 'package:supplier/Model/Product.dart';
import 'package:supplier/Model/SubCategory.dart';

import 'package:supplier/Services/Routes.dart';
import 'package:supplier/View/Product/Edit/Controller/EditProductController.dart';
import 'package:supplier/View/Product/Edit/EditProduct.dart';
import 'package:supplier/View/Product/ProductDetails.dart';

class CardProduct extends StatelessWidget {
  CardProduct({super.key, this.category, this.subCategory, this.product});
  Product? product;
  Category? category;
  SubCategory? subCategory;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomRoute.RouteTo(
          context,
          ChangeNotifierProvider<EditProductController>(
            create: (context) => EditProductController()..initstate(product!),
            child: ProductDetails(
              category,
              subCategory,
              product: product,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
          color: kThirdryColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(10),
            ClipRRect(
              borderRadius: BorderRadius.circular(27),
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/splash.png",
                fit: BoxFit.cover,
                width: 100,
                height: 100,
                image: "${AppApi.IMAGEURL}${product!.image}",
                imageErrorBuilder: (context, error, stackTrace) =>
                    Image.asset("assets/images/splash.png"),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8, right: 5),
                            child: Container(
                              height: 9,
                              width: 9,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    35,
                                  ),
                                  color: Colors.red),
                            ),
                          ),
                          Gap(6),
                          Text(
                            product!.name!,
                            style: style12semibold,
                          ),
                        ],
                      ),
                      // Gap(8),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, right: 5),
                        child: Row(
                          children: [
                            Text(
                              "ريال ${product!.price}",
                              style: style12semibold,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 4, top: 4),
                              child: Icon(
                                Icons.add,
                                size: 15,
                              ),
                            ),
                            // Gap(25),
                            Text(
                              "الرسوم",
                              style: style12semibold,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 0,
                          child: Text("تعديل"),
                          onTap: () {
                            CustomRoute.RouteReplacementTo(
                                context,
                                ChangeNotifierProvider<EditProductController>(
                                  create: (context) => EditProductController()
                                    ..initstate(product!),
                                  builder: (context, child) => EditProduct(
                                    category: category,
                                    subCategory: subCategory,
                                  ),
                                ));
                          },
                        ),
                        PopupMenuItem(
                          value: 1,
                          child: Text("حذف"),
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              barrierLabel: '',
                              barrierColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "هل انت متأكد من حذف المنتج ؟",
                                                  style: TextStyle(
                                                      color: kFourthColor,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Gap(20),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Consumer<
                                                          EditProductController>(
                                                        builder: (context,
                                                            controller, child) {
                                                          return GestureDetector(
                                                              onTap: () {
                                                                controller
                                                                    .DeleteProduct(
                                                                  context,
                                                                  category!,
                                                                  product!.id!,
                                                                );
                                                              },
                                                              child: Text(
                                                                "نعم ",
                                                                style: TextStyle(
                                                                    color:
                                                                        kFourthColor,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ));
                                                        },
                                                      ),
                                                      Gap(10),
                                                      GestureDetector(
                                                          onTap: () {
                                                            CustomRoute
                                                                .RoutePop(
                                                                    context);
                                                          },
                                                          child: Text(
                                                            "لا ",
                                                            style: TextStyle(
                                                                color:
                                                                    kBaseThirdyColor,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
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
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
