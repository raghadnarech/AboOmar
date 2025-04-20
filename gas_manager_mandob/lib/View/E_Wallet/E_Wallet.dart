import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Constant/styles.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';
import 'package:gas_manager_mandob/Services/Routes.dart';
import 'package:gas_manager_mandob/View/Widgets/CheckBox/CheckBoxCustom.dart';
import 'package:gas_manager_mandob/View/Widgets/TextInput/TextInputCustom.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class E_Wallet extends StatefulWidget {
  E_Wallet({super.key});

  @override
  State<E_Wallet> createState() => _E_WalletState();
}

class _E_WalletState extends State<E_Wallet> {
  bool mybank = false;

  bool anotherbank = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(),
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
        backgroundColor: Color(0xff445461),
        centerTitle: true,
        title: Text("المحفظة الالكترونية"),
      ),
      body: Center(
        child: SizedBox(
          width: Responsive.getWidth(context) * .9,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Gap(20),
              Text(
                "المحفظة الخاصة بك",
                style: TextStyle(
                    color: kFourthColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              Gap(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "الرصيد المتوافر",
                    style: style15semibold,
                  ),
                  Gap(20),
                  Text(
                    "500 ريال",
                    style: style15semibold,
                  ),
                ],
              ),
              Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topRight,
                          colors: [
                            Color(0xff1B2A36),
                            Color(0xff35536B),
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Center(
                        child: Text(
                      "طلب تحويل مبلغ لمندوب",
                      style: TextStyle(
                          color: kBaseColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
              ),
              Gap(20),
              Text(
                "عمليات الإيداع على المحفظة",
                style: TextStyle(
                    color: kFourthColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              Gap(10),
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: kBaseThirdyColor.withAlpha(50),
                              offset: Offset(0, 0),
                              blurRadius: 10,
                            )
                          ],
                          color: kThirdryColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: kPrimaryColor,
                          )),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "رقم الطلب",
                                        style: style15semibold,
                                      ),
                                      Gap(5),
                                      Text(
                                        "741582",
                                        style: style15semibold,
                                      ),
                                    ],
                                  ),
                                  Text("10/12/2024"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "المبلغ",
                                        style: style15semibold,
                                      ),
                                      Gap(15),
                                      Text(
                                        "200 ريال",
                                        style: style15semibold,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "رقم الحساب",
                                        style: style15semibold,
                                      ),
                                      Gap(10),
                                      Text(
                                        "47158269",
                                        style: style15semibold,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: kBaseThirdyColor.withAlpha(50),
                              offset: Offset(0, 0),
                              blurRadius: 10,
                            )
                          ],
                          color: kThirdryColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: kPrimaryColor,
                          )),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "رقم الطلب",
                                        style: style15semibold,
                                      ),
                                      Gap(5),
                                      Text(
                                        "741582",
                                        style: style15semibold,
                                      ),
                                    ],
                                  ),
                                  Text("10/12/2024"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "المبلغ",
                                        style: style15semibold,
                                      ),
                                      Gap(15),
                                      Text(
                                        "200 ريال",
                                        style: style15semibold,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "رقم الحساب",
                                        style: style15semibold,
                                      ),
                                      Gap(10),
                                      Text(
                                        "47158269",
                                        style: style15semibold,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                  Gap(20),
                  Text(
                    "عمليات السحب الخاصة بك",
                    style: TextStyle(
                        color: kFourthColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  Gap(10),
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: kBaseThirdyColor.withAlpha(50),
                                  offset: Offset(0, 0),
                                  blurRadius: 10,
                                )
                              ],
                              color: kThirdryColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: kPrimaryColor,
                              )),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "رقم الطلب",
                                            style: style15semibold,
                                          ),
                                          Gap(5),
                                          Text(
                                            "741582",
                                            style: style15semibold,
                                          ),
                                        ],
                                      ),
                                      Text("10/12/2024"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "المبلغ",
                                            style: style15semibold,
                                          ),
                                          Gap(15),
                                          Text(
                                            "200 ريال",
                                            style: style15semibold,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "رقم الحساب",
                                            style: style15semibold,
                                          ),
                                          Gap(10),
                                          Text(
                                            "47158269",
                                            style: style15semibold,
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: kBaseThirdyColor.withAlpha(50),
                                  offset: Offset(0, 0),
                                  blurRadius: 10,
                                )
                              ],
                              color: kThirdryColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: kPrimaryColor,
                              )),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "رقم الطلب",
                                            style: style15semibold,
                                          ),
                                          Gap(5),
                                          Text(
                                            "741582",
                                            style: style15semibold,
                                          ),
                                        ],
                                      ),
                                      Text("10/12/2024"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "المبلغ",
                                            style: style15semibold,
                                          ),
                                          Gap(15),
                                          Text(
                                            "200 ريال",
                                            style: style15semibold,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "رقم الحساب",
                                            style: style15semibold,
                                          ),
                                          Gap(10),
                                          Text(
                                            "47158269",
                                            style: style15semibold,
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ),
                      ),
                      Gap(50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topRight,
                                  colors: [
                                    Color(0xff1B2A36),
                                    Color(0xff35536B),
                                  ])),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Center(
                                child: Text(
                              "طلب إيداع رصيد",
                              style: TextStyle(
                                  color: kBaseColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                      ),
                      Gap(10),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                            barrierLabel: '',
                            context: context,
                            barrierColor: Colors.transparent,
                            builder: (context) => StatefulBuilder(
                              builder: (context, setState) => BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
                                              CustomRoute.RoutePop(context);
                                              anotherbank = false;
                                              mybank = false;
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: kBaseThirdyColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "طلب سحب رصيد",
                                                style: TextStyle(
                                                    color: kFourthColor,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Gap(20),
                                              Row(
                                                children: [
                                                  Text(
                                                    "الرصيد المتاح",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Gap(10),
                                                  Text(
                                                    "200 ريال",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                              Gap(10),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    "الرصيد المراد سحبه",
                                                    style: style12semibold,
                                                  ),
                                                  Gap(20),
                                                  Expanded(
                                                      child: TextInputCustom(
                                                    hint: '',
                                                    ispassword: false,
                                                  ))
                                                ],
                                              ),
                                              Gap(20),
                                              Row(
                                                children: [
                                                  CheckBoxCustom(
                                                    color: kFourthColor,
                                                    check: mybank,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          mybank = value!;
                                                          anotherbank = false;
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  Gap(15),
                                                  Text(
                                                    "الحساب البنكي الخاصي بي",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                              Gap(10),
                                              Row(
                                                children: [
                                                  CheckBoxCustom(
                                                    color: kFourthColor,
                                                    check: anotherbank,
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          anotherbank = value!;
                                                          mybank = false;
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  Gap(15),
                                                  Text(
                                                    "حساب بنكي اخر",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                              Gap(10),
                                              Visibility(
                                                visible: anotherbank,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "رقم الحساب البنكي",
                                                      style: style12semibold,
                                                    ),
                                                    Gap(20),
                                                    Expanded(
                                                        child: TextInputCustom(
                                                      hint: '',
                                                      ispassword: false,
                                                    ))
                                                  ],
                                                ),
                                              ),
                                              Gap(35),
                                              GestureDetector(
                                                onTap: () {
                                                  CustomRoute.RoutePop(context);
                                                  showDialog(
                                                    barrierDismissible: false,
                                                    barrierLabel: '',
                                                    context: context,
                                                    barrierColor:
                                                        Colors.transparent,
                                                    builder: (context) =>
                                                        StatefulBuilder(
                                                      builder:
                                                          (context, setState) =>
                                                              BackdropFilter(
                                                        filter:
                                                            ImageFilter.blur(
                                                                sigmaX: 10,
                                                                sigmaY: 10),
                                                        child: Dialog(
                                                          insetPadding:
                                                              EdgeInsets.all(
                                                                  15),
                                                          elevation: 10,
                                                          alignment:
                                                              Alignment(0, -.4),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                Positioned(
                                                                  top: 0,
                                                                  left: 0,
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      CustomRoute
                                                                          .RoutePop(
                                                                              context);
                                                                      anotherbank =
                                                                          false;
                                                                      mybank =
                                                                          false;
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .close,
                                                                      color:
                                                                          kBaseThirdyColor,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              10),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "طلب سحب رصيد",
                                                                        style: TextStyle(
                                                                            color:
                                                                                kFourthColor,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      ),
                                                                      Gap(10),
                                                                      Text(
                                                                        "تمت عملية سحب الرصيد بنجاح",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      ),
                                                                      Gap(20),
                                                                      Center(
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/svg/ok.svg',
                                                                          width:
                                                                              Responsive.getWidth(context) * .7,
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
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 20),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .bottomCenter,
                                                            end: Alignment
                                                                .topRight,
                                                            colors: [
                                                              Color(0xff722B23),
                                                              Color(0xffE45545),
                                                            ])),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 5),
                                                      child: Center(
                                                          child: Text(
                                                        "متابعة",
                                                        style: TextStyle(
                                                            color: kBaseColor,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      )),
                                                    ),
                                                  ),
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
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topRight,
                                    colors: [
                                      Color(0xff722B23),
                                      Color(0xffE45545),
                                    ])),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Center(
                                  child: Text(
                                "طلب سحب رصيد",
                                style: TextStyle(
                                    color: kBaseColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )),
                            ),
                          ),
                        ),
                      ),
                      Gap(30),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
