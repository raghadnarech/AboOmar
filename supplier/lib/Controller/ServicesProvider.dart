// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supplier/Model/User.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/View/Auth/Login/Controller/LoginController.dart';
import 'package:supplier/View/Auth/Login/Login.dart';

class ServicesProvider with ChangeNotifier {
  static SharedPreferences? sharedPreferences;

  ServicesProvider();
  static User? user;
  bool is_online = false;
  static String gettoken() {
    Future.delayed(Duration.zero).then((value) async {
      sharedPreferences = await SharedPreferences.getInstance();
    });
    return sharedPreferences!.getString('token') ?? "";
  }

  static Future<void> saveuser(User user) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences!.setString('token', user.token!);
    sharedPreferences!.setBool('role', user.role!);
    sharedPreferences!.setBool('isLoggin', true);
  }

  static Future<void> logout(BuildContext context) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences!.remove('token');
    sharedPreferences!.remove('role');
    sharedPreferences!.remove('isLoggin');
    CustomRoute.RouteAndRemoveUntilTo(
      context,
      ChangeNotifierProvider(
        create: (context) => LoginController(),
        builder: (context, child) => Login(),
      ),
    );
  }

  static bool getrole() {
    Future.delayed(Duration.zero).then((value) async {
      sharedPreferences = await SharedPreferences.getInstance();
    });
    return sharedPreferences!.getBool('role') ?? false;
  }

  static Future<bool> isLoggin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences!.getBool('isLoggin') ?? false;
  }

  static Future<void> setlocale(String? locale) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences!.setString('lang', locale ?? "ar");
  }

  static Future<String> getlocale() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences!.getString('lang') ?? "ar";
  }

  Future<SharedPreferences> sharedprefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences!;
  }
}
