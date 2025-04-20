// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Model/Invoice.dart';
import 'package:supplier/Services/Responsive.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/View/Drawer/Drawer.dart';
import 'package:supplier/View/Orders/Controller/OrderController.dart';
import 'package:supplier/View/Orders/FinishOrder.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class OrderDetails extends StatelessWidget {
  OrderDetails({this.invoice});
  Invoice? invoice;

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
            "تفاصيل الطلب",
            style: style15semiboldwhite,
          ),
        ),
        body: Consumer<OrderController>(
          builder: (context, controller, child) => Padding(
            padding: const EdgeInsets.only(top: 8, right: 12, left: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Gap(20),
                Row(
                  children: [
                    Text(
                      "رقم الفاتورة",
                      style: style12semibold,
                    ),
                    Gap(15),
                    Text(
                      "${invoice!.orderNumber}",
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
                    rows: invoice!.product!
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
                        Gap(15),
                        Icon(Icons.location_on),
                        Gap(4),
                        Text(
                          "${invoice!.userAddress}",
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
                    Gap(15),
                    Text(
                      "${invoice!.orderDate}",
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
                    Gap(15),
                    Text(
                      "${invoice!.userName}",
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
                    Gap(15),
                    Text(
                      "${invoice!.userPhone}",
                      style: style12semibold,
                    ),
                  ],
                ),
                Gap(17),
                Row(
                  children: [
                    Text(
                      "السعر الصافي",
                      style: style12semibold,
                    ),
                    Gap(15),
                    Text(
                      "ريال   ${invoice!.totalPriceForOrder}",
                      style: style12semibold,
                    )
                  ],
                ),
                Gap(17),
                Row(
                  children: [
                    Text(
                      "السعر بعد الضريبة ",
                      style: style12semibold,
                    ),
                    Gap(15),
                    Text(
                      "ريال  ${invoice!.totalOrderPriceWithFees}",
                      style: style12semibold,
                    ),
                  ],
                ),
                Gap(17),
                Row(
                  children: [
                    Text(
                      "الكود الترويجي",
                      style: style12semibold,
                    ),
                    Gap(15),
                    Text(
                      "${invoice!.code}",
                      style: style12semibold,
                    ),
                  ],
                ),
                Gap(17),
                Row(
                  children: [
                    Text(
                      "حالة الطلب",
                      style: style12semibold,
                    ),
                    Gap(15),
                    Text(
                      "${invoice!.invoiceStatus}",
                      style: style12semibold,
                    ),
                  ],
                ),
                Gap(100),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.AccRejInvoice(
                              context, invoice!.invoice_id!, 'accept');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.green),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "استلام الطلب",
                                style: style15semiboldwhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.CancelInvoice(
                              context, invoice!.invoice_id!);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: kFourthColor),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "إلغاء الطلبية",
                                style: style15semiboldwhite,
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: GestureDetector(
                    onTap: () {
                      CustomRoute.RouteTo(
                          context,
                          FinishOreder(
                            controller: controller,
                            invoice: invoice!,
                          ));
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
                        " اقفال الطلب",
                        style: style15semiboldwhite,
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// void _showDialogaccept(BuildContext context, OrderController controller) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Stack(
//         children: [
//           GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Container(
//               color: Colors.white.withOpacity(0.1),
//               // height: Responsive.getHeight(context) * 0.2,
//               // width: Responsive.getWidth(context),
//             ),
//           ),
//           Positioned(
//             // height: 500,
//             top: 40,
//             // left: 10,
//             //right: 10,
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//               child: AlertDialog(
//                 contentPadding:
//                     EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
//                 title: Align(
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "فاتورة الالغاء",
//                         style: TextStyle(
//                             fontSize: 12,
//                             color: kFourthColor,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Icon(Icons.close),
//                       ),
//                     ],
//                   ),
//                 ),
//                 content: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           "منظفات",
//                           style: style12semibold,
//                         ),
//                         Gap(15),
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(Icons.minimize),
//                         ),
//                         Gap(5),
//                         Container(
//                           width: 50,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(4),
//                               color: kThirdryColor),
//                           child: Center(
//                             child: Text(
//                               "2",
//                               style: style12semibold,
//                             ),
//                           ),
//                         ),
//                         Gap(10),
//                         Container(
//                           height: Responsive.getHeight(context) * 0.04,
//                           width: Responsive.getWidth(context) * 0.08,
//                           decoration: BoxDecoration(
//                             color: kFourthColor,
//                             borderRadius: BorderRadius.circular(120),
//                           ),
//                           child: Center(
//                             child: Transform.scale(
//                               scale: 1.2,
//                               child: Icon(
//                                 Icons.remove,
//                                 size: 15,
//                                 color: kThirdryColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Gap(10),
//                         Text(
//                           "الغاء الطلب كليا",
//                           style: style12semibold,
//                         )
//                       ],
//                     ),
//                     Gap(10),
//                     Row(
//                       children: [
//                         Text(
//                           "لحوم",
//                           style: style12semibold,
//                         ),
//                         Gap(20),
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(Icons.minimize),
//                         ),
//                         Gap(5),
//                         Container(
//                           width: 50,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(4),
//                               color: kThirdryColor),
//                           child: Center(
//                             child: Text(
//                               "2",
//                               style: style12semibold,
//                             ),
//                           ),
//                         ),
//                         Gap(10),
//                         Container(
//                           height: Responsive.getHeight(context) * 0.04,
//                           width: Responsive.getWidth(context) * 0.08,
//                           decoration: BoxDecoration(
//                             color: kFourthColor,
//                             borderRadius: BorderRadius.circular(120),
//                           ),
//                           child: Center(
//                             child: Transform.scale(
//                               scale: 1.2,
//                               child: Icon(
//                                 Icons.remove,
//                                 size: 15,
//                                 color: kThirdryColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Gap(10),
//                         Text(
//                           "الغاء الطلب كليا",
//                           style: style12semibold,
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//                 actions: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10),
//                     child: Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           CustomRoute.RoutePop(context);
//                           ;
//                         },
//                         child: Container(
//                           width: Responsive.getWidth(context) * 0.55,
//                           height: Responsive.getHeight(context) * 0.045,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               gradient: LinearGradient(
//                                   begin: Alignment.bottomLeft,
//                                   end: Alignment.bottomRight,
//                                   colors: [
//                                     Color(0xff722B23),
//                                     Color(0xffB04135),
//                                   ])),
//                           child: Center(
//                             child: Text("الموافقة والمتابعة",
//                                 style: style12semiboldwhite),
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       );
//     },
//   );
// }
