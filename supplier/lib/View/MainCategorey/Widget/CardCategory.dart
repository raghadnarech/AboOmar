// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Model/Category.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/View/MainCategorey/Edit/Controller/EditMainCategoryController.dart';
import 'package:supplier/View/MainCategorey/Edit/EditeMainCategorey.dart';
import 'package:supplier/View/SubCategorey/Controller/SubCategoreyController.dart';
import 'package:supplier/View/SubCategorey/SubCategoreyPage.dart';

class CardCategory extends StatelessWidget {
  CardCategory({this.color, required this.category});
  Color? color;
  Category? category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomRoute.RouteTo(
            context,
            ChangeNotifierProvider<SubCategoreyController>(
              create: (context) =>
                  SubCategoreyController()..GetSubCategory(category!.id!),
              lazy: true,
              builder: (context, child) => SubCategoreyPage(
                category: category,
              ),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
          color: color,
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
                          ChangeNotifierProvider<EditMainCategoryController>(
                            create: (context) => EditMainCategoryController()
                              ..initstate(category!),
                            builder: (context, child) => EditeMainCategorey(
                              category: category,
                            ),
                          )),
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
                                              "هل انت متأكد من حذف التصنيف الرئيسي مع العلم انه سيتم حذف جميع التصنيفات الفرعية ؟",
                                              style: TextStyle(
                                                  color: kFourthColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Gap(20),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Consumer<
                                                      EditMainCategoryController>(
                                                    builder: (context,
                                                        controller, child) {
                                                      return GestureDetector(
                                                          onTap: () {
                                                            controller
                                                                .DeleteMainCategory(
                                                                    context,
                                                                    category!
                                                                        .id!);
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
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/splash.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        image: '${AppApi.IMAGEURL}${category!.image}'),
                  ),
                ),
                Gap(10),
                Text(
                  category!.name!,
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
