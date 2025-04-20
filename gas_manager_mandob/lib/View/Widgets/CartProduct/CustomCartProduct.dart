// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Constant/styles.dart';
import 'package:gas_manager_mandob/Controller/CartController.dart';
import 'package:gas_manager_mandob/Model/Product.dart';
import 'package:gas_manager_mandob/Services/Routes.dart';
import 'package:gas_manager_mandob/View/Widgets/CheckBox/CheckBoxCustom.dart';
import 'package:provider/provider.dart';

class CustomCartProduct extends StatefulWidget {
  CustomCartProduct({this.desc, this.title});
  String? title;
  String? desc;

  @override
  State<CustomCartProduct> createState() => _CustomCartProductState();
}

class _CustomCartProductState extends State<CustomCartProduct> {
  int quan = 0;
  bool cash = false;
  bool credit = false;
  bool e_wallet = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartController>(
      create: (context) => CartController(),
      child: Container(
        decoration: BoxDecoration(
          color: kThirdryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.circle,
                              color: kFourthColor,
                              size: 10,
                            ),
                            Gap(5),
                            AutoSizeText(
                              widget.title!,
                              maxLines: 1,
                              style: style15semibold,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText(
                          widget.desc!,
                          maxLines: 1,
                          style: style15semibold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 35,
                decoration: BoxDecoration(
                  color: kSecendryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Consumer<CartController>(
                          builder: (context, provider, child) =>
                              GestureDetector(
                            onTap: () async {
                              if (quan != 0) {
                                showDialog(
                                  barrierDismissible: false,
                                  barrierLabel: '',
                                  context: context,
                                  barrierColor: Colors.transparent,
                                  builder: (context) => StatefulBuilder(
                                    builder: (context, setState) =>
                                        BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 10, sigmaY: 10),
                                      child: Dialog(
                                        insetPadding: EdgeInsets.all(15),
                                        elevation: 10,
                                        alignment: Alignment(0, -.4),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 0,
                                                left: 0,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    CustomRoute.RoutePop(
                                                        context);
                                                    cash = false;
                                                    credit = false;
                                                    e_wallet = false;
                                                  },
                                                  child: Icon(
                                                    Icons.close,
                                                    color: kBaseThirdyColor,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "تم إضافة توريد غاز العدد $quan إلى السلة",
                                                      style: style15semibold,
                                                    ),
                                                    Gap(15),
                                                    Text(
                                                      "* اختر نوع عملية الدفع",
                                                      style: style15semibold,
                                                    ),
                                                    Gap(15),
                                                    Row(
                                                      children: [
                                                        CheckBoxCustom(
                                                          check: cash,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              cash = value!;
                                                              credit = false;
                                                              e_wallet = false;
                                                            });
                                                          },
                                                        ),
                                                        Gap(15),
                                                        Text("كاش عند التسليم"),
                                                      ],
                                                    ),
                                                    Gap(8),
                                                    Row(
                                                      children: [
                                                        CheckBoxCustom(
                                                          check: credit,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              credit = value!;
                                                              cash = false;
                                                              e_wallet = false;
                                                            });
                                                          },
                                                        ),
                                                        Gap(15),
                                                        Text(
                                                            "بطاقة عند التسليم"),
                                                      ],
                                                    ),
                                                    Gap(8),
                                                    Row(
                                                      children: [
                                                        CheckBoxCustom(
                                                          check: e_wallet,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              e_wallet = value!;
                                                              credit = false;
                                                              cash = false;
                                                            });
                                                          },
                                                        ),
                                                        Gap(15),
                                                        Text("محفظة الكترونية"),
                                                      ],
                                                    ),
                                                    Gap(35),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 15),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    kFourthColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        4.0),
                                                                child: Center(
                                                                  child: Text(
                                                                    "إضافة",
                                                                    style: TextStyle(
                                                                        color:
                                                                            kBaseColor,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Gap(60),
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color:
                                                                    kThirdryColor,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        4.0),
                                                                child: Center(
                                                                  child: Text(
                                                                    "إلغاء",
                                                                    style: TextStyle(
                                                                        color:
                                                                            kBaseThirdyColor,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Gap(20),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                            child: AutoSizeText(
                              "اضف للسلة",
                              maxLines: 1,
                              minFontSize: 7,
                              style: TextStyle(
                                  // fontSize: 15,
                                  color: kBaseColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Gap(5),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quan++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: kBaseThirdyColor,
                                  size: 18,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: AutoSizeText(
                                  "$quan",
                                  minFontSize: 7,
                                  style: TextStyle(
                                      // fontSize: 15,
                                      color: kBaseColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (quan != 0) {
                                      quan--;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: kBaseThirdyColor,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
