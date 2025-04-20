import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Model/Product.dart';
import 'package:supplier/Model/SubCategory.dart';
import 'package:supplier/Services/Failure.dart';
import 'package:supplier/Services/NetworkClient.dart';
import 'package:http/http.dart' as http;
import 'package:supplier/Services/network_connection.dart';

class SubCategoreyController with ChangeNotifier {
  List<SubCategory> listsubcategory = [];
  List<Product> listproduct = [];
  bool isloadinggetsubcaegory = false;
  NetworkClient client = NetworkClient(http.Client());

  Future<Either<Failure, bool>> GetSubCategory(int id) async {
    isloadinggetsubcaegory = true;
    listsubcategory.clear();
    listproduct.clear();
    notifyListeners();
    log("call this method");
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.GetSubCategory(id),
        );
        log(response.statusCode.toString());
        log(response.body.toString());
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          if (res.containsKey('prod')) {
            if (res['prod'] != []) {
              for (var element in res['prod']) {
                listproduct.add(Product.fromJson(element));
              }
              log(listproduct.length.toString());
            }
            if (res.containsKey('data')) {
              if (res['data'] != null) {
                for (var element in res['data']) {
                  listsubcategory.add(SubCategory.fromJson(element));
                }
              }
            }
          }
          log(listsubcategory.length.toString());
          log(listsubcategory.length.toString());
          isloadinggetsubcaegory = false;
          notifyListeners();
          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
          isloadinggetsubcaegory = false;
          notifyListeners();
          return Left(ResultFailure(res['message']));
        } else {
          isloadinggetsubcaegory = false;
          notifyListeners();
          return Left(GlobalFailure());
        }
      } else {
        isloadinggetsubcaegory = false;
        notifyListeners();
        return Left(ServerFailure());
      }
    } catch (e) {
      isloadinggetsubcaegory = false;
      notifyListeners();
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }
}
