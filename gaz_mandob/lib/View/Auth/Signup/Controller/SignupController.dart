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
import 'package:gaz_mandob/Model/City.dart';
import 'package:gaz_mandob/Model/Country.dart';
import 'package:gaz_mandob/Model/District.dart';
import 'package:gaz_mandob/Model/Region.dart';
import 'package:gaz_mandob/Services/CustomDialog.dart';
import 'package:gaz_mandob/Services/Failure.dart';
import 'package:gaz_mandob/Services/NetworkClient.dart';
import 'package:gaz_mandob/Services/Routes.dart';
import 'package:gaz_mandob/Services/network_connection.dart';
import 'package:gaz_mandob/View/Auth/Login/Controller/LoginController.dart';
import 'package:gaz_mandob/View/Auth/Login/View/Login.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SignupController with ChangeNotifier {
  oninit() {
    GetAllRegions();
    GetCountry();
  }

  // final MultiSelectController multiSelectController = MultiSelectController();
  @override
  void dispose() {
    personal_image = null;
    car_image_front = null;
    car_image_back = null;
    licence_image = null;
    car_licence = null;
    id_image = null;
    usernamecontroller.clear();
    emailcontroller.clear();
    phonecontroller.clear();
    passwordcontroller.clear();
    confirmpasswordcontroller.clear();
    bankidcontroller.clear();
    banknamecontroller.clear();
    log("close signup");
    super.dispose();
  }

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController bankidcontroller = TextEditingController();
  TextEditingController banknamecontroller = TextEditingController();
  File? personal_image;
  File? car_image_front;
  File? car_image_back;
  File? licence_image;
  File? car_licence;
  File? id_image;

  ImagePicker picker = ImagePicker();
  static NetworkClient client = NetworkClient(http.Client());
  Country? state = Country(id: 0, name: "");
  bool isloadingcountry = true;
  List<Country> countries = [];
  Future<Either<Failure, bool>> GetCountry() async {
    isloadingcountry = true;
    notifyListeners();
    countries.clear();
    log("call this method");
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.GetCountry,
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          for (var element in res) {
            countries.add(Country.fromJson(element));
            log(element.toString());
          }
          state = countries[0];
          isloadingcountry = false;
          notifyListeners();
          log(res.toString());
          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
          isloadingcountry = false;
          notifyListeners();
          return Left(ResultFailure(res['message']));
        } else {
          isloadingcountry = false;
          notifyListeners();
          return Left(GlobalFailure());
        }
      } else {
        isloadingcountry = false;
        notifyListeners();
        return Left(ServerFailure());
      }
    } catch (e) {
      isloadingcountry = false;
      notifyListeners();
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }

  Region? region;
  City? city;
  District? district;
  List<Region> listregion = [];
  List<City> listcity = [];
  List<District> listdistrict = [];
  List<int> selecteddistricts = [];
  changeregion(Region value) async {
    region = value;
    listcity.clear();
    listdistrict.clear();
    city = null;
    district = null;
    GetAllCities();
    notifyListeners();
  }

  changecity(City value) async {
    listdistrict.clear();
    district = null;
    city = value;

    GetAllDistricts();
    notifyListeners();
  }

  changedistrict(District value) async {
    district = value;
    notifyListeners();
  }

  Future<Either<Failure, bool>> GetAllDistricts() async {
    listdistrict.clear();
    log("call this method");
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.GetAllDistricts(city!.cityId!),
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          for (var element in res) {
            listdistrict.add(District.fromJson(element));
            log(element.toString());
          }
          notifyListeners();
          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
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

  Future<Either<Failure, bool>> GetAllCities() async {
    listcity.clear();
    log("call this method");
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.GetAllCities(region!.regionId!),
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          for (var element in res) {
            listcity.add(City.fromJson(element));
            log(element.toString());
          }
          notifyListeners();
          // log(res.toString());
          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
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

  Future<Either<Failure, bool>> GetAllRegions() async {
    listregion.clear();
    log("call this method");
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.GetAllRegions,
        );
        log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          for (var element in res) {
            listregion.add(Region.fromJson(element));
            log(element.toString());
          }
          notifyListeners();
          log(res.toString());
          return Right(true);
        } else if (response.statusCode == 404) {
          var res = jsonDecode(response.body);
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

  Future<Either<Failure, bool>> Signup(BuildContext context) async {
    EasyLoading.show();

    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        if (personal_image == null ||
            car_image_front == null ||
            car_image_back == null ||
            licence_image == null ||
            car_licence == null ||
            id_image == null) {
          CustomDialog.Dialog(
            context,
            title: "يرجى إضافة جميع الصور قبل انشاء الحساب",
          );
          EasyLoading.dismiss();
          return Left(ResultFailure(''));
        }

        final uri = Uri.parse(AppApi.url + AppApi.Signup);
        final request =
            http.MultipartRequest('POST', uri)
              ..fields['user_name'] = usernamecontroller.text
              ..fields['email'] = emailcontroller.text
              ..fields['password'] = passwordcontroller.text
              ..fields['phone'] =
                  state!.name == "المملكة العربية السعودية"
                      ? "+966${phonecontroller.text}"
                      : "+971${phonecontroller.text}"
              ..fields['bank_num'] = bankidcontroller.text
              ..fields['bank_name'] = banknamecontroller.text
              ..fields['country_id'] = state!.id.toString()
              ..fields['role'] = 'mandob';
        request.headers.addAll({"Accept": "application/json"});
        // Add each district ID separately
        for (int i = 0; i < selecteddistricts.length; i++) {
          request.fields['distrect_id[$i]'] = selecteddistricts[i].toString();
        }

        // Add the images
        request.files.addAll([
          await http.MultipartFile.fromPath(
            'personal_image',
            personal_image!.path,
          ),
          await http.MultipartFile.fromPath(
            'car_image_front',
            car_image_front!.path,
          ),
          await http.MultipartFile.fromPath(
            'car_image_back',
            car_image_back!.path,
          ),
          await http.MultipartFile.fromPath(
            'licence_image',
            licence_image!.path,
          ),
          await http.MultipartFile.fromPath('car_licence', car_licence!.path),
          await http.MultipartFile.fromPath('id_image', id_image!.path),
        ]);
        log(request.fields.toString());
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);

        log(response.statusCode.toString());
        log(response.body.toString());

        if (response.statusCode == 200) {
          CustomRoute.RouteReplacementTo(
            context,
            ChangeNotifierProvider(
              create: (context) => LoginController(),
              lazy: true,
              builder: (context, child) => Login(),
            ),
          );
          EasyLoading.dismiss();
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
      EasyLoading.dismiss();
      EasyLoading.showError(GlobalFailure().message);
      log(e.toString());
      log("error in this fun");
      return Left(GlobalFailure());
    }
  }

  SelectImage(BuildContext context, String imageType) async {
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        await pickImage(
                                          imageType,
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
                                        await pickImage(
                                          imageType,
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

  void removeImage(String imageType) {
    switch (imageType) {
      case 'personal':
        personal_image = null;
        break;
      case 'car_front':
        car_image_front = null;
        break;
      case 'car_back':
        car_image_back = null;
        break;
      case 'licence':
        licence_image = null;
        break;
      case 'car_licence':
        car_licence = null;
        break;
      case 'id':
        id_image = null;
        break;
      default:
        return;
    }
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

  Future pickImage(
    String imageType,
    ImageSource source,
    BuildContext context,
  ) async {
    try {
      final image = await picker.pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      switch (imageType) {
        case 'personal':
          personal_image = img;
          break;
        case 'car_front':
          car_image_front = img;
          break;
        case 'car_back':
          car_image_back = img;
          break;
        case 'licence':
          licence_image = img;
          break;
        case 'car_licence':
          car_licence = img;
          break;
        case 'id':
          id_image = img;
          break;
        default:
          return;
      }
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
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }
}
