// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Controller/ServicesProvider.dart';
import 'package:supplier/Model/Category.dart';
import 'package:supplier/Services/CustomDialog.dart';
import 'package:supplier/Services/Failure.dart';
import 'package:supplier/Services/NetworkClient.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:http/http.dart' as http;
import 'package:supplier/Services/network_connection.dart';
import 'package:supplier/View/MainPage/Controller/MainPageController.dart';
import 'package:supplier/View/MainPage/MainPage.dart';

class EditMainCategoryController with ChangeNotifier {
  TextEditingController namecontroller = TextEditingController();
  Category? category;
  initstate(Category category) {
    this.category = category;
    namecontroller.text = category.name!;
  }

  @override
  void dispose() {
    log("close sub main category page");
    super.dispose();
  }

  File? imagecat;
  ImagePicker picker = ImagePicker();

  NetworkClient client = NetworkClient(http.Client());
  Future<Either<Failure, bool>> EditMainCategory(
    BuildContext context,
  ) async {
    EasyLoading.show();
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        http.MultipartRequest request;
        if (imagecat == null) {
          request = await client.requestwithotimage(
            path: AppApi.UpdateCategory(category!.id!),
            body: {
              'name': namecontroller.text,
            },
          );
          request.headers.addAll({
            "Accept": "application/json",
            'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
          });
        } else {
          request = await client.requestimage(
            path: AppApi.UpdateCategory(category!.id!),
            body: {
              'name': namecontroller.text,
            },
            image: await http.MultipartFile.fromPath(
              'image',
              imagecat!.path,
            ),
          );
          request.headers.addAll({
            "Accept": "application/json",
            'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
          });
        }
        var response = await request.send();
        response.stream.bytesToString().then((value) async {
          log(value);
        });
        log(response.statusCode.toString());

        if (response.statusCode == 200) {
          EasyLoading.dismiss();
          CustomDialog.Dialog(context, title: "تم تعديل التصنيف الرئيسي بنجاح");

          CustomRoute.RouteAndRemoveUntilTo(
              context,
              ChangeNotifierProvider(
                create: (context) => MainPageController()
                  ..GetMainCategory()
                  ..GetMyInvoices()
                  ..GetProfile(),
                builder: (context, child) => MainPage(),
              ));

          return Right(true);
        } else if (response.statusCode == 404) {
          EasyLoading.dismiss();
          EasyLoading.showError(ResultFailure('').message);

          // var res = jsonDecode(response.body);
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

  Future<Either<Failure, bool>> DeleteMainCategory(
    BuildContext context,
    int id,
  ) async {
    EasyLoading.show();
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        http.Response response;
        response = await client.request(
            requestType: RequestType.GET, path: AppApi.DeleteCategory(id));
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          EasyLoading.dismiss();
          CustomDialog.Dialog(context, title: "تم حذف التصنيف الرئيسي بنجاح");
          CustomRoute.RouteAndRemoveUntilTo(
              context,
              ChangeNotifierProvider(
                create: (context) => MainPageController()
                  ..GetMainCategory()
                  ..GetMyInvoices()
                  ..GetProfile(),
                builder: (context, child) => MainPage(),
              ));

          return Right(true);
        } else if (response.statusCode == 404) {
          EasyLoading.dismiss();
          EasyLoading.showError(ResultFailure('').message);

          // var res = jsonDecode(response.body);
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
    imagecat = null;
    notifyListeners();
  }

  Future pickimage(ImageSource source, BuildContext context) async {
    try {
      final image = await picker.pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      imagecat = img;
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
