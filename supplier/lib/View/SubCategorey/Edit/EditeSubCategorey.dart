// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Model/Category.dart';
import 'package:supplier/Model/SubCategory.dart';
import 'package:supplier/Services/Responsive.dart';
import 'package:supplier/View/Drawer/Drawer.dart';
import 'package:supplier/View/Widgets/TextInput/TextInputCustom.dart';
import 'package:supplier/View/SubCategorey/Edit/Controller/EditeSubCategoreyController.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class EditeSubCategorey extends StatelessWidget {
  EditeSubCategorey({this.subCategory, this.category});
  SubCategory? subCategory;
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
            "تعديل التصنيف فرعي",
            style: style15semiboldwhite,
          ),
        ),
        body: Consumer<EditeSubCategoreyController>(
          builder: (context, controller, child) => ListView(
              padding: const EdgeInsets.only(top: 8, right: 16),
              children: [
                Text(
                  "تعديل تصنيف فرعي",
                  style: style15semibold,
                ),
                Gap(20),
                Row(
                  children: [
                    Text(
                      "اسم التصنيف الفرعي",
                      style: style12semibold,
                    ),
                    Gap(5),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 8),
                        child: TextInputCustom(
                          controller: controller.namecontroller,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(40),
                Row(
                  children: [
                    Text(
                      "اضف صورة التصنيف",
                      style: style12semibold,
                    ),
                    Gap(20),
                    GestureDetector(
                      onTap: () {
                        controller.SelectImage(context);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: kSecendryColor,
                        ),
                        child: Icon(
                          Icons.add,
                          color: kBaseColor,
                        ),
                      ),
                    ),
                    Gap(20),
                    controller.imagesubcat == null
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: "assets/images/splash.png",
                                    image:
                                        "${AppApi.IMAGEURL}${subCategory!.image}",
                                    width: 100,
                                    height: 100,
                                    imageErrorBuilder:
                                        (context, error, stackTrace) =>
                                            Text("لم يتم اضافة صورة"),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    controller.imagesubcat!,
                                    fit: BoxFit.fill,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: GestureDetector(
                                    onTap: () => controller.removelogo(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: kSecendryColor,
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(10))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Icon(
                                          Icons.delete,
                                          color: kBaseColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                  ],
                ),
                SizedBox(height: Responsive.getHeight(context) * 0.4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: GestureDetector(
                    onTap: () {
                      controller.EditSubCategory(context, category);
                    },
                    child: Container(
                      height: Responsive.getHeight(context) * 0.055,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            kPrimaryColor,
                            kBaseThirdyColor,
                          ],
                          begin: Alignment.bottomRight,
                          end: Alignment.bottomLeft,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Text(
                        " تعديل",
                        style: style15semiboldwhite,
                      )),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
