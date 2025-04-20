// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Controller/ServicesProvider.dart';
import 'package:supplier/Model/Category.dart';
import 'package:supplier/Model/SubCategory.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/Services/Failure.dart';
import 'package:supplier/Services/NetworkClient.dart';
import 'package:http/http.dart' as http;
import 'package:supplier/Services/network_connection.dart';
import 'package:supplier/View/Product/Controller/ProductPageController.dart';
import 'package:supplier/View/Product/ProductPage.dart';
import 'package:supplier/View/SubCategorey/Controller/SubCategoreyController.dart';
import 'package:supplier/View/SubCategorey/SubCategoreyPage.dart';

class AddProductController with ChangeNotifier {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController offertextcontroller = TextEditingController();
  TextEditingController offerkindcontroller = TextEditingController();
  TextEditingController offercostcontroller = TextEditingController();
  TextEditingController discountcodecontroller = TextEditingController();
  TextEditingController discountcodevaluecontroller = TextEditingController();
  TextEditingController time_tocontroller = TextEditingController();
  TextEditingController time_fromcontroller = TextEditingController();
  File? logoproduct;
  bool offerpro = false;
  bool normalpro = true;
  bool lumpsum = false;
  bool percent = true;

  chanetypenormalpro() {
    normalpro = true;
    offerpro = false;

    notifyListeners();
  }

  chanetypeofferpro() {
    normalpro = false;
    offerpro = true;
    offertextcontroller.clear();
    offerkindcontroller.clear();
    offercostcontroller.clear();
    notifyListeners();
  }

  chanetypeofferlumpsum() {
    lumpsum = true;
    percent = false;
    notifyListeners();
  }

  chanetypeofferpercent() {
    lumpsum = false;
    percent = true;
    notifyListeners();
  }

