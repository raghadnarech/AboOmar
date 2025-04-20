import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';
import 'package:gas_manager_mandob/Services/Routes.dart';
import 'package:gas_manager_mandob/View/Auth/Login/Login.dart';
import 'package:gas_manager_mandob/View/Widgets/AppBar/AppBarCustom.dart';
import 'package:gas_manager_mandob/View/Widgets/TextInput/TextInputCustom.dart';

import '../../../Constant/styles.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AuthAppBarCustom(context, false),
        body: Center(
          child: SizedBox(
            width: Responsive.getWidth(context) * .9,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Gap(47),
                Text(
                  "الاسم المستخدم",
                  style: style15semibold,
                ),
                Gap(10),
                TextInputCustom(
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
                    type: TextInputType.phone,
                    icon: Icon(
                      CupertinoIcons.phone_fill,
                      color: kPrimaryColor,
                      size: 20,
                    )),
                Gap(10),
                Text(
                  "كلمة السر",
                  style: style15semibold,
                ),
                Gap(10),
                TextInputCustom(
                    ispassword: true,
                    type: TextInputType.text,
                    icon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                      size: 20,
                    )),
                Gap(10),
                Text(
                  "تأكيد كلمة السر",
                  style: style15semibold,
                ),
                Gap(10),
                TextInputCustom(
                    ispassword: true,
                    type: TextInputType.text,
                    icon: Icon(
                      Icons.lock,
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
                    type: TextInputType.text,
                    icon: Icon(
                      Icons.account_balance_wallet_rounded,
                      color: kPrimaryColor,
                      size: 20,
                    )),
                Gap(20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "لوغو الحساب",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(70),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: kSecendryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(
                        Icons.add,
                        color: kBaseColor,
                      ),
                    )
                  ],
                ),
                Gap(20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "إضافة أوراق رسمية",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(70),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: kSecendryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(
                        Icons.add,
                        color: kBaseColor,
                      ),
                    )
                  ],
                ),
                Gap(20),
                Row(
                  children: [
                    Text(
                      "المنطقة",
                      style: style12semibold,
                    ),
                    Gap(20),
                    Expanded(
                        child: DropdownButtonHideUnderline(
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
                          onChanged: (value) {},
                          items: []
                              .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    "$e",
                                    style: style15semibold,
                                  )))
                              .toList()),
                    ))
                  ],
                ),
                Gap(43),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "لديك حساب بالفعل؟",
                      style: style15semibold,
                    ),
                    Gap(10),
                    GestureDetector(
                      onTap: () =>
                          CustomRoute.RouteReplacementTo(context, Login()),
                      child: Text(
                        "تسجيل دخول",
                        style: TextStyle(
                            fontSize: 15,
                            color: kFourthColor,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                Gap(120),
                Padding(
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
                      "انشاء حساب",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kBaseColor,
                      ),
                    )),
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
