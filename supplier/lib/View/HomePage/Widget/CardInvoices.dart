// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Model/Invoice.dart';
import 'package:supplier/Services/Responsive.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/View/Orders/Controller/OrderController.dart';
import 'package:supplier/View/Orders/OrderDetails.dart';

class CardInvoices extends StatelessWidget {
  CardInvoices({
    this.invoice,
  });
  Invoice? invoice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kSecendryColor, width: 1.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "رقم الطلب",
                        style: style12semibold,
                      ),
                      Gap(10),
                      Text(
                        "${invoice!.orderNumber}",
                        style: style12semibold,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "اسم المستخدم",
                        style: style12semibold,
                      ),
                      Gap(10),
                      Text(
                        invoice!.userName!,
                        style: style12semibold,
                      ),
                    ],
                  ),
                ],
              ),
              Gap(12),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                  ),
                  Text(
                    invoice!.userAddress!,
                    style: style12semibold,
                  ),
                ],
              ),
              Gap(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      CustomRoute.RouteTo(
                          context,
                          ChangeNotifierProvider<OrderController>(
                            create: (context) => OrderController(),
                            builder: (context, child) => OrderDetails(
                              invoice: invoice,
                            ),
                          ));
                    },
                    child: Container(
                      width: Responsive.getHeight(context) * 0.09,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: kFourthColor),
                      child: Center(
                        child: Text(
                          "التفاصيل",
                          style: style12semiboldwhite,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "${invoice!.orderDate}",
                    style: style12semibold,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
