// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/View/Home/Mandobs.dart';
import 'package:gas_manager_mandob/View/Home/HomePage.dart';
import 'package:gas_manager_mandob/View/Orders/OrdersPage.dart';
import 'package:gas_manager_mandob/View/Profile/ProfilePage.dart';

class HomeNavigation extends StatefulWidget {
  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

List pages = [HomePage(), Mandobs(), ProfilePage()];

class _HomeNavigationState extends State<HomeNavigation> {
  int page = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[page],
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                page = value;
              });
            },
            selectedItemColor: kFourthColor,
            selectedLabelStyle: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w600, color: kFourthColor),
            showUnselectedLabels: true,
            unselectedItemColor: kSecendryColor,
            unselectedLabelStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: kSecendryColor),
            currentIndex: page,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  label: "الصفحة الرئيسية",
                  icon: Icon(
                    Icons.home_filled,
                    size: 20,
                  )),
              BottomNavigationBarItem(
                  label: "المندوبين",
                  icon: Icon(
                    Icons.local_shipping_rounded,
                    size: 20,
                  )),
              BottomNavigationBarItem(
                  label: "البروفايل",
                  icon: Icon(
                    CupertinoIcons.profile_circled,
                    size: 20,
                  )),
            ]),
      ),
    );
  }
}
