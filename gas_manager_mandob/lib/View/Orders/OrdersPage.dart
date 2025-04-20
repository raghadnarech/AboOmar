import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Constant/styles.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("الطلبات"),
      ),
      body: Center(
          child: SizedBox(
              child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Gap(10),
          Container(
            width: Responsive.getWidth(context),
            height: 100,
            color: kBaseSecandryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                direction: Axis.horizontal,
                verticalDirection: VerticalDirection.down,
                runAlignment: WrapAlignment.start,
                spacing: 20,
                children: [
                  Wrap(
                    spacing: 10,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        color: kSecendryColor,
                        width: 10,
                        height: 10,
                      ),
                      Text(
                        "تم ارسال الطلب",
                        style: TextStyle(
                            color: kSecendryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 10,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        color: kPrimaryColor,
                        width: 10,
                        height: 10,
                      ),
                      Text(
                        "تم قبول الطلب من المورد",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 10,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        color: kFourthColor,
                        width: 10,
                        height: 10,
                      ),
                      Text(
                        "يتم تجهيز الطلب",
                        style: TextStyle(
                            color: kFourthColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 10,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        color: Colors.green,
                        width: 10,
                        height: 10,
                      ),
                      Text(
                        "تم الانتهاء من التجهيز",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 10,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        color: kBaseThirdyColor,
                        width: 10,
                        height: 10,
                      ),
                      Text(
                        "استلام المندوب للطلب",
                        style: TextStyle(
                            color: kBaseThirdyColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: kPrimaryColor,
                ),
                color: kThirdryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "اسم المورد",
                              style: style15semibold,
                            ),
                            Gap(10),
                            Text(
                              "ابو احمد",
                              style: style15semibold,
                            ),
                          ],
                        ),
                        Gap(5),
                        Row(
                          children: [
                            Text(
                              "حالة الطلب",
                              style: style15semibold,
                            ),
                            Gap(10),
                            Text(
                              "تم التسليم",
                              style: style15semibold,
                            ),
                          ],
                        ),
                        Gap(5),
                        Text("10/12/2024")
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "رفع اعتراض",
                              style: TextStyle(
                                  color: kFourthColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            Gap(5),
                            Text(
                              "13:00",
                              style: TextStyle(
                                  color: kBaseThirdyColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Gap(5),
                        Text(
                          "تقييم الطلب",
                          style: TextStyle(
                              color: kFourthColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        Gap(5),
                        Container(
                          decoration: BoxDecoration(
                              color: kFourthColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Text(
                              "التفاصيل",
                              style: TextStyle(
                                  color: kBaseColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: kPrimaryColor,
                ),
                color: kThirdryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "اسم المورد",
                              style: style15semibold,
                            ),
                            Gap(10),
                            Text(
                              "ابو احمد",
                              style: style15semibold,
                            ),
                          ],
                        ),
                        Gap(5),
                        Row(
                          children: [
                            Text(
                              "حالة الطلب",
                              style: style15semibold,
                            ),
                            Gap(10),
                            Text(
                              "تم التسليم",
                              style: style15semibold,
                            ),
                          ],
                        ),
                        Gap(5),
                        Text("10/12/2024")
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "رفع اعتراض",
                              style: TextStyle(
                                  color: kFourthColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            Gap(5),
                            Text(
                              "13:00",
                              style: TextStyle(
                                  color: kBaseThirdyColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Gap(5),
                        Text(
                          "تقييم الطلب",
                          style: TextStyle(
                              color: kFourthColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        Gap(5),
                        Container(
                          decoration: BoxDecoration(
                              color: kFourthColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Text(
                              "التفاصيل",
                              style: TextStyle(
                                  color: kBaseColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: kPrimaryColor,
                ),
                color: kThirdryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "اسم المورد",
                              style: style15semibold,
                            ),
                            Gap(10),
                            Text(
                              "ابو احمد",
                              style: style15semibold,
                            ),
                          ],
                        ),
                        Gap(5),
                        Row(
                          children: [
                            Text(
                              "حالة الطلب",
                              style: style15semibold,
                            ),
                            Gap(10),
                            Text(
                              "تم التسليم",
                              style: style15semibold,
                            ),
                          ],
                        ),
                        Gap(5),
                        Text("10/12/2024")
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "رفع اعتراض",
                              style: TextStyle(
                                  color: kFourthColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            Gap(5),
                            Text(
                              "13:00",
                              style: TextStyle(
                                  color: kBaseThirdyColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Gap(5),
                        Text(
                          "تقييم الطلب",
                          style: TextStyle(
                              color: kFourthColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        Gap(5),
                        Container(
                          decoration: BoxDecoration(
                              color: kFourthColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Text(
                              "التفاصيل",
                              style: TextStyle(
                                  color: kBaseColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ))),
    );
  }
}
