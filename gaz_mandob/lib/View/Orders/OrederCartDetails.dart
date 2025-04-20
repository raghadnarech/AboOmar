// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:gaz_mandob/Constant/colors.dart';
import 'package:gaz_mandob/Constant/styles.dart';
import 'package:gaz_mandob/Model/Order.dart';
import 'package:gaz_mandob/Services/Responsive.dart';
import 'package:gaz_mandob/Services/Routes.dart';
import 'package:gaz_mandob/View/Orders/Controller/OrderController.dart';
import 'package:gaz_mandob/View/Orders/InvoiceDetailes.dart';
import 'package:gaz_mandob/View/Ticket/Controller/TicketController.dart';
import 'package:gaz_mandob/View/Ticket/TicketPage.dart';
import 'package:gaz_mandob/View/Widgets/TextInput/TextInputCustom.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrederCartDetails extends StatelessWidget {
  OrederCartDetails({
    required this.invoices,
    required this.orderes,
    required this.controller,
  });
  OrderController controller;
  Orderes orderes;
  List<InvoicesInfo> invoices;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        backgroundColor: Color(0xff445461),
        centerTitle: true,
        title: Text("تفاصيل الطلب", style: style15semibold),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
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
                      Container(color: kSecendryColor, width: 10, height: 10),
                      Text(
                        "تم ارسال الطلب",
                        style: TextStyle(
                          color: kSecendryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 10,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(color: kPrimaryColor, width: 10, height: 10),
                      Text(
                        "تم قبول الطلب من المندوب",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 10,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(color: kFourthColor, width: 10, height: 10),
                      Text(
                        "يتم تجهيز الطلب",
                        style: TextStyle(
                          color: kFourthColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 10,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(color: Colors.green, width: 10, height: 10),
                      Text(
                        "تم الانتهاء من التجهيز",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 10,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(color: kBaseThirdyColor, width: 10, height: 10),
                      Text(
                        "استلام المندوب للطلب",
                        style: TextStyle(
                          color: kBaseThirdyColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("رقم الطلب", style: style15semibold),
                    Gap(10),
                    Text("${orderes.number}"),
                  ],
                ),
                Row(
                  children: [
                    Text("تاريخ الطلب", style: style15semibold),
                    Gap(10),
                    Text(
                      "${DateFormat('yyyy/MM/dd').format(DateTime.parse(orderes.createdAt.toString()))}",
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("حالة الطلب", style: style15semibold),
                    Gap(10),
                    Text("${orderes.status}"),
                  ],
                ),
                Row(
                  children: [
                    Text("اسم المستخدم", style: style15semibold),
                    Gap(10),
                    Text("${orderes.userInfo!.userName}"),
                  ],
                ),
                Row(
                  children: [
                    Text("رقم الهاتف", style: style15semibold),
                    Gap(10),
                    Text("${orderes.userInfo!.phone}"),
                  ],
                ),
                Row(
                  children: [
                    Text("عنوان التوصيل", style: style15semibold),
                    Gap(10),
                    // Text("${orderes.address!.name}"),
                  ],
                ),
                Gap(10),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: invoices.length,
                  itemBuilder:
                      (context, index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: kFourthColor),
                        ),
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
                                        "المورد الفرعي",
                                        style: style15semibold,
                                      ),
                                      Gap(20),
                                      Text("${invoices[index].supplier!.id}"),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap:
                                        () => CustomRoute.RouteTo(
                                          context,
                                          InvoiceDetails(
                                            invoice: invoices[index],
                                            orderes: orderes,
                                            controller: controller,
                                          ),
                                        ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: kFourthColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        child: Text(
                                          "التفاصيل",
                                          style: TextStyle(
                                            color: kBaseColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "الخدمة المطلوبة",
                                    style: style15semibold,
                                  ),
                                  Gap(20),
                                  Text(
                                    "${invoices[index].supplier!.service!.name}",
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("العدد", style: style15semibold),
                                  Gap(20),
                                  Text("${invoices[index].quantity}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("حالة الفاتورة", style: style15semibold),
                                  Gap(20),
                                  Text("${invoices[index].status}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("عنوان المورد", style: style15semibold),
                                  Gap(20),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on),
                                      Text(
                                        "${invoices[index].supplier!.area} - ${invoices[index].supplier!.city} - ${invoices[index].supplier!.street}",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "المجموع الكلي مع الرسوم",
                                    style: style15semibold,
                                  ),
                                  Gap(20),
                                  Text("${invoices[index].priceWithFees}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("طريقة الدفع", style: style15semibold),
                                  Gap(20),
                                  Text("${orderes.paymentKind}"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                ),
                Gap(20),
                GestureDetector(
                  onTap:
                      () => CustomRoute.RouteReplacementTo(
                        context,
                        ChangeNotifierProvider<TicketController>(
                          create:
                              (context) =>
                                  TicketController()
                                    ..oninit(orderes.userId!)
                                    ..GetAllTicket(context),
                          builder:
                              (context, child) =>
                                  TicketPage(title: "التواصل مع المستخدم"),
                        ),
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "التواصل مع المستخدم ضمن التطبيق",
                        style: style15semibold,
                      ),
                      Gap(10),
                      Container(
                        decoration: BoxDecoration(
                          color: kFourthColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            'assets/svg/chat.svg',
                            width: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gap(50),
          GestureDetector(
            onTap: () {
              controller.AcceptOrder(context, orderes.id!);
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
                      blurRadius: 7,
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topRight,
                    colors: [Color(0xff1B2A36), Color(0xff35536B)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "قبول الطلب",
                    style: TextStyle(
                      fontSize: 15,
                      color: kBaseColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Gap(20),
          GestureDetector(
            onTap: () {
              showDialog(
                barrierDismissible: false,
                barrierLabel: '',
                context: context,
                barrierColor: Colors.transparent,
                builder:
                    (context) => StatefulBuilder(
                      builder:
                          (context, setState) => BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 40,
                                        horizontal: 20,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("سبب إلغاء الطلب"),
                                          Gap(20),
                                          TextInputCustom(
                                            controller: controller.reasoncancel,
                                          ),
                                          Gap(50),
                                          GestureDetector(
                                            onTap:
                                                () => controller.CancelOrder(
                                                  context,
                                                  orderes.id!,
                                                ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 30,
                                                  ),
                                              child: Container(
                                                height: 43,
                                                width:
                                                    Responsive.getWidth(
                                                      context,
                                                    ) *
                                                    .8,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(0, 2),
                                                      color: kBaseThirdyColor
                                                          .withAlpha(75),
                                                      blurRadius: 7,
                                                    ),
                                                  ],
                                                  gradient: LinearGradient(
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topRight,
                                                    colors: [
                                                      Color(0xff722B23),
                                                      Color(0xffE45545),
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "تأكيد إلغاء الطلب",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: kBaseColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                    ),
              );
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
                      blurRadius: 7,
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xff722B23), Color(0xffE45545)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "إلغاء الطلب",
                    style: TextStyle(
                      fontSize: 15,
                      color: kBaseColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
