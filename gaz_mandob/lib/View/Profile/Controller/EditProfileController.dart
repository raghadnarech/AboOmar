// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gaz_mandob/Constant/colors.dart';
import 'package:gaz_mandob/Constant/url.dart';
import 'package:gaz_mandob/Model/Profile.dart';
import 'package:gaz_mandob/Services/CustomDialog.dart';
import 'package:gaz_mandob/Services/Failure.dart';
import 'package:gaz_mandob/Services/NetworkClient.dart';
import 'package:gaz_mandob/Services/Routes.dart';
import 'package:gaz_mandob/Services/network_connection.dart';
import 'package:gaz_mandob/View/Orders/Controller/OrderController.dart';
import 'package:gaz_mandob/View/Orders/OrdersPage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class EditProfileController with ChangeNotifier {
  Profile? profile;
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController bankidcontroller = TextEditingController();
  TextEditingController banknamecontroller = TextEditingController();
  oninit(Profile profile) {
    this.profile = profile;
    usernamecontroller.text = profile.userName!;
    emailcontroller.text = profile.email!;
    phonecontroller.text = profile.phone!;
    bankidcontroller.text = profile.bankNum!;
    banknamecontroller.text = profile.bankName!;
  }

  static NetworkClient client = NetworkClient(http.Client());

  Future<Either<Failure, bool>> UpdateProfile(BuildContext context) async {
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        http.MultipartRequest request;
        if (logo == null) {
          request = await client.requestwithoutimage(
            path: AppApi.UpdateProfile,
            body: {
              "user_name": usernamecontroller.text,
              "email": emailcontroller.text,
              "phone": phonecontroller.text,
              "bank_num": bankidcontroller.text,
              "bank_name": banknamecontroller.text,
            },
          );
        } else {
          final multipartFile = await http.MultipartFile.fromPath(
            'logo',
            logo!.path,
          );
          request = await client.requestimage(
            path: AppApi.UpdateProfile,
            body: {
              "user_name": usernamecontroller.text,
              "email": emailcontroller.text,
              "phone": phonecontroller.text,
              "bank_num": bankidcontroller.text,
              "bank_name": banknamecontroller.text,
            },
            image: multipartFile,
          );
        }
        var response = await request.send();
        log(response.statusCode.toString());
        response.stream.bytesToString().then((value) {
          log(value.toString());
        });
        if (response.statusCode == 200) {
          CustomRoute.RouteAndRemoveUntilTo(
            context,
            ChangeNotifierProvider(
              create:
                  (context) =>
                      OrderController()
                        ..GetMyCancelOrders()
                        ..GetMyOrders(),
              builder: (context, child) => OrdersPage(),
            ),
          );
          CustomDialog.Dialog(context, title: "تم تعديل الملف الشخصي بنجاح");
          return Right(true);
        } else if (response.statusCode == 404) {
          return Left(ResultFailure(''));
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

  File? logo;
  ImagePicker picker = ImagePicker();

  SelectImage(BuildContext context) async {
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
                              },
                              child: Icon(Icons.close, color: kBaseThirdyColor),
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
                                  // mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        await pickimage(
                                          ImageSource.camera,
                                          context,
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset(
                                            height: 75,
                                            'assets/svg/camera.svg',
                                            colorFilter: const ColorFilter.mode(
                                              kPrimaryColor,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          Gap(10),
                                          Text("الكاميرا"),
                                        ],
                                      ),
                                    ),
                                    MaxGap(60),
                                    GestureDetector(
                                      onTap: () async {
                                        await pickimage(
                                          ImageSource.gallery,
                                          context,
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset(
                                            height: 75,
                                            'assets/svg/gallary.svg',
                                            colorFilter: const ColorFilter.mode(
                                              kPrimaryColor,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          Gap(10),
                                          Text("المعرض"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
  }

  removelogo() {
    logo = null;
    notifyListeners();
  }

  Future pickimage(ImageSource source, BuildContext context) async {
    try {
      final image = await picker.pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      logo = img;
      CustomRoute.RoutePop(context);
      notifyListeners();
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
    // croppedImage.printInfo();
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }
}
