import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Model/Product.dart';
import 'package:supplier/Services/Failure.dart';
import 'package:supplier/Services/NetworkClient.dart';
import 'package:http/http.dart' as http;
import 'package:supplier/Services/network_connection.dart';

class ProductPageController with ChangeNotifier {
  List<Product> listproduct = [];
  bool isloadinggetproduct = false;
  NetworkClient client = NetworkClient(http.Client());

  Future<Either<Failure, bool>> GetProduct(int id) async {
    isloadinggetproduct = true;
    listproduct.clear();
    notifyListeners();
    log("call this method");
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.GetProduct(id),
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          if (res['data'] != null) {
            for (var element in res['data']) {
              listproduct.add(Product.fromJson(element));
            }
          }
          log(listproduct.length.toString());
          isloadinggetproduct = false;
          notifyListeners();
          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
          isloadinggetproduct = false;
          notifyListeners();
          return Left(ResultFailure(res['message']));
        } else {
          isloadinggetproduct = false;
          notifyListeners();
          return Left(GlobalFailure());
        }
      } else {
        isloadinggetproduct = false;
        notifyListeners();
        return Left(ServerFailure());
      }
    } catch (e) {
      isloadinggetproduct = false;
      notifyListeners();
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }
}
