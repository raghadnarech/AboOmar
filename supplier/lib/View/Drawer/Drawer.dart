// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Controller/ServicesProvider.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/View/ContactUs/ContactUs.dart';
import 'package:supplier/View/ContactUs/Controller/ContactUsController.dart';
import 'package:supplier/View/DaileyAccounting/Controller/DaileyAccountingController.dart';
import 'package:supplier/View/DaileyAccounting/DaileyAccounting.dart';
import 'package:supplier/View/E_Wallet/Controller/E_WalletController.dart';
import 'package:supplier/View/E_Wallet/E_Wallet.dart';
import 'package:supplier/View/GetInfo/AboutUs.dart';
import 'package:supplier/View/GetInfo/Controller/GetInfoController.dart';
import 'package:supplier/View/GetInfo/PrivacyPolicy.dart';
import 'package:supplier/View/Noificition/Controller/NotificationController.dart';
import 'package:supplier/View/Noificition/Notification.dart';

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
              // CustomSectionDrawer(
              //     assetsvg: 'assets/svg/profile.svg', titile: "الصفحة الشخصية"),
              // Gap(20),
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
                titile: "المحفظة الالكترونية",
                nextpage: ChangeNotifierProvider<E_WalletController>(
                  create: (context) => E_WalletController()..GetWallet(),
                  lazy: true,
                  builder: (context, child) => E_Wallet(),
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
              ),
              Gap(20),

              GestureDetector(
                onTap: () => ServicesProvider.logout(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: kBaseColor,
                        // foregroundColor: kPrimaryColor,
                        radius: 30,
                        child: SvgPicture.asset(
                          'assets/svg/logout.svg',
                          width: 35,
                        ),
                      ),
                      Gap(10),
                      Text("تسجيل الخروج",
                          style: TextStyle(
                              color: kBaseColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
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
