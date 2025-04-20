// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';
import 'package:gas_manager_mandob/Services/Routes.dart';
import 'package:gas_manager_mandob/View/Reports/ReportsPage.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class Mandobs extends StatelessWidget {
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
          title: Text("المندوبين"),
        ),
        body: Center(
            child: SizedBox(
                width: Responsive.getWidth(context) * .9,
                child: ListView(
                  children: [
                    Gap(30),
                    GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          crossAxisCount: 2),
                      shrinkWrap: true,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              CustomRoute.RouteTo(context, ReportsPage()),
                          child: Container(
                            decoration: BoxDecoration(
                                color: kBaseColor,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 0),
                                      color: kBaseThirdyColor.withAlpha(200),
                                      blurRadius: 5)
                                ]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          color: kBaseColor,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border:
                                              Border.all(color: kPrimaryColor)),
                                      child: CircleAvatar(
                                        backgroundColor: kBaseColor,
                                        radius: 50,
                                      )),
                                  Gap(10),
                                  Text("اسم المندوب")
                                ]),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: kBaseColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    color: kBaseThirdyColor.withAlpha(200),
                                    blurRadius: 5)
                              ]),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: kBaseColor,
                                        borderRadius: BorderRadius.circular(50),
                                        border:
                                            Border.all(color: kPrimaryColor)),
                                    child: CircleAvatar(
                                      backgroundColor: kBaseColor,
                                      radius: 50,
                                    )),
                                Gap(10),
                                Text("اسم المندوب")
                              ]),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: kBaseColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    color: kBaseThirdyColor.withAlpha(200),
                                    blurRadius: 5)
                              ]),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: kBaseColor,
                                        borderRadius: BorderRadius.circular(50),
                                        border:
                                            Border.all(color: kPrimaryColor)),
                                    child: CircleAvatar(
                                      backgroundColor: kBaseColor,
                                      radius: 50,
                                    )),
                                Gap(10),
                                Text("اسم المندوب")
                              ]),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: kBaseColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    color: kBaseThirdyColor.withAlpha(200),
                                    blurRadius: 5)
                              ]),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: kBaseColor,
                                        borderRadius: BorderRadius.circular(50),
                                        border:
                                            Border.all(color: kPrimaryColor)),
                                    child: CircleAvatar(
                                      backgroundColor: kBaseColor,
                                      radius: 50,
                                    )),
                                Gap(10),
                                Text("اسم المندوب")
                              ]),
                        ),
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
}
