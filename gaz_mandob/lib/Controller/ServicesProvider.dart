// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gaz_mandob/Model/User.dart';
import 'package:gaz_mandob/Services/Routes.dart';
import 'package:gaz_mandob/View/Auth/Login/Controller/LoginController.dart';
import 'package:gaz_mandob/View/Auth/Login/View/Login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // static Future<File> getgallery() async {
  //   image =
  //       await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

  //   return File(image!.path);
  // }

  // void clearimage() {
  //   image = null;
  //   notifyListeners();
  // }

  // Future<List<File>> getcamera() async {
  //   image = await picker.pickMultipleMedia();
  //   notifyListeners();
  //   return File(image!.path);
  // }

  // Future saveAndShare(Uint8List bytes) async {
  //   final time = DateTime.now()
  //       .toIso8601String()
  //       .replaceAll('.', '_')
  //       .replaceAll(':', '_');
  //   final name = 'ََQR_Code_$time';
  //   final directory = await getApplicationDocumentsDirectory();
  //   final image = File('${directory.path}/$name.png');
  //   image.writeAsBytesSync(bytes);
  // }

  // Future<Map> saveImage(Uint8List bytes) async {
  //   final time = DateTime.now()
  //       .toIso8601String()
  //       .replaceAll('.', '_')
  //       .replaceAll(':', '_');
  //   final name = 'QrCode_$time';

  //   final result =
  //       await ImageGallerySaver.saveImage(bytes, name: name, quality: 100);
  //   return result;
  // }
}
