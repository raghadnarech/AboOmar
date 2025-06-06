import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Services/Failure.dart';
import 'package:supplier/Services/NetworkClient.dart';
import 'package:supplier/Services/network_connection.dart';
import 'package:http/http.dart' as http;

class GetInfoController with ChangeNotifier {
  String? PrivacyPolicy;
  String? AboutUs;
  bool isloadinggetinfo = false;
  NetworkClient client = NetworkClient(http.Client());

  Future<Either<Failure, bool>> GetInfo(BuildContext context) async {
    isloadinggetinfo = true;
    notifyListeners();
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.GetInfo,
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          PrivacyPolicy = res['privacy'];
          AboutUs = res['about_us'];
          isloadinggetinfo = false;
          notifyListeners();
          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
          isloadinggetinfo = false;
          notifyListeners();
          return Left(ResultFailure(res['message']));
        } else {
          isloadinggetinfo = false;
          notifyListeners();
          return Left(GlobalFailure());
        }
      } else {
        isloadinggetinfo = false;
        notifyListeners();
        return Left(ServerFailure());
      }
    } catch (e) {
      isloadinggetinfo = false;
      notifyListeners();
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }
}
