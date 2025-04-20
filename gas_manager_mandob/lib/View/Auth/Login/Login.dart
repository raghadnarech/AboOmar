import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';
import 'package:gas_manager_mandob/Services/Routes.dart';
import 'package:gas_manager_mandob/View/Address/AddAddress.dart';
import 'package:gas_manager_mandob/View/AgentDetails/AgentDetails.dart';
import 'package:gas_manager_mandob/View/Auth/Signup/Signup.dart';
import 'package:gas_manager_mandob/View/Home/HomeNavigation.dart';
import 'package:gas_manager_mandob/View/Widgets/AppBar/AppBarCustom.dart';
import 'package:gas_manager_mandob/View/Widgets/TextInput/TextInputCustom.dart';

import '../../../Constant/styles.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AuthAppBarCustom(context, true),
        body: Center(
          child: SizedBox(
            width: Responsive.getWidth(context) * .9,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Gap(47),
                Text(
                  "رقم الهاتف",
                  style: style15semibold,
                ),
                Gap(10),
                TextInputCustom(
                    type: TextInputType.phone,
                    icon: Icon(
                      CupertinoIcons.phone_fill,
                      color: kPrimaryColor,
                      size: 20,
                    )),
                Gap(43),
                Text(
                  "كلمة السر",
                  style: style15semibold,
                ),
                Gap(10),
                TextInputCustom(
                    ispassword: true,
                    type: TextInputType.phone,
                    icon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                      size: 20,
                    )),
                Gap(43),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ليس لديك حساب؟",
                      style: style15semibold,
                    ),
                    Gap(10),
                    GestureDetector(
                      onTap: () =>
                          CustomRoute.RouteReplacementTo(context, Signup()),
                      child: Text(
                        "انشاء حساب",
                        style: TextStyle(
                            fontSize: 15,
                            color: kFourthColor,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                Gap(120),
                GestureDetector(
                  onTap: () =>
                      CustomRoute.RouteReplacementTo(context, HomeNavigation()),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
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
                        "تسجيل الدخول",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kBaseColor,
                        ),
                      )),
                    ),
                  ),
                ),
                Gap(63),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
