// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Services/Responsive.dart';
import 'package:supplier/View/ChooseService/Controller/ChooseServicesController.dart';
import 'package:supplier/View/Widgets/AppBar/AppBarCustom.dart';
import 'package:supplier/View/Widgets/TextInput/TextInputCustom.dart';

class ChooseService extends StatelessWidget {
  // String? usernamecontroller;
  // String? emailcontroller;
  // String? phonecontroller;
  // String? passwordcontroller;
  // String? bankidcontroller;

  // List<XFile>? images;
  // File? logo;
  // ChooseService(
  //     {this.bankidcontroller,
  //     this.emailcontroller,
  //     this.images,
  //     this.logo,
  //     this.passwordcontroller,
  //     this.phonecontroller,
  //     this.usernamecontroller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustom(context, " اختر نوع الخدمة المقدمة"),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<ChooseServicesController>(
              builder: (context, controller, child) => ListView(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    children: [
                      Text(
                        "تصنيف الخدمة الرئيسي",
                        style: style15semibold,
                      ),
                      Gap(10),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                            isDense: true,
                            icon: Icon(Icons.keyboard_arrow_down_rounded),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                isDense: true,
                                fillColor: kThirdryColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                )),
                            onChanged: (value) =>
                                controller.changevalue(value!),
                            items: controller.listservice
                                .map((e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(
                                      "${e.name}",
                                      style: style15semibold,
                                    )))
                                .toList()),
                      ),
                      Gap(20),
                      Text(
                        "اختر المنطقة",
                        style: style15semibold,
                      ),
                      Gap(10),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                            hint: Text("اختر المنطقة"),
                            value: controller.region,
                            isDense: true,
                            icon: Icon(Icons.keyboard_arrow_down_rounded),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                isDense: true,
                                fillColor: kThirdryColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                )),
                            onChanged: (value) =>
                                controller.changeregion(value!),
                            items: controller.listregion
                                .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      "${e.nameAr}",
                                      style: style15semibold,
                                    )))
                                .toList()),
                      ),
                      Gap(20),
                      controller.region == null
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "اختر المدينة",
                                  style: style15semibold,
                                ),
                                Gap(10),
                                DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField(
                                      hint: Text("اختر المدينة"),
                                      value: controller.city,
                                      isDense: true,
                                      icon: Icon(
                                          Icons.keyboard_arrow_down_rounded),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          isDense: true,
                                          fillColor: kThirdryColor,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide.none,
                                          )),
                                      onChanged: (value) =>
                                          controller.changecity(value!),
                                      items: controller.listcity
                                          .map((e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                "${e.nameAr}",
                                                style: style15semibold,
                                              )))
                                          .toList()),
                                ),
                                Gap(20),
                              ],
                            ),
                      // Gap(20),
                      controller.city == null
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "اختر الأحياء",
                                  style: style15semibold,
                                ),
                                Gap(10),
                                DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField(
                                      hint: Text("اختر الحي"),
                                      value: controller.district,
                                      isDense: true,
                                      icon: Icon(
                                          Icons.keyboard_arrow_down_rounded),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          isDense: true,
                                          fillColor: kThirdryColor,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide.none,
                                          )),
                                      onChanged: (value) =>
                                          controller.changedistrict(value!),
                                      items: controller.listdistrict
                                          .map((e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                "${e.nameAr}",
                                                style: style15semibold,
                                              )))
                                          .toList()),
                                ),
                                Gap(20),
                              ],
                            ),
                      Stack(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                color: kThirdryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GoogleMap(
                                mapType: MapType.normal,
                                myLocationEnabled: true,
                                myLocationButtonEnabled: true,
                                scrollGesturesEnabled: true,
                                initialCameraPosition: controller.kGooglePlex,
                                onCameraMove: (position) {
                                  controller.changelatlong(position);
                                },
                                onMapCreated:
                                    (GoogleMapController controllerGM) {
                                  controller.gmcontroller = controllerGM;
                                },
                                onCameraIdle: () {
                                  controller.onCameraIdle();
                                },
                                polygons: controller.polygons,
                                gestureRecognizers: Set()
                                  ..add(Factory<PanGestureRecognizer>(
                                      () => PanGestureRecognizer()))
                                  ..add(Factory<VerticalDragGestureRecognizer>(
                                      () => VerticalDragGestureRecognizer()))
                                  ..add(Factory<
                                          HorizontalDragGestureRecognizer>(
                                      () => HorizontalDragGestureRecognizer())),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            top: 0,
                            child: Align(
                              alignment: AlignmentDirectional.center,
                              child: Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(15),
                      Row(
                        children: [
                          Text(
                            "المنطقة",
                            style: style12semibold,
                          ),
                          Gap(33),
                          Expanded(
                            child: TextInputCustom(
                              controller: controller.areacontroller,
                              hint: "المنطقة",
                              ispassword: false,
                            ),
                          ),
                        ],
                      ),
                      Gap(15),
                      Row(
                        children: [
                          Text(
                            "المدينة",
                            style: style12semibold,
                          ),
                          Gap(33),
                          Expanded(
                            child: TextInputCustom(
                              controller: controller.citycontroller,
                              hint: "المدينة",
                              ispassword: false,
                            ),
                          ),
                        ],
                      ),
                      Gap(15),
                      Row(
                        children: [
                          Text(
                            "الحي",
                            style: style12semibold,
                          ),
                          Gap(33),
                          Expanded(
                            child: TextInputCustom(
                              controller: controller.countrycontroller,
                              hint: "الحي",
                              ispassword: false,
                            ),
                          ),
                        ],
                      ),
                      Gap(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: () async {
                              EasyLoading.show();
                              try {
                                var result = await controller.Signup(
                                  context,
                                );
                                result.fold(
                                  (l) {
                                    EasyLoading.showError(l.message);
                                    EasyLoading.dismiss();
                                  },
                                  (r) {
                                    EasyLoading.dismiss();
                                  },
                                );
                              } catch (e) {
                                EasyLoading.dismiss();
                              }
                            },
                            child: Container(
                              height: Responsive.getHeight(context) * 0.055,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    kPrimaryColor,
                                    kBaseThirdyColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                  child: Text(
                                " اختيار  ",
                                style: style15semiboldwhite,
                              )),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
        ),
      ),
    );
  }
}
