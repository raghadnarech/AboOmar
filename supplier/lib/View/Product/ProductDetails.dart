// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Model/Category.dart';
import 'package:supplier/Model/Product.dart';
import 'package:supplier/Model/SubCategory.dart';
import 'package:supplier/View/Drawer/Drawer.dart';
import 'package:supplier/View/Product/Edit/Controller/EditProductController.dart';
import 'package:supplier/View/Product/Widgets/SectionDetail.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class ProductDetails extends StatelessWidget {
  ProductDetails(this.category, this.subCategory, {this.product});
  Product? product;
  Category? category;
  SubCategory? subCategory;

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
            product!.name!,
            style: style15semiboldwhite,
          ),
        ),
        body: Consumer<EditProductController>(
          builder: (context, controller, child) =>
              ListView(padding: EdgeInsets.all(20), children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "تفاصيل المنتج",
                  style: style15semibold,
                ),
                Row(
                  children: [
                    GestureDetector(
                      // onTap:,
                      child: Transform.scale(
                        scaleX: 0.9,
                        scaleY: 0.8,
                        child: CupertinoSwitch(
                            activeColor: kFourthColor,
                            trackColor: kSecendryColor,
                            value: product!.isActive == 1,
                            onChanged: (bool value) {
                              controller.ToggleActiveProduct(
                                  context, category, value);
                              // setState(() {
                              //   isActive = value;
                              // });
                            }),
                      ),
                    ),
                    Text(product!.isActive == 1 ? "متوفر" : "غير متوفر",
                        style: style15semibold),
                  ],
                )
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: [
                SectionDetail(
                  title: "اسم المنتج",
                  detail: product!.name!,
                ),
                SectionDetail(
                  title: "سعر المنتج",
                  detail: "${product!.price!.toString()} ريال",
                ),
                Row(
                  children: [
                    SectionDetail(
                      title: "الرمز الترويجي",
                      detail: product!.discountCode,
                    ),
                    Gap(10),
                    TextButton(
                        onPressed: () {
                          product!.isDiscount == 0
                              ? controller.ChangeDiscountStatus(
                                  context, product!.id!, 1)
                              : controller.ChangeDiscountStatus(
                                  context, product!.id!, 0);
                        },
                        child: Text(
                          product!.isDiscount == 1 ? "إلغاء التفعيل" : "تفعيل",
                          style: style15semibold,
                        ))
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
