import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Constant/styles.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class DailyReport extends StatelessWidget {
  const DailyReport({super.key});

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
        title: Text("التقارير اليومية للمندوب"),
      ),
      body: Center(
        child: SizedBox(
            width: Responsive.getWidth(context) * .9,
            child: ListView(
              children: [
                Gap(20),
                Row(
                  children: [
                    Text(
                      "الحالة الحالية",
                      style: style15semibold,
                    ),
                    Gap(20),
                    Text(
                      "متوفر الان",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Gap(20),
                Text(
                  "نشاطه اليومي",
                  style: style15semibold,
                ),
                Gap(10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 15,
                      color: kFourthColor,
                    ),
                    Gap(10),
                    Text("اون لاين من الساعة 2 - 3")
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 15,
                      color: kFourthColor,
                    ),
                    Gap(10),
                    Text("اون لاين من الساعة 2 - 3")
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 15,
                      color: kFourthColor,
                    ),
                    Gap(10),
                    Text("اون لاين من الساعة 2 - 3")
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 15,
                      color: kFourthColor,
                    ),
                    Gap(10),
                    Text("اون لاين من الساعة 2 - 3")
                  ],
                ),
                Gap(20),
                Text(
                  "الطلبات",
                  style: style15semibold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                          color: kFourthColor,
                        ),
                        Gap(10),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "رقم الطلب",
                                  style: style15semibold,
                                ),
                                Gap(10),
                                Text(
                                  "74185",
                                  style: style15semibold,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "اسم الطلب",
                                  style: style15semibold,
                                ),
                                Gap(10),
                                Text(
                                  "توريد غاز",
                                  style: style15semibold,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text("10 / 12 / 2023")
                  ],
                ),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                          color: kFourthColor,
                        ),
                        Gap(10),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "رقم الطلب",
                                  style: style15semibold,
                                ),
                                Gap(10),
                                Text(
                                  "74185",
                                  style: style15semibold,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "اسم الطلب",
                                  style: style15semibold,
                                ),
                                Gap(10),
                                Text(
                                  "توريد غاز",
                                  style: style15semibold,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text("10 / 12 / 2023")
                  ],
                )
              ],
            )),
      ),
    ));
  }
}
