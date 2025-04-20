// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gaz_mandob/Constant/url.dart';
import 'package:gaz_mandob/Controller/ServicesProvider.dart';
import 'package:gaz_mandob/Model/User.dart';
import 'package:gaz_mandob/Services/Failure.dart';
import 'package:gaz_mandob/Services/NetworkClient.dart';
import 'package:gaz_mandob/Services/Routes.dart';
import 'package:gaz_mandob/Services/network_connection.dart';
import 'package:gaz_mandob/View/Auth/Signup/Controller/SignupController.dart';
import 'package:gaz_mandob/View/Auth/Signup/View/Signup.dart';
import 'package:gaz_mandob/View/Orders/Controller/OrderController.dart';
import 'package:gaz_mandob/View/Orders/OrdersPage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoginController with ChangeNotifier {
  static NetworkClient client = NetworkClient(http.Client());
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  void dispose() {
    phonecontroller.clear();
    passwordcontroller.clear();

    log("close login");
    super.dispose();
  }

  Future<Either<Failure, bool>> Login(BuildContext context) async {
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        // FirebaseMessaging messaging = FirebaseMessaging.instance;

        // String? token = await messaging.getToken();
        // print(token);
        final response = await client
            .request(requestType: RequestType.POST, path: AppApi.LOGIN, body: {
          "phone": phonecontroller.text,
          "password": passwordcontroller.text,
        });
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          if (res['role'] == 'mandob') {
            var user = User.fromJson(res);
            ServicesProvider.saveuser(user);
            CustomRoute.RouteReplacementTo(
                context,
                ChangeNotifierProvider(
                  create: (context) => OrderController()
                    ..GetMyOrders()
                    ..GetMyCancelOrders()
                    ..GetStatus(),
                  lazy: true,
                  builder: (context, child) => OrdersPage(),
                ));
          } else {
            return Left(ResultFailure('لا يمكن تسجيل الدخول بهذا الحساب'));
          }

          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
          return Left(ResultFailure(res['message']));
        } else {
          return Left(GlobalFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }

  toSignUpPage(BuildContext context) {
    CustomRoute.RouteReplacementTo(
      context,
      ChangeNotifierProvider(
        create: (context) => SignupController()..oninit(),
        lazy: true,
        builder: (context, child) => Signup(),
      ),
    );
  }
}
