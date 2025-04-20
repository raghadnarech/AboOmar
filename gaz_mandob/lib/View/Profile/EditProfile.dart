// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gaz_mandob/Constant/colors.dart';
import 'package:gaz_mandob/Constant/styles.dart';
import 'package:gaz_mandob/Constant/url.dart';
import 'package:gaz_mandob/Services/Responsive.dart';
import 'package:gaz_mandob/Services/Routes.dart';
import 'package:gaz_mandob/View/ContactUs/Controller/ContactUsController.dart';
import 'package:gaz_mandob/View/GetInfo/AboutUs.dart';
import 'package:gaz_mandob/View/ContactUs/ContactUs.dart';
import 'package:gaz_mandob/View/GetInfo/Controller/GetInfoController.dart';
import 'package:gaz_mandob/View/GetInfo/PrivacyPolicy.dart';
import 'package:gaz_mandob/View/Noificition/Controller/NotificationController.dart';
import 'package:gaz_mandob/View/Noificition/Notification.dart';
import 'package:gaz_mandob/View/Profile/Controller/EditProfileController.dart';
import 'package:gaz_mandob/View/Widgets/TextInput/TextInputCustom.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Color(0xff1B2A36),
                  Color(0xff35536B),
                ])),
            child: ListView(
              children: [
                Gap(10),
                CircleAvatar(
                  backgroundColor: kBaseColor,
                  foregroundColor: kBaseColor,
                  radius: 100,
                ),
                Gap(10),
                Center(
                    child: Text(
                  "اسم المستخدم",
                  style: TextStyle(
                      color: kBaseColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )),
                Gap(20),
                CustomSectionDrawer(
                    assetsvg: 'assets/svg/orderDrawer.svg', titile: "الطلبات"),
                Gap(20),
                CustomSectionDrawer(
                    assetsvg: 'assets/svg/man_address.svg',
                    titile: "إدارة العناوين"),
                Gap(20),
                CustomSectionDrawer(
                    assetsvg: 'assets/svg/profile.svg',
                    titile: "الصفحة الشخصية"),
                Gap(20),
                CustomSectionDrawer(
                  assetsvg: 'assets/svg/noti.svg',
                  titile: "الإشعارات",
                  nextpage: ChangeNotifierProvider<NotificationController>(
                    create: (context) =>
                        NotificationController()..GetNotification(),
                    lazy: true,
                    builder: (context, child) => NotificationPage(),
                  ),
                ),
                Gap(20),
                CustomSectionDrawer(
                  assetsvg: 'assets/svg/about_us.svg',
                  titile: "من نحن",
                  nextpage: ChangeNotifierProvider<GetInfoController>(
                    create: (context) => GetInfoController()..GetInfo(context),
                    builder: (context, child) => AboutUs(),
                  ),
                ),
                Gap(20),
                CustomSectionDrawer(
                  assetsvg: 'assets/svg/priv_poli.svg',
                  titile: "سياسة الخصوصية",
                  nextpage: ChangeNotifierProvider(
                    create: (context) => GetInfoController()..GetInfo(context),
                    builder: (context, child) => PrivacyPolicy(),
                  ),
                ),
                Gap(20),
                CustomSectionDrawer(
                  assetsvg: 'assets/svg/contact_us.svg',
                  titile: "تواصل معنا",
                  nextpage: ChangeNotifierProvider<ContactUsController>(
                    create: (context) => ContactUsController(),
                    builder: (context, child) => ContactUs(),
                  ),
                )
              ],
            )),
      ),
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () => scaffoldKey.currentState?.openEndDrawer(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/svg/menu.svg',
                width: 30,
                height: 25,
              ),
            ),
          ),
        ],
        // leading: GestureDetector(
        //     onTap: () => CustomRoute.RoutePop(context),
        //     child: Icon(Icons.arrow_back)),
        backgroundColor: Color(0xff445461),
        centerTitle: true,
        title: Text("تعديل الصفحة الشخصية"),
      ),
      body: Center(
        child: SizedBox(
          width: Responsive.getWidth(context) * .9,
          child: Consumer<EditProfileController>(
            builder: (context, controller, child) => ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Gap(30),
                Text(
                  "الاسم المستخدم",
                  style: style15semibold,
                ),
                Gap(10),
                TextInputCustom(
                    controller: controller.usernamecontroller,
                    type: TextInputType.name,
                    icon: Icon(
                      CupertinoIcons.profile_circled,
                      color: kPrimaryColor,
                      size: 20,
                    )),
                Gap(10),
                Text(
                  "الايميل",
                  style: style15semibold,
                ),
                Gap(10),
                TextInputCustom(
                    controller: controller.emailcontroller,
                    type: TextInputType.emailAddress,
                    icon: Icon(
                      CupertinoIcons.mail_solid,
                      color: kPrimaryColor,
                      size: 20,
                    )),
                Gap(10),
                Text(
                  "رقم الهاتف",
                  style: style15semibold,
                ),
                Gap(10),
                TextInputCustom(
                    controller: controller.phonecontroller,
                    type: TextInputType.phone,
                    icon: Icon(
                      CupertinoIcons.phone_fill,
                      color: kPrimaryColor,
                      size: 20,
                    )),
                Gap(10),
                Text(
                  "رقم الحساب البنكي",
                  style: style15semibold,
                ),
                Gap(10),
                TextInputCustom(
                    controller: controller.bankidcontroller,
                    type: TextInputType.text,
                    icon: Icon(
                      Icons.account_balance_wallet_rounded,
                      color: kPrimaryColor,
                      size: 20,
                    )),
                Gap(10),
                Text(
                  "اسم البنك",
                  style: style15semibold,
                ),
                Gap(10),
                TextInputCustom(
                    controller: controller.banknamecontroller,
                    type: TextInputType.text,
                    icon: Icon(
                      Icons.account_balance_wallet_rounded,
                      color: kPrimaryColor,
                      size: 20,
                    )),
                Gap(10),
                // Text(
                //   "المورد الافتراضي",
                //   style: style15semibold,
                // ),
                // Gap(10),
                // DropdownButtonHideUnderline(
                //   child: DropdownButtonFormField(
                //       hint: Text(
                //         "اسم المورد",
                //         style: style15semibold,
                //       ),
                //       isDense: true,
                //       icon: Icon(Icons.keyboard_arrow_down_rounded),
                //       decoration: InputDecoration(
                //           contentPadding: EdgeInsets.all(10),
                //           isDense: true,
                //           fillColor: kThirdryColor,
                //           filled: true,
                //           border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(5),
                //             borderSide: BorderSide.none,
                //           )),
                //       onChanged: (value) {},
                //       items: ['المورد 1', 'المورد 2']
                //           .map((e) => DropdownMenuItem(
                //               value: e,
                //               child: Text(
                //                 "$e",
                //                 style: style15semibold,
                //               )))
                //           .toList()),
                // ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "لوغو الحساب",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gap(10),
                        GestureDetector(
                          onTap: () => controller.SelectImage(context),
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: kSecendryColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Icon(
                              Icons.add,
                              color: kBaseColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(20),
                    controller.logo != null
                        ? Center(
                            child: SizedBox(
                              height: Responsive.getHeight(context) * .1,
                              width: Responsive.getHeight(context) * .1,
                              child: Stack(
                                children: [
                                  Container(
                                      height:
                                          Responsive.getHeight(context) * .1,
                                      width: Responsive.getHeight(context) * .1,
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        border:
                                            Border.all(color: kPrimaryColor),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        child: Image.file(
                                          File(controller.logo!.path),
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                  GestureDetector(
                                    onTap: () => controller.removelogo(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.delete,
                                          color: kBaseColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : controller.profile!.logo != null
                            ? Container(
                                height: Responsive.getHeight(context) * .1,
                                width: Responsive.getHeight(context) * .1,
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  border: Border.all(color: kPrimaryColor),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: FadeInImage.assetNetwork(
                                      fit: BoxFit.fill,
                                      placeholder: 'assets/images/splash.png',
                                      image:
                                          "${AppApi.IMAGEURL}${controller.profile!.logo}"),
                                ),
                              )
                            : Container()
                  ],
                ),
                Gap(43),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: GestureDetector(
                    onTap: () => controller.UpdateProfile(context),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topRight,
                              colors: [
                                Color(0xff1B2A36),
                                Color(0xff35536B),
                              ])),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Center(
                            child: Text(
                          "حفظ التعديلات",
                          style: TextStyle(
                              color: kBaseColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class CustomSectionDrawer extends StatelessWidget {
  CustomSectionDrawer({this.assetsvg, this.nextpage, this.titile});
  String? titile;
  String? assetsvg;
  Widget? nextpage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CustomRoute.RouteTo(context, nextpage!),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: kBaseColor,
              radius: 30,
              child: SvgPicture.asset(
                assetsvg!,
                width: 35,
              ),
            ),
            Gap(10),
            Text(titile!,
                style: TextStyle(
                    color: kBaseColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }
}
