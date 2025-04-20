import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Constant/url.dart';
import 'package:supplier/Services/Responsive.dart';
import 'package:supplier/View/Profile/Controller/ProfileController.dart';
import 'package:supplier/View/Widgets/TextInput/TextInputCustom.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          "تعديل الصفحة الشخصية",
          style: style15semiboldwhite,
        ),
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
                  "اسم المؤسسة",
                  style: style15semibold,
                ),
                Gap(10),
                TextInputCustom(
                  type: TextInputType.name,
                  controller: controller.usernamecontroller,
                  icon: Icon(
                    CupertinoIcons.profile_circled,
                    color: kPrimaryColor,
                    size: 20,
                  ),
                ),
                Gap(10),
                Text(
                  "الايميل",
                  style: style15semibold,
                ),
                Gap(10),
                Row(
                  children: [
                    Expanded(
                      child: TextInputCustom(
                        controller: controller.emailcontroller,
                        type: TextInputType.emailAddress,
                        icon: Icon(
                          CupertinoIcons.mail_solid,
                          color: kPrimaryColor,
                          size: 20,
                        ),
                      ),
                    ),
                    Gap(10),
                  ],
                ),
                Text("لم يتم التحقق منه"),
                Text(
                  "التحقق من البريد الالكتروني",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
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
                  ),
                ),
                Gap(10),
                Text(
                  "اسم صاحب المؤسسة",
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
                  ),
                ),
                Gap(10),
                Text(
                  "رقم صاحب المؤسسة",
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
                  ),
                ),
                Gap(10),
                Text(
                  "الموقع",
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
                  ),
                ),
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
                Gap(30),
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
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "صورة من السجل التجاري",
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
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "صورة من رخصة البلدية",
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
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "صورة من الرقم الضريبي",
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
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "صورة خارجية للمحل",
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
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "صورة من ترخيص وزارة الطاقة",
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
                Gap(80),
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
