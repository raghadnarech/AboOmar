// ignore_for_file: library_private_types_in_public_api, must_be_immutable, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Model/Category.dart';
import 'package:supplier/Model/SubCategory.dart';
import 'package:supplier/Services/Responsive.dart';
import 'package:supplier/View/Drawer/Drawer.dart';
import 'package:supplier/View/Product/Add/Controller/AddProcductController.dart';
import 'package:supplier/View/Widgets/CheckBox/CheckBoxCustom.dart';
import 'package:supplier/View/Widgets/TextInput/TextInputCustom.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class AddProduct extends StatelessWidget {
  AddProduct({this.subCategory, this.category, this.isfromcat = false});
  Category? category;
  SubCategory? subCategory;
  bool isfromcat;
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
            "إضافة منتج",
            style: style15semiboldwhite,
          ),
        ),
        body: Consumer<AddProductController>(
          builder: (context, controller, child) => ListView(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            children: [
              Text(
                "إضافة منتج",
                style: style15semibold,
              ),
              Gap(10),
              Row(
                children: [
                  CheckBoxCustom(
                    check: controller.normalpro,
                    onChanged: (value) => controller.chanetypenormalpro(),
                    color: kPrimaryColor,
                  ),
                  Gap(10),
                  Text(
                    'منتج عادي',
                    style: style12semibold,
                  ),
                  Gap(130),
                  CheckBoxCustom(
                    check: controller.offerpro,
                    onChanged: (value) => controller.chanetypeofferpro(),
                    color: kPrimaryColor,
                  ),
                  Gap(10),
                  Text(
                    'منتج عرض',
                    style: style12semibold,
                  ),
                ],
              ),
              Gap(10),
              Row(
                children: [
                  Text(
                    "اسم المنتج",
                    style: style12semibold,
                  ),
                  Gap(40),
                  Expanded(
                    child: TextInputCustom(
                      controller: controller.namecontroller,
                    ),
                  ),
                ],
              ),
              Gap(10),
              Row(
                children: [
                  Text(
                    "سعر المنتج",
                    style: style12semibold,
                  ),
                  Gap(40),
                  Expanded(
                    child: TextInputCustom(
                      controller: controller.pricecontroller,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: controller.offerpro,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10),
                    Row(
                      children: [
                        Text(
                          "نص العرض",
                          style: style12semibold,
                        ),
                        Gap(40),
                        Expanded(
                          child: TextInputCustom(
                            controller: controller.offertextcontroller,
                          ),
                        ),
                      ],
                    ),
                    Gap(30),
                    Wrap(
                      runAlignment: WrapAlignment.spaceBetween,
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 5,
                      children: [
                        AutoSizeText(
                          maxLines: 1,
                          minFontSize: 10,
                          " قيمة العرض",
                          style: style12semibold,
                        ),
                        Gap(30),
                        CheckBoxCustom(
                          check: controller.lumpsum,
                          onChanged: (value) =>
                              controller.chanetypeofferlumpsum(),
                          color: kPrimaryColor,
                        ),
                        Gap(8),
                        AutoSizeText(
                          maxLines: 1,
                          minFontSize: 8,
                          "مبلغ مقطوع",
                          style: style12semibold,
                        ),
                        Gap(60),
                        CheckBoxCustom(
                          check: controller.percent,
                          onChanged: (value) =>
                              controller.chanetypeofferpercent(),
                          color: kPrimaryColor,
                        ),
                        Gap(8),
                        AutoSizeText(
                          maxLines: 1,
                          minFontSize: 8,
                          "نسبة مئوية ",
                          style: style12semibold,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "قيمة العرض",
                          style: style12semibold,
                        ),
                        Gap(40),
                        Expanded(
                          child: TextInputCustom(
                            controller: controller.offercostcontroller,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(10),
              Row(
                children: [
                  Text(
                    "الرمز الترويجي",
                    style: style12semibold,
                  ),
                  Gap(40),
                  Expanded(
                    child: TextInputCustom(
                      controller: controller.discountcodecontroller,
                    ),
                  ),
                ],
              ),
              Gap(10),
              Row(
                children: [
                  Text(
                    "قيمة الرمز الترويجي",
                    style: style12semibold,
                  ),
                  Gap(40),
                  Expanded(
                    child: TextInputCustom(
                      controller: controller.discountcodevaluecontroller,
                    ),
                  ),
                ],
              ),
              Gap(10),
              Text(
                " مدة التفعيل ",
                style: style12semibold,
              ),
              Gap(10),
              Row(
                children: [
                  Text(
                    "من",
                    style: style12semibold,
                  ),
                  Gap(15),
                  Expanded(
                    child: TextInputCustom(
                      controller: controller.time_fromcontroller,
                      icon: GestureDetector(
                          onTap: () => controller.showDialogTimeFrom(context),
                          child: Icon(Icons.av_timer_outlined)),
                    ),
                  ),
                ],
              ),
              Gap(10),
              Row(
                children: [
                  Text(
                    "إلى",
                    style: style12semibold,
                  ),
                  Gap(15),
                  Expanded(
                    child: TextInputCustom(
                      controller: controller.time_tocontroller,
                      icon: GestureDetector(
                          onTap: () => controller.showDialogTimeTo(context),
                          child: Icon(Icons.av_timer_outlined)),
                    ),
                  ),
                ],
              ),
              Gap(20),
              Row(
                children: [
                  Text(
                    "اضف صورة المنتج",
                    style: style12semibold,
                  ),
                  Gap(25),
                  GestureDetector(
                    onTap: () async {
                      controller.SelectImage(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: kSecendryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(
                        Icons.add,
                        color: kBaseColor,
                      ),
                    ),
                  ),
                  Gap(20),
                  controller.logoproduct == null
                      ? Container()
                      : Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  controller.logoproduct!,
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
                                            bottomRight: Radius.circular(10))),
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
              Gap(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: GestureDetector(
                  onTap: () async {
                    EasyLoading.show();
                    // try {
                    var result;
                    if (isfromcat) {
                      result = await controller.AddProductFromMainCat(
                        context,
                        category,
                      );
                    } else {
                      result = await controller.AddProduct(
                          context, subCategory!.id, category, subCategory);
                    }

                    result.fold(
                      (l) {
                        EasyLoading.showError(l.message);
                        EasyLoading.dismiss();
                      },
                      (r) {
                        EasyLoading.dismiss();
                      },
                    );
                    // } catch (e) {
                    //   print(e);
                    //   EasyLoading.dismiss();
                    // }
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
                      " إضافة  ",
                      style: style15semiboldwhite,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
