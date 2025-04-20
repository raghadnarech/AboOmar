// ignore_for_file: unused_field

// import 'package:background_locator/background_locator.dart';
// import 'package:background_locator/location_dto.dart';
// import 'package:background_locator/settings/android_settings.dart';
// import 'package:background_locator/settings/ios_settings.dart';
// import 'package:background_locator/settings/locator_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gaz_mandob/Constant/colors.dart';
import 'package:gaz_mandob/Constant/styles.dart';
import 'package:gaz_mandob/Controller/ServicesProvider.dart';
import 'package:gaz_mandob/Services/Location_Service.dart';
import 'package:gaz_mandob/Services/Routes.dart';
import 'package:gaz_mandob/View/Drawer/Drawer.dart';
import 'package:gaz_mandob/View/Orders/Controller/OrderController.dart';
import 'package:gaz_mandob/View/Orders/OrederCartDetails.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

// class LocationCallbackHandler {
//   static Future<void> initCallback(Map<dynamic, dynamic> params) async {
//     log('Init callback');
//   }

//   static Future<void> disposeCallback() async {
//     log('Dispose callback');
//   }

//   // static Future<void> callback(LocationDto locationDto) async {
//   //   log('Location in dart: ${locationDto.toString()}');
//   //   ApiService().updateLocation(locationDto.latitude, locationDto.longitude);
//   // }
// }

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  MandobLocationService? mandobLocationService;

  @override
  void initState() {
    super.initState();
    mandobLocationService = MandobLocationService(ApiService());
    mandobLocationService?.startTracking();
  }

  @override
  void dispose() {
    mandobLocationService?.stopTracking();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () => ServicesProvider.logout(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.login),
            ),
          ),
        ],
        leading: GestureDetector(
          onTap: () => scaffoldKey.currentState?.openDrawer(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/svg/menu.svg',
              width: 30,
              height: 25,
            ),
          ),
        ),
        backgroundColor: Color(0xff445461),
        centerTitle: true,
        title: Text("الطلبات"),
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Gap(10),
            Consumer<OrderController>(
              builder: (context, controller, child) {
                return Row(
                  children: [
                    Transform.scale(
                      scale: .8,
                      child: CupertinoSwitch(
                        activeColor: kFourthColor,
                        value: controller.online,
                        onChanged: (value) {
                          controller.toggleonline(value);
                          controller.ChangeMyStatus(context);
                        },
                      ),
                    ),
                    Text(
                      controller.online ? "متوفر الآن" : "خارج الخدمة",
                      style: style15semibold,
                    ),
                  ],
                );
              },
            ),
            Gap(20),
            Container(
              color: kBaseSecandryColor,
              child: TabBar(
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'Cairo',
                  color: kSecendryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(child: Text("كافة الطلبات")),
                  Tab(child: Text("الطلبات القريبة")),
                  Tab(child: Text("الطلبات المخصصة")),
                  Tab(child: Text("الطلبات المستلمة")),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Orders(),
                  OrdersWithNearestman(),
                  Manager_orders(),
                  CancelOrder(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderController>(
      builder:
          (context, controller, child) => RefreshIndicator(
            onRefresh: () => controller.GetMyOrders(),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.listorder.length,
              itemBuilder:
                  (context, index) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
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
                                // Row(
                                //   children: [
                                //     Text(
                                //       "اسم المورد",
                                //       style: style15semibold,
                                //     ),
                                //     Gap(10),
                                //     Text(
                                //       controller.listorder[index].number!,
                                //       style: style15semibold,
                                //     ),
                                //   ],
                                // ),
                                Gap(5),
                                Row(
                                  children: [
                                    Text("حالة الطلب", style: style15semibold),
                                    Gap(10),
                                    Text(
                                      "${controller.listorder[index].status}",
                                      style: style15semibold,
                                    ),
                                  ],
                                ),
                                Gap(5),
                                Text(
                                  DateFormat('HH:mm | yyyy-MM-dd').format(
                                    DateTime.parse(
                                      controller.listorder[index].createdAt!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    CustomRoute.RouteTo(
                                      context,
                                      OrederCartDetails(
                                        invoices:
                                            controller
                                                .listorder[index]
                                                .invoicesInfo!,
                                        orderes: controller.listorder[index],
                                        controller: controller,
                                      ),
                                    );
                                  },
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
                          ],
                        ),
                      ),
                    ),
                  ),
            ),
          ),
    );
  }
}

