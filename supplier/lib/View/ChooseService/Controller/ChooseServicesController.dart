// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Controller/ServicesProvider.dart';
import 'package:supplier/Model/City.dart';
import 'package:supplier/Model/District.dart';
import 'package:supplier/Model/Region.dart';
import 'package:supplier/Model/Service.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/Services/Failure.dart';
import 'package:supplier/Services/NetworkClient.dart';
import 'package:supplier/Services/network_connection.dart';
import 'package:http/http.dart' as http;
import 'package:supplier/View/Auth/Login/Controller/LoginController.dart';
import 'package:supplier/View/Auth/Login/Login.dart';

class ChooseServicesController with ChangeNotifier {
  String? usernamecontroller;
  String? emailcontroller;
  String? phonecontroller;
  String? passwordcontroller;
  String? bankidcontroller;

  List<XFile>? images;
  File? logo;
  onInit({
    String? usernamecontroller,
    String? emailcontroller,
    String? phonecontroller,
    String? passwordcontroller,
    String? bankidcontroller,
    List<XFile>? images,
    File? logo,
  }) async {
    log("object");
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    long = position.longitude;
    notifyListeners();
    this.bankidcontroller = usernamecontroller;
    this.emailcontroller = emailcontroller;
    this.images = images;
    this.logo = logo;
    this.passwordcontroller = phonecontroller;
    this.phonecontroller = passwordcontroller;
    this.usernamecontroller = bankidcontroller;
    // GetAllServices();
  }

  void onCameraIdle() async {
    log('asd');
    await GetLocation(lat!, long!);
  }

