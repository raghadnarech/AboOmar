// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Model/Invoice.dart';
import 'package:supplier/Services/Responsive.dart';
import 'package:supplier/View/Drawer/Drawer.dart';
import 'package:supplier/View/Orders/Controller/OrderController.dart';

class FinishOreder extends StatelessWidget {
  FinishOreder({required this.controller, required this.invoice});
  OrderController controller;
  Invoice invoice;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: CustomDrawer(),
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {},
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
            "تفاصيل الطلب",
            style: style15semiboldwhite,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8, right: 12, left: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(10),
              Row(
                children: [
                  Text(
                    "رقم الفاتورة",
                    style: style12semibold,
                  ),
                  Gap(20),
                  Text(
                    "${invoice.orderNumber}",
                    style: style12semibold,
                  )
                ],
              ),
              Gap(17),
              DataTable(
                  columns: [
                    DataColumn(
                      label: Text("المنتج"),
                    ),
                    DataColumn(
                      label: Text("السعر"),
                    ),
                    DataColumn(
                      label: Text("العدد"),
                    ),
                    // DataColumn(
                    //   label: Text("الخدمة المطلوبة"),
                    // )
                  ],
                  rows: invoice.product!
                      .map(
                        (e) => DataRow(
                          cells: [
                            DataCell(
                              Text(e.name!),
                            ),
                            DataCell(
                              Text("${e.price!}"),
                            ),
                            DataCell(
                              Text("${e.quantity!}"),
                            ),
                          ],
                        ),
                      )
                      .toList()),
              Gap(30),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        "عنوان التوصيل",
                        style: style12semibold,
                      ),
                      Gap(20),
                      Icon(Icons.location_on),
                      Gap(4),
                      Text(
                        "${invoice.userAddress}",
                        style: style12semibold,
                      ),
                    ],
                  ),
                ],
              ),
              Gap(17),
              Row(
                children: [
                  Text(
                    "تاريخ الطلب",
                    style: style12semibold,
                  ),
                  Gap(45),
                  Text(
                    "20/3/1122",
                    style: style12semibold,
                  ),
                ],
              ),
              Gap(17),
              Row(
                children: [
                  Text(
                    "اسم المستخدم",
                    style: style12semibold,
                  ),
                  Gap(25),
                  Text(
                    "${invoice.userName}",
                    style: style12semibold,
                  ),
                ],
              ),
              Gap(17),
              Row(
                children: [
                  Text(
                    "رقم الهاتف",
                    style: style12semibold,
                  ),
                  Gap(40),
                  Text(
                    "${invoice.userPhone}",
                    style: style12semibold,
                  ),
                ],
              ),
              Gap(17),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: GestureDetector(
                  onTap: () {
                    controller.ArrangeInvoice(context, invoice.invoice_id!);
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
                      "البدء بتجهيز الطلب",
                      style: style15semiboldwhite,
                    )),
                  ),
                ),
              ),
              Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: GestureDetector(
                  onTap: () {
                    controller.FinishInvoice(
                      context,
                      invoice.invoice_id!,
                    );
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
                      "الانتهاء من التجهيز",
                      style: style15semiboldwhite,
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
