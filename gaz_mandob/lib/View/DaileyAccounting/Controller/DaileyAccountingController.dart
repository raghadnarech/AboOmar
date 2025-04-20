// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:gaz_mandob/Constant/url.dart';
import 'package:gaz_mandob/Model/DaileyAccounts.dart';
import 'package:gaz_mandob/Services/Failure.dart';
import 'package:gaz_mandob/Services/NetworkClient.dart';
import 'package:http/http.dart' as http;
import 'package:gaz_mandob/Services/network_connection.dart';

class DaileyAccountingController with ChangeNotifier {
  static NetworkClient client = NetworkClient(http.Client());
  DailyAccounts dailyAccounts = DailyAccounts();
  bool isloadingGetDaileyOrders = false;
  Future<Either<Failure, bool>> GetDaileyOrders(
    BuildContext context,
  ) async {
    // EasyLoading.show();
    isloadingGetDaileyOrders = true;
    notifyListeners();
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        http.Response response;
        response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.GetDailyOrdersMandob,
        );
        log(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);

          dailyAccounts = DailyAccounts.fromJson(res);
          isloadingGetDaileyOrders = false;
          notifyListeners();

          return Right(true);
        } else if (response.statusCode == 404) {
          isloadingGetDaileyOrders = false;
          notifyListeners();

          return Left(ResultFailure(''));
        } else {
          isloadingGetDaileyOrders = false;
          notifyListeners();

          return Left(GlobalFailure());
        }
      } else {
        isloadingGetDaileyOrders = false;
        notifyListeners();

        return Left(ServerFailure());
      }
    } catch (e) {
      log(e.toString());
      log("error in this fun");
      isloadingGetDaileyOrders = false;
      notifyListeners();

      return Left(GlobalFailure());
    }
  }
}
