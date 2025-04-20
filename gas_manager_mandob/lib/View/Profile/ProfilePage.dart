import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Constant/styles.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';
import 'package:gas_manager_mandob/Services/Routes.dart';
import 'package:gas_manager_mandob/View/Profile/EditProfile.dart';
import 'package:gas_manager_mandob/View/Widgets/CheckBox/CheckBoxCustom.dart';
import 'package:gas_manager_mandob/View/Widgets/TextInput/TextInputCustom.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _ProfilePageState extends State<ProfilePage> {
  bool mybank = false;

  bool anotherbank = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(),
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
        backgroundColor: Color(0xff445461),
        centerTitle: true,
        title: Text("الصفحة الشخصية"),
      ),
      body: Center(
          child: SizedBox(
        width: Responsive.getWidth(context) * .9,
        child: ListView(
          children: [
            Gap(30),
            Stack(
              children: [
                Positioned(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => CustomRoute.RouteTo(context, EditProfile()),
                      child: Container(
                        decoration: BoxDecoration(
                            color: kFourthColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.edit,
                            color: kBaseColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor, width: 2),
                            borderRadius: BorderRadius.circular(50)),
                        child: CircleAvatar(
                          backgroundColor: kBaseColor,
                          foregroundColor: kBaseColor,
                          radius: 50,
                        ),
                      ),
                      Gap(10),
                      Text("اسم المندوب"),
                      Text("0963582741582582"),
                      Text("user @gmail.com"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on),
                          Text("السعودية , المدينة المنورة , حي القبلاء"),
                        ],
                      ),
                      Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("الحساب البنكي"),
                          Gap(30),
                          Text("741852852"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("عدد المندوبين"),
                          Gap(30),
                          Text("15"),
                        ],
                      ),
                      Gap(30),
                    ],
                  ),
                ))
              ],
            )
          ],
        ),
      )),
    ));
  }
}
