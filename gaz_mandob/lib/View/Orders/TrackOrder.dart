import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaz_mandob/Constant/colors.dart';
import 'package:gaz_mandob/Constant/styles.dart';
import 'package:gaz_mandob/Services/Responsive.dart';
import 'package:gaz_mandob/View/Orders/Controller/OrderController.dart';
import 'package:provider/provider.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        backgroundColor: Color(0xff445461),
        centerTitle: true,
        title: Text(
          "تتبع الطلب",
          style: style15semibold,
        ),
      ),
      body: Consumer<OrderController>(
        builder: (context, controller, child) => Stack(
          children: [
            Positioned(
              top: 0,
              child: Image.asset(
                "assets/images/map.png",
                width: Responsive.getWidth(context),
                height: Responsive.getHeight(context) * .9,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        color: kBaseThirdyColor.withAlpha(100),
                        blurRadius: 7)
                  ],
                  color: kBaseColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                width: Responsive.getWidth(context),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("اسم المندوب"),
                          Gap(10),
                          Text("احمد أحمد"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("رقم المندوب"),
                              Gap(10),
                              Text("054566544655"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("رقم السيارة"),
                              Gap(10),
                              Text("4654658"),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("الوقت المتوقع للاستلام"),
                          Gap(10),
                          Text("ربع ساعة"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("السعر"),
                          Gap(10),
                          Text("100 ريال"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("حالة الطلب"),
                          Gap(10),
                          Text(
                            "يتم تجهيز الطلب",
                            style: TextStyle(color: kFourthColor),
                          ),
                        ],
                      ),
                      Gap(30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: GestureDetector(
                          onTap: () async {
                            await controller.ReciveOrderAsUser(context);
                          },
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
                              color: Color(0xff445461),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "تم الاستلام",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: kBaseColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
