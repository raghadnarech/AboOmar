// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:gaz_mandob/View/DaileyAccounting/Controller/DaileyAccountingController.dart';
import 'package:gaz_mandob/View/DaileyAccounting/DaileyAccounting.dart';
import 'package:gaz_mandob/View/Profile/Controller/ProfileController.dart';
import 'package:gaz_mandob/View/Profile/ProfilePage.dart';
import 'package:gaz_mandob/View/RealTimeTracking.dart';
import 'package:provider/provider.dart';
import 'package:gaz_mandob/Constant/colors.dart';
import 'package:gaz_mandob/Services/Routes.dart';
import 'package:gaz_mandob/View/ContactUs/ContactUs.dart';
import 'package:gaz_mandob/View/ContactUs/Controller/ContactUsController.dart';
// import 'package:gaz_mandob/View/DaileyAccounting/Controller/DaileyAccountingController.dart';
// import 'package:gaz_mandob/View/DaileyAccounting/DaileyAccounting.dart';
// import 'package:gaz_mandob/View/E_Wallet/Controller/E_WalletController.dart';
// import 'package:gaz_mandob/View/E_Wallet/E_Wallet.dart';
import 'package:gaz_mandob/View/GetInfo/AboutUs.dart';
import 'package:gaz_mandob/View/GetInfo/Controller/GetInfoController.dart';
import 'package:gaz_mandob/View/GetInfo/PrivacyPolicy.dart';
import 'package:gaz_mandob/View/Noificition/Controller/NotificationController.dart';
import 'package:gaz_mandob/View/Noificition/Notification.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                assetsvg: 'assets/svg/orderDrawer.svg',
                titile: "كشف حساب يومي",
                nextpage: ChangeNotifierProvider<DaileyAccountingController>(
                  create: (context) =>
                      DaileyAccountingController()..GetDaileyOrders(context),
                  builder: (context, child) => DaileyAccounting(),
                ),
              ),
              Gap(20),
              CustomSectionDrawer(
                assetsvg: 'assets/svg/profile.svg',
                titile: "الصفحة الشخصية",
                nextpage: ChangeNotifierProvider<ProfileController>(
                  create: (context) => ProfileController()..GetProfile(),
                  lazy: true,
                  builder: (context, child) => ProfilePage(),
                ),
              ),
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
                assetsvg: 'assets/svg/e_wallet.svg',
                titile: "Tracking",
                nextpage: RealTimeTracking(),
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
    );
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