  TextEditingController areacontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  Future<void> GetLocation(double latitude, double longitude) async {
    String host = 'https://maps.google.com/maps/api/geocode/json';
    final url =
        '$host?key=AIzaSyDV1sXfYPXvmxZi3KvRogf_gxMl2Lgcxx8&language=en&latlng=$latitude,$longitude';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      if (data['status'] == 'OK') {
        final results = data['results'];
        if (results.isNotEmpty) {
          final addressComponents = results[0]['address_components'];
          for (final component in addressComponents) {
            final types = component['types'];
            if (types.contains('locality')) {
              citycontroller.text = component['long_name'].toString();
            } else if (types.contains('administrative_area_level_1')) {
              areacontroller.text = component['long_name'].toString();
            } else if (types.contains('sublocality_level_1')) {
              countrycontroller.text = component['long_name'].toString();
            }
          }
        }
      }
    }
  }

  int? service_id;
  changevalue(int value) {
    service_id = value;
    log(service_id.toString());
    notifyListeners();
  }

  Region? region;
  City? city;
  District? district;
  changeregion(Region value) async {
    region = value;
    GetLocationFromAddress(region!.nameAr!);
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

  double? lat = 0;
  double? long = 0;
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  GoogleMapController? gmcontroller;
  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(0, 0),
    zoom: 14.4746,
  );

  changelatlong(CameraPosition position) {
    lat = position.target.latitude;
    long = position.target.longitude;
    citycontroller.text = '';
    areacontroller.text = '';
    countrycontroller.text = '';
  }

  Set<Polygon> polygons = {};
  Future<void> GetLocationFromAddress(String address) async {
    List<Location> locations = await locationFromAddress(address);
    lat = locations[0].latitude;
    long = locations[0].longitude;
    log(locations[0].toString());
    log(locations[0].latitude.toString());
    log(locations[0].longitude.toString());

    gmcontroller!
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat!, long!), 8));
    notifyListeners();
  }

  static NetworkClient client = NetworkClient(http.Client());
  List<Services> listservice = [];
  List<Region> listregion = [];
  List<City> listcity = [];
  List<District> listdistrict = [];
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

  Future<Either<Failure, bool>> GetAllServices() async {
    log("call this method");
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        final response = await client.request(
          requestType: RequestType.GET,
          path: AppApi.GetAllServices,
        );
        // log(response.body);
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          for (var element in res['data']) {
            listservice.add(Services.fromJson(element));
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

  Future<Either<Failure, bool>> Signup(
    BuildContext context,
  ) async {
    try {
      final connected = await NetworkConnection.isConnected();
      if (connected) {
        http.MultipartRequest request;
        log(usernamecontroller!);
        log(emailcontroller!);
        log(passwordcontroller!);
        log(phonecontroller!);
        log(bankidcontroller!);
        log(service_id!.toString());
        log(areacontroller.text);
        log(citycontroller.text);
        log(countrycontroller.text);
        // FirebaseMessaging messaging = FirebaseMessaging.instance;

        // String? token = await messaging.getToken();
        // print(token);
        // final multipartFile = await http.MultipartFile.fromPath(
        //   'logo',
        //   logo!.path,
        // );
        request = http.MultipartRequest(
          "POST",
          Uri.parse('${AppApi.url}${AppApi.Signup}'),
        );
        request.fields.addAll(
          {
            "user_name": usernamecontroller!,
            "email": emailcontroller!,
            "password": passwordcontroller!,
            "phone": phonecontroller!,
            "bank_num": bankidcontroller!,
            "service_id": service_id.toString(),
            "lang": long.toString(),
            "lat": lat.toString(),
            "area": areacontroller.text,
            "city": citycontroller.text,
            "street": countrycontroller.text,
            "role": "supplier",
            // "bank_name": banknamecontroller.text,
          },
        );
        log(ServicesProvider.gettoken());
        request.headers.addAll({
          "Accept": "application/json",
          'Authorization': 'Bearer ${ServicesProvider.gettoken()}'
        });

// Add images
        for (var i = 0; i < images!.length; i++) {
          request.files.add(await http.MultipartFile.fromPath(
            'images[]',
            images![i].path,
          ));
        }

        // for (var i = 0; i < request.files.length; i++) {
        //   print(request.files[i].field);

        //   print(request.files[i].filename);
        // }

        var response = await request.send();
        response.stream.bytesToString().then((value) async {
          log(value);
        });
        log(response.statusCode.toString());
        // var request = await client.requestimage(
        //     path: AppApi.Signup,
        //     body: {
        //       "user_name": usernamecontroller.text,
        //       "email": emailcontroller.text,
        //       "password": passwordcontroller.text,
        //       "phone": phonecontroller.text,
        //       "bank_num": bankidcontroller.text,
        //       "role": "supplier",
        //       // "bank_name": banknamecontroller.text,
        //     },
        //     image: multipartFile);
        // var response = await request.send();
        // log(response.statusCode.toString());
        // response.stream.bytesToString().then((value) {
        //   print(value.toString());
        // });
        if (response.statusCode == 200) {
          CustomRoute.RouteAndRemoveUntilTo(
            context,
            ChangeNotifierProvider(
              create: (context) => LoginController(),
              lazy: true,
              builder: (context, child) => Login(),
            ),
          );
          // var res = jsonDecode(response.body);
          // var user = User.fromJson(res);
          // ServicesProvider.saveuser(user);
//
          // // LiveitLocale.user = result;
          // final SharedPreferences prefs = await SharedPreferences.getInstance();
          // LiveitLocale.user!.language =
          //     prefs.getString(LiveitLocale.user!.user!.id!.toString()) == null
          //         ? 'en'
          //         : prefs.getString(LiveitLocale.user!.user!.id!.toString());
          // // prefs.setString('language', LiveitLocale.user!.language!);
          // if (prefs.getString('language') == 'ar') {
          //   // Get.updateLocale(Locale('ar', 'AR'));
          // } else if (prefs.getString('language') == 'tr') {
          //   Get.updateLocale(Locale('tr', 'TR'));
          // } else {
          //   Get.updateLocale(Locale('en', 'ES'));
          // }
          // await UserPreferences().saveUser(LiveitLocale.user!);
          // // await LocationService.getCurrentLocation();
          // User u = await UserPreferences().getUser();
          // await UserPreferences().saveUser(u);
          // LiveitLocale.user = await UserPreferences().getUser();
          return Right(true);
        } else if (response.statusCode == 404) {
          // var res = jsonDecode(response.body);
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
}