  showDialogTimeFrom(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(DateTime.now().year + 10))
        .then(
      (value) {
        time_fromcontroller.text = DateFormat('yyyy-MM-dd').format(value!);
      },
    );
  }

  showDialogTimeTo(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(DateTime.now().year + 10))
        .then(
      (value) {
        time_tocontroller.text = DateFormat('yyyy-MM-dd').format(value!);
      },
    );
  }

  ImagePicker picker = ImagePicker();
  static NetworkClient client = NetworkClient(http.Client());

  @override
  void dispose() {
    logoproduct = null;
    namecontroller.clear();
    pricecontroller.clear();
    offertextcontroller.clear();
    offerkindcontroller.clear();
    offercostcontroller.clear();
    discountcodecontroller.clear();
    time_tocontroller.clear();
    time_fromcontroller.clear();
    // banknamecontroller.clear();
    log("close add product controller");
    super.dispose();
  }

  Future<Either<Failure, bool>> AddProduct(
    BuildContext context,
    int? subcatid,
    Category? category,
    SubCategory? subCategory,
  ) async {
    try {
      final connected = await NetworkConnection.isConnected();
      //  request;
      http.MultipartRequest request;
      if (connected) {
        if (logoproduct == null) {
          request = await client.requestwithotimage(
            path: AppApi.AddProduct,
            body: {
              "sub_category_id": subcatid.toString(),
              "isOffer": offerpro ? "1" : "0",
              "isActive": 1.toString(),
              "name": namecontroller.text,
              "price": pricecontroller.text,
              "discount_code": discountcodecontroller.text,
              "code_value": discountcodevaluecontroller.text,
              "time_from": time_fromcontroller.text,
              "time_to": time_tocontroller.text,
              "offer_text": offertextcontroller.text,
              "offer_value_kind": percent ? "1" : "0",
              "offer_value": offercostcontroller.text,
              "offer_status": "1",
            },
          );
          request.headers.addAll({
            "Accept": "application/json",
            'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
          });
        } else {
          request = await client.requestimage(
              path: AppApi.AddProduct,
              body: {
                "sub_category_id": subcatid.toString(),
                "isOffer": offerpro ? "1" : "0",
                "isActive": 1.toString(),
                "name": namecontroller.text,
                "price": pricecontroller.text,
                "discount_code": discountcodecontroller.text,
                "time_from": time_fromcontroller.text,
                "time_to": time_tocontroller.text,
                "offer_text": offertextcontroller.text,
                "offer_value_kind": percent ? "1" : "0",
                "offer_value": offercostcontroller.text,
                "offer_status": "1",
              },
              image: await http.MultipartFile.fromPath(
                'image',
                logoproduct!.path,
              ));
          request.headers.addAll({
            "Accept": "application/json",
            'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
          });
        }

        var response = await request.send();
        String? body_response;

        response.stream.bytesToString().then((value) async {
          log(value);
          body_response = value;
        });
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          // var res = jsonDecode(body_response!);
          CustomRoute.RouteReplacementTo(
              context,
              ChangeNotifierProvider(
                create: (context) =>
                    ProductPageController()..GetProduct(subcatid!),
                builder: (context, child) => ProductPage(
                  category: category,
                  subCategory: subCategory,
                ),
              ));

          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(body_response!);
          return Left(ResultFailure(res['message']));
        } else {
          return Left(GlobalFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }

  Future<Either<Failure, bool>> AddProductFromMainCat(
    BuildContext context,
    Category? category,
  ) async {
    try {
      final connected = await NetworkConnection.isConnected();
      //  request;
      if (connected) {
        final request = await client.requestimage(
            path: AppApi.AddProduct,
            body: {
              "category_id": category!.id.toString(),
              "isOffer": offerpro ? "1" : "0",
              "isActive": 1.toString(),
              "name": namecontroller.text,
              "price": pricecontroller.text,
              "discount_code": discountcodecontroller.text,
              "time_from": time_fromcontroller.text,
              "time_to": time_tocontroller.text,
              "offer_text": offertextcontroller.text,
              "offer_value_kind": percent ? "1" : "0",
              "offer_value": offercostcontroller.text,
              "offer_status": "1",
            },
            image: await http.MultipartFile.fromPath(
              'image',
              logoproduct!.path,
            ));
        request.headers.addAll({
          "Accept": "application/json",
          'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
        });

        var response = await request.send();
        String? body_response;

        response.stream.bytesToString().then((value) async {
          log(value);
          body_response = value;
        });
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          // var res = jsonDecode(body_response!);
          CustomRoute.RouteReplacementTo(
              context,
              ChangeNotifierProvider<SubCategoreyController>(
                create: (context) =>
                    SubCategoreyController()..GetSubCategory(category.id!),
                lazy: true,
                builder: (context, child) => SubCategoreyPage(
                  category: category,
                ),
              ));

          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(body_response!);
          return Left(ResultFailure(res['message']));
        } else {
          return Left(GlobalFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }

  SelectImage(BuildContext context) async {
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("من أين تريد اختيار الصورة"),
                        Gap(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await pickimage(ImageSource.camera, context);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    height: 75,
                                    'assets/svg/camera.svg',
                                    colorFilter: const ColorFilter.mode(
                                        kPrimaryColor, BlendMode.srcIn),
                                  ),
                                  Gap(10),
                                  Text("الكاميرا")
                                ],
                              ),
                            ),
                            MaxGap(60),
                            GestureDetector(
                              onTap: () async {
                                await pickimage(ImageSource.gallery, context);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                      height: 75,
                                      'assets/svg/gallary.svg',
                                      colorFilter: const ColorFilter.mode(
                                          kPrimaryColor, BlendMode.srcIn)),
                                  Gap(10),
                                  Text("المعرض")
                                ],
                              ),
                            )
                          ],
                        ),
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
  }

  removelogo() {
    logoproduct = null;
    notifyListeners();
  }

  Future pickimage(ImageSource source, BuildContext context) async {
    try {
      final image = await picker.pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      logoproduct = img;
      CustomRoute.RoutePop(context);
      notifyListeners();
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: kPrimaryColor,
            toolbarWidgetColor: kBaseColor,
            initAspectRatio: CropAspectRatioPreset.original,
            activeControlsWidgetColor: kPrimaryColor,
            backgroundColor: kBaseColor,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    log('filePath');
    log(imageFile.toString());
    // croppedImage.printInfo();
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }
}
