// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gaz_mandob/Constant/colors.dart';
import 'package:gaz_mandob/Constant/url.dart';
import 'package:gaz_mandob/Model/Profile.dart';
import 'package:gaz_mandob/Services/Failure.dart';
import 'package:gaz_mandob/Services/NetworkClient.dart';
import 'package:gaz_mandob/Services/Responsive.dart';
import 'package:gaz_mandob/Services/Routes.dart';
import 'package:gaz_mandob/Services/network_connection.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ProfileController with ChangeNotifier {
  static NetworkClient client = NetworkClient(http.Client());
  Profile profile = Profile();
  bool isloadingprofile = false;
  Future<Either<Failure, bool>> GetProfile() async {
    isloadingprofile = true;
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
          isloadingprofile = false;
          notifyListeners();
          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
          isloadingprofile = false;

          notifyListeners();
          return Left(ResultFailure(res['message']));
        } else {
          isloadingprofile = false;

          notifyListeners();
          return Left(GlobalFailure());
        }
      } else {
        isloadingprofile = false;

        notifyListeners();
        return Left(ServerFailure());
      }
    } catch (e) {
      isloadingprofile = false;

      notifyListeners();
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }

  bool mybank = true;
  bool anotherbank = false;

  var amountcontroller = TextEditingController();
  var plus500controller = TextEditingController();
  changeaddtrasaction(String? amount) {
    amountcontroller.text = amount!;
  }

  Future<Either<Failure, bool>> AddTransaction(BuildContext context) async {
    EasyLoading.show();
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final request = await client.requestimage(
          path: AppApi.WalletTransaction,
          body: {
            "amount":
                amountcontroller.text == '+500'
                    ? plus500controller.text
                    : amountcontroller.text,
            "status": 'add',
          },
          image: await http.MultipartFile.fromPath(
            'image',
            imagenotif.value!.path,
          ),
        );
        var response = await request.send();

        log(response.statusCode.toString());
        response.stream.bytesToString().then((value) {
          log(value.toString());
        });
        if (response.statusCode == 200) {
          EasyLoading.dismiss();
          CustomRoute.RoutePop(context);
          removeimagenotif();
          GetProfile();
          amountcontroller.clear();
          otherbank.clear();
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

  TextEditingController otherbank = TextEditingController();
  Future<Either<Failure, bool>> WithdrawTransaction(
    BuildContext context,
  ) async {
    EasyLoading.show();
    log(amountcontroller.text);
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final request = await client.request(
          requestType: RequestType.POST,
          path: AppApi.WalletTransaction,
          body:
              anotherbank
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
          showDialog(
            barrierDismissible: false,
            barrierLabel: '',
            context: context,
            barrierColor: Colors.transparent,
            builder:
                (context) => StatefulBuilder(
                  builder:
                      (context, setState) => BackdropFilter(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "طلب سحب رصيد",
                                        style: TextStyle(
                                          color: kFourthColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Gap(10),
                                      Text(
                                        "تمت عملية سحب الرصيد بنجاح",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Gap(20),
                                      Center(
                                        child: SvgPicture.asset(
                                          'assets/svg/ok.svg',
                                          width:
                                              Responsive.getWidth(context) * .7,
                                        ),
                                      ),
                                      Gap(20),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                ),
          );
          GetProfile();
          amountcontroller.clear();
          otherbank.clear();
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

  removeimagenotif() {
    imagenotif.value = null;
    notifyListeners();
  }

  ValueNotifier<File?> imagenotif = ValueNotifier<File?>(null);
  ImagePicker picker = ImagePicker();
  Future pickimage(ImageSource source, BuildContext context) async {
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      imagenotif.value = img;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,

      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: kPrimaryColor,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
          ],
          toolbarWidgetColor: kBaseColor,
          initAspectRatio: CropAspectRatioPreset.original,
          activeControlsWidgetColor: kPrimaryColor,
          backgroundColor: kBaseColor,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: 'Cropper'),
      ],
    );
    log('filePath');
    log(imageFile.toString());
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }
}
