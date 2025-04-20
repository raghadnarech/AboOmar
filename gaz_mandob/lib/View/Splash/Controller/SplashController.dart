// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gaz_mandob/Controller/ServicesProvider.dart';
import 'package:gaz_mandob/Services/Routes.dart';
import 'package:gaz_mandob/View/Auth/Signup/Controller/SignupController.dart';
import 'package:gaz_mandob/View/Auth/Signup/View/Signup.dart';
import 'package:gaz_mandob/View/Orders/Controller/OrderController.dart';
import 'package:gaz_mandob/View/Orders/OrdersPage.dart';
import 'package:provider/provider.dart';

class SplashController with ChangeNotifier {
  @override
  dispose() {
    log("close splash");
    super.dispose();
  }

  whenIslogin(BuildContext context) async {
    if (await ServicesProvider.isLoggin()) {
      toHomePage(context);
    } else {
      toAuthPage(context);
    }
  }

  toHomePage(BuildContext context) {
    CustomRoute.RouteAndRemoveUntilTo(
      context,
      ChangeNotifierProvider(
        create: (context) => OrderController()
          // ..GetMyCancelOrders()
          ..GetMyOrders()
          ..GetStatus(),
        builder: (context, child) => OrdersPage(),
      ),
    );
  }

  toAuthPage(BuildContext context) {
    CustomRoute.RouteReplacementTo(
      context,
      ChangeNotifierProvider(
        create: (context) => SignupController()..oninit(),
        lazy: true,
        child: Signup(),
      ),
    );
  }
}
