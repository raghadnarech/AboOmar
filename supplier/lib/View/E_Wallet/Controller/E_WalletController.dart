// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Model/Wallet.dart';
import 'package:supplier/Services/Failure.dart';
import 'package:supplier/Services/NetworkClient.dart';
import 'package:supplier/Services/Responsive.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/Services/network_connection.dart';
import 'package:http/http.dart' as http;

class E_WalletController with ChangeNotifier {
  WalletTrans walletTrans = WalletTrans();
  var amountcontroller = TextEditingController();
  NetworkClient client = NetworkClient(http.Client());
  bool mybank = true;
  bool anotherbank = false;
  TextEditingController otherbank = TextEditingController();

  Future<Either<Failure, bool>> WithdrawTransaction(
      BuildContext context) async {
    EasyLoading.show();
    log(amountcontroller.text);
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final request = await client.request(
          requestType: RequestType.POST,
          path: AppApi.WalletTransaction,
          body: anotherbank
              ? {
                  "amount": amountcontroller.text,
                  "bank": "other",
                  "bank_num": otherbank.text,
                  "status": 'withdraw',
                }
              : {
                  "amount": amountcontroller.text,
                  "bank": "own",
                  "status": 'withdraw',
                },
        );
        log(request.body.toString());
        log(request.statusCode.toString());

        if (request.statusCode == 200) {
          EasyLoading.dismiss();
          CustomRoute.RoutePop(context);
          amountcontroller.clear();
          otherbank.clear();
          showDialog(
            barrierDismissible: false,
            barrierLabel: '',
            context: context,
            barrierColor: Colors.transparent,
            builder: (context) => StatefulBuilder(
              builder: (context, setState) => BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Dialog(
                  insetPadding: EdgeInsets.all(15),
                  elevation: 10,
                  alignment: Alignment(0, -.4),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: GestureDetector(
                            onTap: () {
                              CustomRoute.RoutePop(context);
                              anotherbank = false;
                              mybank = false;
                            },
                            child: Icon(
                              Icons.close,
                              color: kBaseThirdyColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "طلب سحب رصيد",
                                style: TextStyle(
                                    color: kFourthColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              Gap(10),
                              Text(
                                "تمت عملية سحب الرصيد بنجاح",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              Gap(20),
                              Center(
                                child: SvgPicture.asset(
                                  'assets/svg/ok.svg',
                                  width: Responsive.getWidth(context) * .7,
                                ),
                              ),
                              Gap(20),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
          GetWallet();
          notifyListeners();
          return Right(true);
        } else if (request.statusCode == 404) {
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

  bool loadingwallet = false;
  Future<Either<Failure, bool>> GetWallet() async {
    loadingwallet = true;
    notifyListeners();
    log("call this method");
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.Wallet,
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          walletTrans = WalletTrans.fromJson(res[0]['wallet_trans']);
          loadingwallet = false;
          notifyListeners();
          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
          loadingwallet = false;
          notifyListeners();
          return Left(ResultFailure(res['message']));
        } else {
          loadingwallet = false;
          notifyListeners();
          notifyListeners();
          return Left(GlobalFailure());
        }
      } else {
        loadingwallet = false;
        notifyListeners();
        return Left(ServerFailure());
      }
    } catch (e) {
      loadingwallet = false;
      notifyListeners();
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }
}
