import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:gaz_mandob/Constant/colors.dart';
import 'package:gaz_mandob/Constant/styles.dart';
import 'package:gaz_mandob/View/DaileyAccounting/Controller/DaileyAccountingController.dart';
import 'package:gaz_mandob/View/Drawer/Drawer.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class DaileyAccounting extends StatelessWidget {
  const DaileyAccounting({super.key});

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
            "كشف الحساب اليومي",
            style: style15semiboldwhite,
          ),
        ),
        body: Consumer<DaileyAccountingController>(
          builder: (context, controller, child) => controller
                  .isloadingGetDaileyOrders
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding:
                      const EdgeInsets.only(top: 10, right: 18, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "كشف الحساب اليومي",
                        style: TextStyle(
                            color: kFourthColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "عدد الطلبات",
                            style: style12semibold,
                          ),
                          Gap(40),
                          Text(
                            "${controller.dailyAccounts.count}",
                            style: style12semibold,
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                              controller.dailyAccounts.dailyaccount!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "رقم الطلب",
                                            style: style12semibold,
                                          ),
                                          Gap(40),
                                          Text(
                                            "${controller.dailyAccounts.dailyaccount![index].number}",
                                            style: style12semibold,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Gap(60),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "سعر الطلب",
                                            style: style12semibold,
                                          ),
                                          Gap(40),
                                          Text(
                                            "${controller.dailyAccounts.dailyaccount![index].priceWithFees}",
                                            style: style12semibold,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "السعر الاجمالي",
                            style: style12semibold,
                          ),
                          Gap(40),
                          Text(
                            "${controller.dailyAccounts.totalPrice}",
                            style: style12semibold,
                          ),
                        ],
                      ),
                      Gap(20)
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
