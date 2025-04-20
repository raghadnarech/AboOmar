// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:supplier/Services/CustomDialog.dart';
import 'package:http/http.dart' as http;
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Services/Failure.dart';
import 'package:supplier/Services/NetworkClient.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/Services/network_connection.dart';
import 'package:provider/provider.dart';
import 'package:supplier/View/MainPage/Controller/MainPageController.dart';
import 'package:supplier/View/MainPage/MainPage.dart';

class RateController with ChangeNotifier {
  NetworkClient client = NetworkClient(http.Client());
  var comment = TextEditingController();
  int? reciver_id;
  double? stars;

  Future<Either<Failure, bool>> Rate(BuildContext context) async {
    EasyLoading.show();
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.POST,
          path: AppApi.Rate,
          body: {
            "stars": stars.toString(),
            "comment": comment.text,
            "reciver_id": 2.toString(),
          },
        );

        log(response.statusCode.toString());
        log(response.body.toString());
        if (response.statusCode == 200) {
          EasyLoading.dismiss();

          CustomRoute.RouteAndRemoveUntilTo(
            context,
            ChangeNotifierProvider(
              lazy: true,
              create: (context) => MainPageController()
                ..GetMainCategory()
                ..GetMyInvoices()
                ..GetProfile(),
              builder: (context, child) => MainPage(),
            ),
          );
          CustomDialog.Dialog(context, title: "تم إضافة التقييم بنجاح");
          notifyListeners();
          return Right(true);
        } else if (response.statusCode == 404) {
          notifyListeners();
          EasyLoading.dismiss();

          return Left(ResultFailure(''));
        } else {
          EasyLoading.dismiss();

          notifyListeners();
          return Left(GlobalFailure());
        }
      } else {
        notifyListeners();
        EasyLoading.dismiss();

        return Left(ServerFailure());
      }
    } catch (e) {
      EasyLoading.dismiss();

      notifyListeners();
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }
}
