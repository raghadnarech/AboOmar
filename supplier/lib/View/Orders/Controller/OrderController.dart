// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:provider/provider.dart';
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Services/CustomDialog.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/Services/Failure.dart';
import 'package:supplier/Services/NetworkClient.dart';
import 'package:http/http.dart' as http;
import 'package:supplier/Services/network_connection.dart';
import 'package:supplier/View/MainPage/Controller/MainPageController.dart';
import 'package:supplier/View/MainPage/MainPage.dart';
import 'package:supplier/View/Rate/Controller/RateController.dart';
import 'package:supplier/View/Rate/RatePage.dart';

class OrderController with ChangeNotifier {
  static NetworkClient client = NetworkClient(http.Client());
  Future<Either<Failure, bool>> ArrangeInvoice(
    BuildContext context,
    int id,
  ) async {
    EasyLoading.show();
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        http.Response response;
        response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.ArrangeInvoice(id),
        );
        log(response.body);
        if (response.statusCode == 200) {
          EasyLoading.dismiss();
          CustomDialog.Dialog(context, title: "تم تغيير حالة الطلب بنجاح");
          CustomRoute.RouteAndRemoveUntilTo(
            context,
            ChangeNotifierProvider<MainPageController>(
              create: (context) => MainPageController()
                ..GetMyInvoices()
                ..GetProfile()
                ..GetMainCategory(),
              builder: (context, child) => MainPage(),
            ),
          );
          return Right(true);
        } else if (response.statusCode == 404) {
          EasyLoading.dismiss();
          EasyLoading.showError(ResultFailure('').message);
          return Left(ResultFailure(''));
        } else {
          EasyLoading.dismiss();
          EasyLoading.showError(GlobalFailure().message);
          return Left(GlobalFailure());
        }
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError(ServerFailure().message);
        return Left(ServerFailure());
      }
    } catch (e) {
      log(e.toString());
      log("error in this fun");
      EasyLoading.dismiss();
      EasyLoading.showError(GlobalFailure().message);
      return Left(GlobalFailure());
    }
  }

  Future<Either<Failure, bool>> AccRejInvoice(
    BuildContext context,
    int id,
    String? status,
  ) async {
    EasyLoading.show();
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        http.Response response;
        response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.AccRejInvoice(id: id, status: status),
        );
        log(response.body);
        if (response.statusCode == 200) {
          EasyLoading.dismiss();
          CustomDialog.Dialog(context, title: "تم تغيير حالة الطلب بنجاح");
          CustomRoute.RouteAndRemoveUntilTo(
            context,
            ChangeNotifierProvider<MainPageController>(
              create: (context) => MainPageController()
                ..GetMyInvoices()
                ..GetProfile()
                ..GetMainCategory(),
              builder: (context, child) => MainPage(),
            ),
          );
          return Right(true);
        } else if (response.statusCode == 404) {
          EasyLoading.dismiss();
          EasyLoading.showError(ResultFailure('').message);
          return Left(ResultFailure(''));
        } else {
          EasyLoading.dismiss();
          EasyLoading.showError(GlobalFailure().message);
          return Left(GlobalFailure());
        }
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError(ServerFailure().message);
        return Left(ServerFailure());
      }
    } catch (e) {
      log(e.toString());
      log("error in this fun");
      EasyLoading.dismiss();
      EasyLoading.showError(GlobalFailure().message);
      return Left(GlobalFailure());
    }
  }

  Future<Either<Failure, bool>> FinishInvoice(
    BuildContext context,
    int id,
  ) async {
    EasyLoading.show();
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        http.Response response;
        response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.FinishInvoice(id),
        );
        log(response.body);
        if (response.statusCode == 200) {
          EasyLoading.dismiss();
          CustomDialog.Dialog(context, title: "تم تغيير حالة الطلب بنجاح");
          CustomRoute.RouteAndRemoveUntilTo(
              context,
              ChangeNotifierProvider<RateController>(
                create: (context) => RateController(),
                builder: (context, child) => RatePage(),
              ));
          return Right(true);
        } else if (response.statusCode == 404) {
          EasyLoading.dismiss();
          EasyLoading.showError(ResultFailure('').message);
          return Left(ResultFailure(''));
        } else {
          EasyLoading.dismiss();
          EasyLoading.showError(GlobalFailure().message);
          return Left(GlobalFailure());
        }
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError(ServerFailure().message);
        return Left(ServerFailure());
      }
    } catch (e) {
      log(e.toString());
      log("error in this fun");
      EasyLoading.dismiss();
      EasyLoading.showError(GlobalFailure().message);
      return Left(GlobalFailure());
    }
  }

  Future<Either<Failure, bool>> CancelInvoice(
    BuildContext context,
    int id,
  ) async {
    EasyLoading.show();
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        http.Response response;
        response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.CancelInvoice(id),
        );
        log(response.body);
        if (response.statusCode == 200) {
          EasyLoading.dismiss();
          CustomDialog.Dialog(context, title: "تم تغيير حالة الطلب بنجاح");
          CustomRoute.RouteAndRemoveUntilTo(
            context,
            ChangeNotifierProvider<MainPageController>(
              create: (context) => MainPageController()
                ..GetMyInvoices()
                ..GetProfile()
                ..GetMainCategory(),
              builder: (context, child) => MainPage(),
            ),
          );
          return Right(true);
        } else if (response.statusCode == 404) {
          EasyLoading.dismiss();
          EasyLoading.showError(ResultFailure('').message);
          return Left(ResultFailure(''));
        } else {
          EasyLoading.dismiss();
          EasyLoading.showError(GlobalFailure().message);
          return Left(GlobalFailure());
        }
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError(ServerFailure().message);
        return Left(ServerFailure());
      }
    } catch (e) {
      log(e.toString());
      log("error in this fun");
      EasyLoading.dismiss();
      EasyLoading.showError(GlobalFailure().message);
      return Left(GlobalFailure());
    }
  }
}
