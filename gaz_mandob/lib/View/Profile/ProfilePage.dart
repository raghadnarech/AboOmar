// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaz_mandob/View/Profile/Controller/EditProfileController.dart';
import 'package:provider/provider.dart';
import 'package:gaz_mandob/Constant/colors.dart';
import 'package:gaz_mandob/Constant/styles.dart';
import 'package:gaz_mandob/Constant/url.dart';
import 'package:gaz_mandob/Services/Responsive.dart';
import 'package:gaz_mandob/Services/Routes.dart';
import 'package:gaz_mandob/View/Profile/Controller/ProfileController.dart';
import 'package:gaz_mandob/View/Profile/EditProfile.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // key: scaffoldKey,
        // drawer: CustomDrawer(),
        appBar: AppBar(
          actions: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: GestureDetector(
            //     onTap: () {
            //       ServicesProvider.logout(context);
            //     },
            //     child: Icon(Icons.logout),
            //   ),
            // )
          ],
          // leading: GestureDetector(
          //   onTap: () => scaffoldKey.currentState?.openDrawer(),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: SvgPicture.asset(
          //       'assets/svg/menu.svg',
          //       width: 15,
          //       height: 15,
          //     ),
          //   ),
          // ),
          backgroundColor: Color(0xff445461),
          centerTitle: true,
          title: Text(
            "الملف الشخصي",
          ),
        ),
        body: Consumer<ProfileController>(
          builder: (context, controller, child) => Center(
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
                            onTap: () => CustomRoute.RouteTo(
                                context,
                                ChangeNotifierProvider<EditProfileController>(
                                  create: (context) => EditProfileController()
                                    ..oninit(controller.profile),
                                  builder: (context, child) => EditProfile(),
                                )),
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
                          child: Column(children: [
                            CircleAvatar(
                              backgroundColor: kBaseColor,
                              foregroundColor: kBaseColor,
                              radius: 50,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: kPrimaryColor,
                                      width: 2,
                                      strokeAlign:
                                          BorderSide.strokeAlignCenter),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/splash.png',
                                    height: Responsive.getHeight(context) * .1,
                                    width: Responsive.getHeight(context) * .1,
                                    placeholderFit: BoxFit.fill,
                                    fit: BoxFit.fill,
                                    image:
                                        "${AppApi.IMAGEURL}${controller.profile.logo}",
                                    imageErrorBuilder:
                                        (context, error, stackTrace) =>
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Image.asset(
                                                  'assets/images/splash.png',
                                                  height: Responsive.getHeight(
                                                          context) *
                                                      .1,
                                                  width: Responsive.getHeight(
                                                          context) *
                                                      .1,
                                                  fit: BoxFit.fill,
                                                )),
                                  ),
                                ),
                              ),
                            ),
                            Gap(10),
                            Text(
                              controller.profile.userName!,
                              style: style12semibold,
                            ),
                            Text(
                              controller.profile.phone!,
                              style: style12semibold,
                            ),
                            Text(
                              controller.profile.email!,
                              style: style12semibold,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Icon(Icons.location_on),
                            //     Text(
                            //       "${controller.profile}-${controller.profile}-${controller.profile}",
                            //       style: style15semibold,
                            //     ),
                            //   ],
                            // ),
                            Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "الحساب البنكي",
                                  style: style12semibold,
                                ),
                                Gap(30),
                                Text(
                                  "${controller.profile.bankNum!}",
                                  style: style12semibold,
                                ),
                              ],
                            ),

                            // Gap(20),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       "عدد المندوبين ",
                            //       style: style12semibold,
                            //     ),
                            //     Gap(30),
                            //     Text(
                            //       "15",
                            //       style: style12semibold,
                            //     ),
                            //   ],
                            // ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
