import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Services/Responsive.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/View/Auth/AuthPhone/AuthPhone.dart';
import 'package:supplier/View/Auth/Signup/Controller/SignupController.dart';
import 'package:supplier/View/ChooseService/ChooseService.dart';
import 'package:supplier/View/ChooseService/Controller/ChooseServicesController.dart';
import 'package:supplier/View/Widgets/AppBar/AppBarCustom.dart';
import 'package:supplier/View/Widgets/TextInput/TextInputCustom.dart';

import '../../../../Constant/styles.dart';

final key = GlobalKey<FormState>();

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AuthAppBarCustom(context, false),
        body: Consumer<SignupController>(
          builder: (context, controller, child) => Center(
            child: SizedBox(
              width: Responsive.getWidth(context) * .9,
              child: Form(
                key: key,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Gap(40),
                    Text(
                      "اسم المؤسسة",
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
                    Gap(20),
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
                    Gap(20),
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
                    Gap(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "لديك حساب بالفعل؟",
                          textDirection: TextDirection.rtl,
                          style: style15semibold,
                        ),
                        Gap(10),
                        GestureDetector(
                          onTap: () => controller.toLoginPage(context),
                          child: Text(
                            "تسجيل دخول",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 15,
                                color: kFourthColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Gap(35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: GestureDetector(
                        onTap: () {
                          // if (key.currentState!.validate()) {
                          //   if (controller.logo != null) {
                          //     if (controller.images.isNotEmpty) {
                          CustomRoute.RouteTo(
                            context,
                            ChangeNotifierProvider(
                                create: (context) => ChooseServicesController()
                                  // ..GetAllServices()
                                  ..onInit(
                                    bankidcontroller:
                                        controller.bankidcontroller.text,
                                    emailcontroller:
                                        controller.emailcontroller.text,
                                    passwordcontroller:
                                        controller.passwordcontroller.text,
                                    phonecontroller:
                                        controller.phonecontroller.text,
                                    usernamecontroller:
                                        controller.usernamecontroller.text,
                                    images: controller.images,
                                    logo: controller.logo,
                                  ),
                                child: AuthPhone()),
                          );
                          //   } else {}
                          // } else {}
                          // }
                        },
                        child: Container(
                          height: 43,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                kPrimaryColor,
                                kBaseThirdyColor,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: Text(
                            "طلب انشاء حساب",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kBaseColor,
                            ),
                          )),
                        ),
                      ),
                    ),
                    Gap(25),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
