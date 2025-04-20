// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gaz_mandob/Constant/colors.dart';
import 'package:gaz_mandob/Constant/styles.dart';
import 'package:gaz_mandob/Constant/url.dart';
import 'package:gaz_mandob/Model/Order.dart';
import 'package:gaz_mandob/Services/CustomDialog.dart';
import 'package:gaz_mandob/Services/Failure.dart';
import 'package:gaz_mandob/Services/NetworkClient.dart';
import 'package:gaz_mandob/Services/Routes.dart';
import 'package:gaz_mandob/Services/network_connection.dart';
import 'package:gaz_mandob/View/Orders/OrdersPage.dart';
import 'package:gaz_mandob/View/Rate/Controller/RateController.dart';
import 'package:gaz_mandob/View/Rate/RatePage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class OrderController with ChangeNotifier {
  static NetworkClient client = NetworkClient(http.Client());
  int? id;
  oninit(int id) {
    this.id = id;
  }

  bool online = false;
  toggleonline(bool value) {
    online = value;
    notifyListeners();
  }

  List<Orderes> listorder = [];
  List<Orderes> listordersWithNearestman = [];
  List<Orderes> listmanager_orders = [];
  List<Orderes> listcancelorder = [];

  Future<Either<Failure, bool>> GetMyOrders() async {
    notifyListeners();
    log("call this method");
    listorder = [];
    listordersWithNearestman = [];
    listmanager_orders = [];
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.GetMyOrders,
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          for (var element in res['orders']) {
            listorder.add(Orderes.fromJson(element));
          }
          for (var element in res['ordersWithNearestman']) {
            listordersWithNearestman.add(Orderes.fromJson(element));
          }
          for (var element in res['manager_orders']) {
            listmanager_orders.add(Orderes.fromJson(element));
          }
          notifyListeners();
          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
          notifyListeners();
          return Left(ResultFailure(res['message']));
        } else {
          notifyListeners();
          return Left(GlobalFailure());
        }
      } else {
        notifyListeners();
        return Left(ServerFailure());
      }
    } catch (e) {
      notifyListeners();
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }

  Future<Either<Failure, bool>> GetStatus() async {
    // EasyLoading.show();
    log("call this method");
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.GetStatus,
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          // EasyLoading.dismiss();
          var status = jsonDecode(response.body);
          online = status == 1 ? true : false;
          notifyListeners();
          // CustomDialog.Dialog(context, title: "تم تغيير حالتك");
          return Right(true);
        } else if (response.statusCode == 404) {
          // EasyLoading.dismiss();
          return Left(ResultFailure(''));
        } else {
          // EasyLoading.dismiss();
          return Left(GlobalFailure());
        }
      } else {
        // EasyLoading.dismiss();
        return Left(ServerFailure());
      }
    } catch (e) {
      // EasyLoading.dismiss();
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }

  Future<Either<Failure, bool>> ChangeMyStatus(BuildContext context) async {
    EasyLoading.show();
    log("call this method");
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.ChangeMyStatus,
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          EasyLoading.dismiss();
          CustomDialog.Dialog(context, title: "تم تغيير حالتك");
          GetStatus();
          return Right(true);
        } else if (response.statusCode == 404) {
          EasyLoading.dismiss();
          return Left(ResultFailure(''));
        } else {
          EasyLoading.dismiss();
          return Left(GlobalFailure());
        }
      } else {
        EasyLoading.dismiss();
        return Left(ServerFailure());
      }
    } catch (e) {
      EasyLoading.dismiss();
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }

  Future<Either<Failure, bool>> GetMyCancelOrders() async {
    notifyListeners();
    log("call this method");
    listcancelorder = [];
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.GetMyCancelOrders,
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          // var res = jsonDecode(response.body);
          // for (var element in res) {
          //   // listcancelorder.add(Orderes.fromJson(element));
          // }
          notifyListeners();
          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
          notifyListeners();
          return Left(ResultFailure(res['message']));
        } else {
          notifyListeners();
          return Left(GlobalFailure());
        }
      } else {
        notifyListeners();
        return Left(ServerFailure());
      }
    } catch (e) {
      notifyListeners();
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }

  bool mybank = true;
  bool anotherbank = false;

  var amountcontroller = TextEditingController();
  var plus500controller = TextEditingController();
  changeaddtrasaction(String? amount) {
    amountcontroller.text = amount!;
  }

  Future<Either<Failure, bool>> ReciveOrderAsUser(BuildContext context) async {
    EasyLoading.show();
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.POST,
          path: AppApi.ReciveOrderAsUser(id!),
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          EasyLoading.dismiss();

          showdialogratingandobjection(context);

          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
          EasyLoading.dismiss();

          return Left(ResultFailure(res['message']));
        } else {
          EasyLoading.dismiss();

          return Left(GlobalFailure());
        }
      } else {
        EasyLoading.dismiss();

        return Left(ServerFailure());
      }
    } catch (e) {
      EasyLoading.dismiss();

      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }

  Future<Either<Failure, bool>> AcceptOrder(
      BuildContext context, int id) async {
    EasyLoading.show();
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.AcceptOrder(id),
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          EasyLoading.dismiss();

          showdialogratingandobjection(context);

          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
          EasyLoading.dismiss();

          return Left(ResultFailure(res['message']));
        } else {
          EasyLoading.dismiss();

          return Left(GlobalFailure());
        }
      } else {
        EasyLoading.dismiss();

        return Left(ServerFailure());
      }
    } catch (e) {
      EasyLoading.dismiss();

      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }

  final reasoncancel = TextEditingController();
  Future<Either<Failure, bool>> CancelOrder(
      BuildContext context, int id) async {
    EasyLoading.show();
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
            requestType: RequestType.POST,
            path: AppApi.CancelOrder(id),
            body: {
              'cancel_reason': reasoncancel.text,
            });
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          EasyLoading.dismiss();
          CustomRoute.RouteAndRemoveUntilTo(
            context,
            ChangeNotifierProvider(
              create: (context) => OrderController()
                ..GetMyCancelOrders()
                ..GetMyOrders()
                ..GetStatus(),
              builder: (context, child) => OrdersPage(),
            ),
          );

          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
          EasyLoading.dismiss();

          return Left(ResultFailure(res['message']));
        } else {
          EasyLoading.dismiss();

          return Left(GlobalFailure());
        }
      } else {
        EasyLoading.dismiss();

        return Left(ServerFailure());
      }
    } catch (e) {
      EasyLoading.dismiss();

      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }

  Future<Either<Failure, bool>> ReciveInvoicefromSupplier(
      BuildContext context, int id) async {
    EasyLoading.show();
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.ReciveInvoicefromSupplier(id),
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          EasyLoading.dismiss();

          // showdialogratingandobjection(context);

          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
          EasyLoading.dismiss();

          return Left(ResultFailure(res['message']));
        } else {
          EasyLoading.dismiss();

          return Left(GlobalFailure());
        }
      } else {
        EasyLoading.dismiss();

        return Left(ServerFailure());
      }
    } catch (e) {
      EasyLoading.dismiss();

      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }

  showdialogratingandobjection(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      barrierLabel: '',
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => BackdropFilter(
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
                        // CustomRoute.RouteAndRemoveUntilTo(
                        //   context,
                        //   ChangeNotifierProvider(
                        //     lazy: true,
                        //     create: (context) => HomePageController()
                        //       ..GetMyCancelOrders()
                        //       ..GetMyOrders()
                        //       ..GetProfile()
                        //       ..getalladdress(context),
                        //     builder: (context, child) => ,
                        //   ),
                        // );
                      },
                      child: Icon(
                        Icons.close,
                        color: kBaseThirdyColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        CustomRoute.RoutePop(context);
                        // CustomRoute.RouteAndRemoveUntilTo(
                        //   context,
                        //   ChangeNotifierProvider(
                        //     lazy: true,
                        //     create: (context) => HomePageController()
                        //       ..GetMyCancelOrders()
                        //       ..GetMyOrders()
                        //       ..GetProfile()
                        //       ..getalladdress(context),
                        //     builder: (context, child) => HomeNavigation(),
                        //   ),
                        // );
                      },
                      child: Text("تخطي"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          // onTap: () => CustomRoute.RouteTo(
                          //     context,
                          //     ChangeNotifierProvider(
                          //       create: (context) => ObjectionController(),
                          //       builder: (context, child) => ObjectionPage(),
                          //     )),
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color(0xff722B23),
                                      Color(0xffE45545),
                                    ]),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/objection.svg',
                                  ),
                                  Gap(10),
                                  Text(
                                    maxLines: 1,
                                    "رفع اعتراض",
                                    style: style15semiboldwhite,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => CustomRoute.RouteTo(
                              context,
                              ChangeNotifierProvider(
                                create: (context) => RateController(),
                                builder: (context, child) => RatePage(),
                              )),
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color(0xff1B2A36),
                                      Color(0xff35536B),
                                    ]),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/rating.svg',
                                  ),
                                  Gap(10),
                                  Text(
                                    maxLines: 1,
                                    "تقييم المندوب",
                                    style: style15semiboldwhite,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
