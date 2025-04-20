// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Model/Category.dart';
import 'package:supplier/Model/Invoice.dart';
import 'package:supplier/Model/Profile.dart';
import 'package:supplier/Services/Failure.dart';
import 'package:supplier/Services/NetworkClient.dart';
import 'package:http/http.dart' as http;
import 'package:supplier/Services/network_connection.dart';

class MainPageController with ChangeNotifier {
  List<Category> listcategory = [];
  List<Invoice> listinvoice = [];
  Profile profile = Profile();

  bool isloadingmaincategory = false;
  NetworkClient client = NetworkClient(http.Client());
  Future<Either<Failure, bool>> GetProfile() async {
    notifyListeners();
    log("call this method");
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.GetProfile,
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          profile = Profile.fromJson(res[0]);
          notifyListeners();
          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
          notifyListeners();
          return Left(ResultFailure(res['message']));
        } else {
          notifyListeners();
          return Left(GlobalFailure());
        }
      } else {
        notifyListeners();
        return Left(ServerFailure());
      }
    } catch (e) {
      notifyListeners();
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }

  Future<Either<Failure, bool>> GetMainCategory() async {
    isloadingmaincategory = true;
    listcategory.clear();
    notifyListeners();
    log("call this method");
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.GetMainCategory,
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          if (res.containsKey('data')) {
            if (res['data'] != []) {
              for (var element in res['data']) {
                listcategory.add(Category.fromJson(element));
              }
            }
          }

          log(listcategory.length.toString());
          isloadingmaincategory = false;
          notifyListeners();
          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
          isloadingmaincategory = false;
          notifyListeners();
          return Left(ResultFailure(res['message']));
        } else {
          isloadingmaincategory = false;
          notifyListeners();
          return Left(GlobalFailure());
        }
      } else {
        isloadingmaincategory = false;
        notifyListeners();
        return Left(ServerFailure());
      }
    } catch (e) {
      isloadingmaincategory = false;
      notifyListeners();
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }

  bool isloadinggetmyinvoice = false;
  Future<Either<Failure, bool>> GetMyInvoices() async {
    listinvoice.clear();
    isloadinggetmyinvoice = true;
    notifyListeners();
    log("call this method");
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.GetMyInvoices,
        );

        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          for (var element in res['data']) {
            listinvoice.add(Invoice.fromJson(element));
          }

          log(listinvoice.length.toString());
          isloadinggetmyinvoice = false;
          notifyListeners();
          notifyListeners();
          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
          isloadinggetmyinvoice = false;
          notifyListeners();
          return Left(ResultFailure(res['message']));
        } else {
          isloadinggetmyinvoice = false;
          notifyListeners();
          return Left(GlobalFailure());
        }
      } else {
        isloadinggetmyinvoice = false;
        notifyListeners();
        return Left(ServerFailure());
      }
    } catch (e) {
      isloadinggetmyinvoice = false;
      notifyListeners();
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }
}
