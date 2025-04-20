// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaz_mandob/Constant/colors.dart';
import 'package:gaz_mandob/Constant/styles.dart';
import 'package:gaz_mandob/Model/Order.dart';
import 'package:gaz_mandob/Services/Responsive.dart';
import 'package:gaz_mandob/View/Orders/Controller/OrderController.dart';
import 'package:intl/intl.dart';

class InvoiceDetails extends StatelessWidget {
  InvoiceDetails(
      {required this.invoice, required this.orderes, required this.controller});
  OrderController controller;
  Orderes orderes;
  InvoicesInfo invoice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        backgroundColor: Color(0xff445461),
        centerTitle: true,
        title: Text(
          "تفاصيل الفاتورة",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "رقم الفاتورة",
                    style: style18semibold,
                  ),
                  Gap(5),
                  Text(
                    "${orderes.number}",
                    style: style15semibold,
                  ),
                ],
              ),
            ],
          ),
          Gap(20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      "المنتج",
                      style: style18semibold,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "القيمة",
                      style: style18semibold,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "الكمية",
                      style: style18semibold,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "الاجمالي",
                      style: style18semibold,
                    ),
                  )
                ],
                rows: invoice.product!
                    .map((product) => DataRow(
                          cells: [
                            DataCell(
                              Text(
                                "${product.name}",
                                style: style15semibold,
                                maxLines: 1,
                              ),
                            ),
                            DataCell(
                              Text(
                                "${product.price} ريال",
                                style: style15semibold,
                                maxLines: 1,
                              ),
                            ),
                            DataCell(
                              Text(
                                "${product.quantity}",
                                style: style15semibold,
                                maxLines: 1,
                              ),
                            ),
                            DataCell(
                              Text(
                                "${product.price! * product.quantity!} ريال",
                                style: style15semibold,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ))
                    .toList()),
          ),
          Gap(20),
          Divider(
            endIndent: 50,
            indent: 50,
            color: kPrimaryColor,
          ),
          Gap(20),
          Row(
            children: [
              Text(
                "عنوان التوصيل",
                style: style18semibold,
              ),
              Gap(10),
              Row(
                children: [
                  Icon(Icons.location_on),
                  Text(
                    "${orderes.address!.name}",
                    style: style15semibold,
                  ),
                ],
              ),
            ],
          ),
          Gap(10),
          Row(
            children: [
              Text(
                "تاريخ الطلب",
                style: style18semibold,
              ),
              Gap(10),
              Text(
                "${DateFormat('yyyy/MM/dd').format(DateTime.parse(orderes.createdAt.toString()))}",
                style: style15semibold,
              ),
            ],
          ),
          Gap(10),
          Row(
            children: [
              Text(
                "اسم المستخدم",
                style: style18semibold,
              ),
              Gap(10),
              Text(
                "${orderes.userInfo!.userName}",
                style: style15semibold,
              ),
            ],
          ),
          Gap(10),
          Row(
            children: [
              Text(
                "رقم الهاتف",
                style: style18semibold,
              ),
              Gap(10),
              Text(
                "${orderes.userInfo!.phone}",
                style: style15semibold,
              ),
            ],
          ),
          Gap(10),
          Row(
            children: [
              Text(
                "السعر الصافي",
                style: style18semibold,
              ),
              Gap(10),
              Text(
                "${orderes.total}",
                style: style15semibold,
              ),
            ],
          ),
          Gap(10),
          Row(
            children: [
              Text(
                "السعر بعد الرمز الترويجي",
                style: style18semibold,
              ),
              Gap(10),
              Text(
                "${orderes.total}",
                style: style15semibold,
              ),
            ],
          ),
          orderes.toDoor == '1'
              ? Column(
                  children: [
                    Gap(10),
                    Row(
                      children: [
                        Text(
                          "رسوم التوصيل",
                          style: style18semibold,
                        ),
                        Gap(10),
                        Text(
                          "${100}",
                          style: style15semibold,
                        ),
                      ],
                    ),
                  ],
                )
              : Container(),
          orderes.toHouse == '1'
              ? Column(
                  children: [
                    Gap(10),
                    Row(
                      children: [
                        Text(
                          "رسوم توصيل الأدوار العليا",
                          style: style18semibold,
                        ),
                        Gap(10),
                        Text(
                          "${100}",
                          style: style15semibold,
                        ),
                      ],
                    ),
                  ],
                )
              : Container(),
          orderes.isOnTime == '1'
              ? Column(
                  children: [
                    Gap(10),
                    Row(
                      children: [
                        Text(
                          "رسوم توصيل خارج أوقات الدوام",
                          style: style15semibold,
                        ),
                        Gap(10),
                        Text(
                          "${100}",
                          style: style15semibold,
                        ),
                      ],
                    ),
                  ],
                )
              : Container(),
          Gap(10),
          Divider(
            endIndent: 50,
            indent: 50,
            thickness: 2,
            color: kFourthColor,
          ),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "المجموع الكلي مع الرسوم",
                style: style18semibold,
              ),
              Gap(10),
              Text(
                "${orderes.totalWithFees} ريال",
                style: style15semibold,
              ),
            ],
          ),
          Gap(50),
          orderes.status != 'pending'
              ? GestureDetector(
                  onTap: () {
                    controller.ReciveInvoicefromSupplier(context, invoice.id!);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 43,
                      width: Responsive.getWidth(context) * .8,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 2),
                              color: kBaseThirdyColor.withAlpha(75),
                              blurRadius: 7)
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topRight,
                            colors: [
                              Color(0xff1B2A36),
                              Color(0xff35536B),
                            ]),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "تم استلام طلب المورد الفرعي",
                          style: TextStyle(
                            fontSize: 15,
                            color: kBaseColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
          Gap(10),
        ],
      ),
    );
  }
}
