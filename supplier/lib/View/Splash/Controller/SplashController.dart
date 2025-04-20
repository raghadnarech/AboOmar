// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:supplier/Controller/ServicesProvider.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/View/Auth/Signup/Controller/SignupController.dart';
import 'package:supplier/View/Auth/Signup/Signup.dart';
import 'package:supplier/View/MainPage/MainPage.dart';
import 'package:supplier/View/MainPage/Controller/MainPageController.dart';

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
    CustomRoute.RouteReplacementTo(
      context,
      // ChangeNotifierProvider(
      //   create: (context) => SignupController(),
      //   lazy: true,
      // child:
      ChangeNotifierProvider(
        create: (context) => MainPageController()
          ..GetMainCategory()
          ..GetMyInvoices()
          ..GetProfile(),
        lazy: false,
        builder: (context, child) => MainPage(),
      ),
      // // ),
    );
  }

  toAuthPage(BuildContext context) {
    CustomRoute.RouteReplacementTo(
      context,
      ChangeNotifierProvider(
        create: (context) => SignupController(),
        lazy: true,
        child: Signup(),
      ),
    );
  }
}
