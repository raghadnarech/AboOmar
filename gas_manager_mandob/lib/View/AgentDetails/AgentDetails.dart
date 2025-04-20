import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Constant/styles.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';
import 'package:gas_manager_mandob/Services/Routes.dart';
import 'package:gas_manager_mandob/View/DailyReport/DailyReport.dart';
import 'package:gas_manager_mandob/View/Widgets/TextInput/TextInputCustom.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class AgentDetails extends StatelessWidget {
  const AgentDetails({super.key});

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
        title: Text("تفاصيل مندوب"),
      ),
      body: Center(
          child: SizedBox(
        width: Responsive.getWidth(context) * .9,
        child: ListView(
          children: [
            Gap(30),
            Stack(
              children: [
                Positioned(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Text(
                          "الحالة الحالية",
                          style: style15semibold,
                        ),
                        Text(
                          "متوفر الان",
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor, width: 2),
                            borderRadius: BorderRadius.circular(50)),
                        child: CircleAvatar(
                          backgroundColor: kBaseColor,
                          foregroundColor: kBaseColor,
                          radius: 50,
                        ),
                      ),
                      Gap(10),
                      Text("اسم المندوب"),
                      Text("0963582741582582"),
                      Text("user @gmail.com"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on),
                          Text("السعودية , المدينة المنورة , حي القبلاء"),
                        ],
                      ),
                      Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("الحساب البنكي"),
                          Gap(30),
                          Text("741852852"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("رقم السيارة"),
                          Gap(30),
                          Text("741852852"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("أوقات الدوام"),
                          Gap(30),
                          Text("10 -2"),
                        ],
                      ),
                      Gap(30),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor)),
                      ),
                      Gap(30),
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
                                                "تواصل مع المندوب عن طريق",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Gap(50),
                                              Center(
                                                child: Wrap(
                                                  alignment:
                                                      WrapAlignment.center,
                                                  spacing: 30,
                                                  runAlignment:
                                                      WrapAlignment.center,
                                                  direction: Axis.horizontal,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            CustomRoute
                                                                .RoutePop(
                                                                    context);
                                                            showDialog(
                                                              barrierDismissible:
                                                                  false,
                                                              barrierLabel: '',
                                                              context: context,
                                                              barrierColor: Colors
                                                                  .transparent,
                                                              builder: (context) =>
                                                                  StatefulBuilder(
                                                                builder: (context,
                                                                        setState) =>
                                                                    BackdropFilter(
                                                                  filter: ImageFilter
                                                                      .blur(
                                                                          sigmaX:
                                                                              10,
                                                                          sigmaY:
                                                                              10),
                                                                  child: Dialog(
                                                                    insetPadding:
                                                                        EdgeInsets.all(
                                                                            15),
                                                                    elevation:
                                                                        10,
                                                                    alignment:
                                                                        Alignment(
                                                                            0,
                                                                            -.4),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          10),
                                                                      child:
                                                                          Stack(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        children: [
                                                                          Positioned(
                                                                            top:
                                                                                0,
                                                                            left:
                                                                                0,
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                CustomRoute.RoutePop(context);
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
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  "تواصل مع المندوب بإشعار داخلي",
                                                                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                                                                ),
                                                                                Gap(20),
                                                                                Text(
                                                                                  "نص الإشعار",
                                                                                  style: style15semibold,
                                                                                ),
                                                                                Gap(10),
                                                                                TextInputCustom(
                                                                                  ispassword: false,
                                                                                  minline: 3,
                                                                                ),
                                                                                Gap(50),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.symmetric(horizontal: 35),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(20),
                                                                                        gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topRight, colors: [
                                                                                          Color(0xff1B2A36),
                                                                                          Color(0xff35536B),
                                                                                        ])),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                                                                      child: Center(
                                                                                          child: Text(
                                                                                        "إرسال",
                                                                                        style: TextStyle(color: kBaseColor, fontSize: 15, fontWeight: FontWeight.w600),
                                                                                      )),
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
                                                          child: Container(
                                                            width: 80,
                                                            height: 80,
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    kBaseColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              0),
                                                                      color: kBaseThirdyColor
                                                                          .withAlpha(
                                                                              150),
                                                                      blurRadius:
                                                                          10)
                                                                ]),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Center(
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/svg/noti.svg',
                                                                  width: 40,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Gap(10),
                                                        Text("اشعار داخلي")
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Container(
                                                          width: 80,
                                                          height: 80,
                                                          decoration: BoxDecoration(
                                                              color: kBaseColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            0),
                                                                    color: kBaseThirdyColor
                                                                        .withAlpha(
                                                                            150),
                                                                    blurRadius:
                                                                        10)
                                                              ]),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Center(
                                                              child: Icon(
                                                                  CupertinoIcons
                                                                      .phone_fill),
                                                            ),
                                                          ),
                                                        ),
                                                        Gap(10),
                                                        Text("اتصال")
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Container(
                                                          width: 80,
                                                          height: 80,
                                                          decoration: BoxDecoration(
                                                              color: kBaseColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            0),
                                                                    color: kBaseThirdyColor
                                                                        .withAlpha(
                                                                            150),
                                                                    blurRadius:
                                                                        10)
                                                              ]),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Center(
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/svg/whatsapp.svg',
                                                                width: 40,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Gap(10),
                                                        Text("واتساب")
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Gap(50),
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
                                      Color(0xff1B2A36),
                                      Color(0xff35536B),
                                    ])),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Center(
                                  child: Text(
                                "تواصل مع المندوب",
                                style: TextStyle(
                                    color: kBaseColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )),
                            ),
                          ),
                        ),
                      ),
                      Gap(20),
                      GestureDetector(
                        onTap: () =>
                            CustomRoute.RouteTo(context, DailyReport()),
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
                                "تقارير المندوب",
                                style: TextStyle(
                                    color: kBaseColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )),
                            ),
                          ),
                        ),
                      ),
                      Gap(40)
                    ],
                  ),
                ))
              ],
            )
          ],
        ),
      )),
    ));
  }
}