class OrdersWithNearestman extends StatelessWidget {
  const OrdersWithNearestman({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderController>(
      builder:
          (context, controller, child) => RefreshIndicator(
            onRefresh: () => controller.GetMyOrders(),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.listordersWithNearestman.length,
              itemBuilder:
                  (context, index) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
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
                                // Row(
                                //   children: [
                                //     Text(
                                //       "اسم المورد",
                                //       style: style15semibold,
                                //     ),
                                //     Gap(10),
                                //     Text(
                                //       controller.listorder[index].number!,
                                //       style: style15semibold,
                                //     ),
                                //   ],
                                // ),
                                Gap(5),
                                Row(
                                  children: [
                                    Text("حالة الطلب", style: style15semibold),
                                    Gap(10),
                                    Text(
                                      "${controller.listordersWithNearestman[index].status}",
                                      style: style15semibold,
                                    ),
                                  ],
                                ),
                                Gap(5),
                                Text(
                                  DateFormat('HH:mm | yyyy-MM-dd').format(
                                    DateTime.parse(
                                      controller
                                          .listordersWithNearestman[index]
                                          .createdAt!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    CustomRoute.RouteTo(
                                      context,
                                      OrederCartDetails(
                                        invoices:
                                            controller
                                                .listordersWithNearestman[index]
                                                .invoicesInfo!,
                                        orderes:
                                            controller
                                                .listordersWithNearestman[index],
                                        controller: controller,
                                      ),
                                    );
                                  },
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
                          ],
                        ),
                      ),
                    ),
                  ),
            ),
          ),
    );
  }
}

class Manager_orders extends StatelessWidget {
  const Manager_orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderController>(
      builder:
          (context, controller, child) => RefreshIndicator(
            onRefresh: () => controller.GetMyOrders(),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.listmanager_orders.length,
              itemBuilder:
                  (context, index) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
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
                                // Row(
                                //   children: [
                                //     Text(
                                //       "اسم المورد",
                                //       style: style15semibold,
                                //     ),
                                //     Gap(10),
                                //     Text(
                                //       controller.listorder[index].number!,
                                //       style: style15semibold,
                                //     ),
                                //   ],
                                // ),
                                Gap(5),
                                Row(
                                  children: [
                                    Text("حالة الطلب", style: style15semibold),
                                    Gap(10),
                                    Text(
                                      "${controller.listmanager_orders[index].status}",
                                      style: style15semibold,
                                    ),
                                  ],
                                ),
                                Gap(5),
                                Text(
                                  DateFormat('HH:mm | yyyy-MM-dd').format(
                                    DateTime.parse(
                                      controller
                                          .listmanager_orders[index]
                                          .createdAt!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    CustomRoute.RouteTo(
                                      context,
                                      OrederCartDetails(
                                        invoices:
                                            controller
                                                .listmanager_orders[index]
                                                .invoicesInfo!,
                                        orderes:
                                            controller
                                                .listmanager_orders[index],
                                        controller: controller,
                                      ),
                                    );
                                  },
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
                          ],
                        ),
                      ),
                    ),
                  ),
            ),
          ),
    );
  }
}

class CancelOrder extends StatelessWidget {
  const CancelOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderController>(
      builder:
          (context, controller, child) => RefreshIndicator(
            onRefresh: () => controller.GetMyCancelOrders(),
            child:
                controller.listcancelorder.isEmpty
                    ? SingleChildScrollView(
                      child: Center(
                        child: Text("لا يوجد طلبات في الوقت الحالي"),
                      ),
                    )
                    : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.listcancelorder.length,
                      itemBuilder:
                          (context, index) => Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: kPrimaryColor),
                                color: kThirdryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "اسم المورد",
                                              style: style15semibold,
                                            ),
                                            Gap(10),
                                            Text(
                                              controller
                                                  .listcancelorder[index]
                                                  .number!,
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
                                            Builder(
                                              builder: (context) {
                                                switch (controller
                                                    .listcancelorder[index]
                                                    .status) {
                                                  case "pending":
                                                    return Text(
                                                      'تم إرسال الطلب',
                                                      style: style15semibold,
                                                    );
                                                  case "anotherPattern":
                                                    return Text(
                                                      "Another Status",
                                                      style: style15semibold,
                                                    );
                                                  default:
                                                    return Text(
                                                      "Default Status",
                                                      style: style15semibold,
                                                    );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                        Gap(5),
                                        Text(
                                          DateFormat(
                                            'HH:mm | yyyy-MM-dd',
                                          ).format(
                                            DateTime.parse(
                                              controller
                                                  .listcancelorder[index]
                                                  .createdAt!,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            CustomRoute.RouteTo(
                                              context,
                                              OrederCartDetails(
                                                invoices:
                                                    controller
                                                        .listcancelorder[index]
                                                        .invoicesInfo!,
                                                orderes:
                                                    controller
                                                        .listcancelorder[index],
                                                controller: controller,
                                              ),
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: kFourthColor,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                    ),
          ),
    );
  }
}
