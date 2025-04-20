import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Controller/ServicesProvider.dart';
import 'package:supplier/Model/User.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/Services/Failure.dart';
import 'package:supplier/Services/NetworkClient.dart';
import 'package:supplier/Services/network_connection.dart';
import 'package:supplier/View/Auth/Signup/Controller/SignupController.dart';
import 'package:supplier/View/Auth/Signup/Signup.dart';

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
        final response = await client.request(
          requestType: RequestType.POST,
          path: AppApi.LOGIN,
          body: {
            "phone": phonecontroller.text,
            "password": passwordcontroller.text,
          },
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          // CustomRoute.RouteReplacementTo(context, HomePage());
          var res = jsonDecode(response.body);
          if (res['role'] == 'supplier') {
            var user = User.fromJson(res);
            ServicesProvider.saveuser(user);
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
        create: (context) => SignupController(),
        lazy: true,
        builder: (context, child) => Signup(),
      ),
    );
  }
}
