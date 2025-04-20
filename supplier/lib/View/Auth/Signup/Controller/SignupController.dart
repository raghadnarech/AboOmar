// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:supplier/Constant/colors.dart';

import 'package:supplier/Services/Routes.dart';
import 'package:supplier/Services/NetworkClient.dart';
import 'package:supplier/View/Auth/Login/Controller/LoginController.dart';
import 'package:supplier/View/Auth/Login/Login.dart';

class SignupController with ChangeNotifier {
  @override
  void dispose() {
    logo = null;
    usernamecontroller.clear();
    emailcontroller.clear();
    phonecontroller.clear();
    passwordcontroller.clear();
    confirmpasswordcontroller.clear();
    bankidcontroller.clear();
    // banknamecontroller.clear();
    log("close signup");
    super.dispose();
  }

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController bankidcontroller = TextEditingController();
  // TextEditingController banknamecontroller = TextEditingController();

  List<XFile> images = [];
  File? logo;

  ImagePicker picker = ImagePicker();
  static NetworkClient client = NetworkClient(http.Client());

  // toChooseService(BuildContext context) {
  //   CustomRoute.RouteTo(
  //       context,
  //       ChangeNotifierProvider(
  //           create: (context) => ChooseServicesController()..onInit(),
  //           child: ChooseService()));
  // }

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
                          // mainAxisSize: MainAxisSize.min,
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
    logo = null;
    notifyListeners();
  }

  removeimageformlist(XFile image) {
    images.remove(image);
    notifyListeners();
  }

  toLoginPage(BuildContext context) {
    CustomRoute.RouteReplacementTo(
      context,
      ChangeNotifierProvider(
        create: (context) => LoginController(),
        lazy: true,
        builder: (context, child) => Login(),
      ),
    );
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

  Future pickMultiimage(BuildContext context) async {
    try {
      images = await picker.pickMultiImage();
      // if (image == null) return;
      // File? img = File(image.path);
      // img = await _cropImage(imageFile: img);
      // logo = img;
      // CustomRoute.RoutePop(context);
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
