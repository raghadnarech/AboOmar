import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaz_mandob/Constant/colors.dart';
import 'package:gaz_mandob/Model/Country.dart';
import 'package:gaz_mandob/Model/District.dart';
import 'package:gaz_mandob/Services/Responsive.dart';
import 'package:gaz_mandob/View/Auth/Signup/Controller/SignupController.dart';
import 'package:gaz_mandob/View/Widgets/AppBar/AppBarCustom.dart';
import 'package:gaz_mandob/View/Widgets/TextInput/TextInputCustom.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Constant/styles.dart';

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
            child: Consumer<SignupController>(
              builder:
                  (context, controller, child) => ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Gap(47),
                      Text("اسم المندوب", style: style15semibold),
                      Gap(10),
                      TextInputCustom(
                        controller: controller.usernamecontroller,
                        type: TextInputType.name,
                        icon: Icon(
                          CupertinoIcons.profile_circled,
                          color: kPrimaryColor,
                          size: 20,
                        ),
                      ),
                      Gap(10),
                      Text("الايميل", style: style15semibold),
                      Gap(10),
                      TextInputCustom(
                        controller: controller.emailcontroller,
                        type: TextInputType.emailAddress,
                        icon: Icon(
                          CupertinoIcons.mail_solid,
                          color: kPrimaryColor,
                          size: 20,
                        ),
                      ),
                      Gap(10),
                      Text("اختر البلد", style: style15semibold),
                      Gap(10),
                      Skeletonizer(
                        enableSwitchAnimation: true,
                        enabled: controller.isloadingcountry,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<Country>(
                            isDense: true,
                            hint: Text("اختر البلد", style: style12semibold),
                            icon: Icon(Icons.keyboard_arrow_down_rounded),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              isDense: true,
                              fillColor: kThirdryColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            value: controller.state,
                            onChanged: (Country? date) {
                              controller.state = date;
                              controller.notifyListeners();
                            },
                            items:
                                controller.countries.map((Country state) {
                                  return DropdownMenuItem<Country>(
                                    value: state,
                                    child: Text(
                                      state.name!,
                                      style: style15semibold,
                                    ),
                                  );
                                }).toList(),
                          ),
                        ),
                      ),
                      Gap(10),
                      Text("رقم الهاتف", style: style15semibold),
                      Gap(10),
                      TextInputCustom(
                        controller: controller.phonecontroller,
                        type: TextInputType.phone,
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                CupertinoIcons.phone_fill,
                                color: kPrimaryColor,
                                size: 20,
                              ),
                              Gap(5),
                              controller.state!.name ==
                                      'الامارات العربية المتحدة'
                                  ? Text(
                                    "+971",
                                    textDirection: TextDirection.ltr,
                                  )
                                  : Text(
                                    "+966",
                                    textDirection: TextDirection.ltr,
                                  ),
                            ],
                          ),
                        ),
                      ),
                      Gap(10),
                      Text("كلمة السر", style: style15semibold),
                      Gap(10),
                      TextInputCustom(
                        controller: controller.passwordcontroller,
                        ispassword: true,
                        type: TextInputType.text,
                        icon: Icon(Icons.lock, color: kPrimaryColor, size: 20),
                      ),
                      Gap(10),
                      Text("تأكيد كلمة السر", style: style15semibold),
                      Gap(10),
                      TextInputCustom(
                        controller: controller.confirmpasswordcontroller,
                        ispassword: true,
                        type: TextInputType.text,
                        icon: Icon(Icons.lock, color: kPrimaryColor, size: 20),
                      ),
                      Gap(10),

                      Text("رقم الحساب البنكي", style: style15semibold),
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
                      Text("اسم البنك", style: style15semibold),
                      Gap(10),
                      TextInputCustom(
                        controller: controller.banknamecontroller,
                        type: TextInputType.text,
                        icon: Icon(
                          Icons.account_balance_wallet_rounded,
                          color: kPrimaryColor,
                          size: 20,
                        ),
                      ),
                      Gap(20),
                      Text("اختر المنطقة", style: style15semibold),
                      Gap(10),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          hint: Text("اختر المنطقة"),
                          value: controller.region,
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
                            ),
                          ),
                          onChanged: (value) => controller.changeregion(value!),
                          items:
                              controller.listregion
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        "${e.nameAr}",
                                        style: style15semibold,
                                      ),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                      Gap(20),
                      controller.region == null
                          ? Container()
                          : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("اختر المدينة", style: style15semibold),
                              Gap(10),
                              DropdownButtonHideUnderline(
                                child: DropdownButtonFormField(
                                  hint: Text("اختر المدينة"),
                                  value: controller.city,
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
                                    ),
                                  ),
                                  onChanged:
                                      (value) => controller.changecity(value!),
                                  items:
                                      controller.listcity
                                          .map(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                "${e.nameAr}",
                                                style: style15semibold,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                ),
                              ),
                              Gap(20),
                            ],
                          ),
                      // Gap(20),
                      controller.city == null
                          ? Container()
                          : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("اختر الأحياء", style: style15semibold),
                              Gap(10),
                              // DropdownButtonHideUnderline(
                              //   child: DropdownButtonFormField(
                              //       hint: Text("اختر الحي"),
                              //       value: controller.district,
                              //       isDense: true,
                              //       icon: Icon(Icons.keyboard_arrow_down_rounded),
                              //       decoration: InputDecoration(
                              //           contentPadding: EdgeInsets.all(10),
                              //           isDense: true,
                              //           fillColor: kThirdryColor,
                              //           filled: true,
                              //           border: OutlineInputBorder(
                              //             borderRadius: BorderRadius.circular(5),
                              //             borderSide: BorderSide.none,
                              //           )),
                              //       onChanged: (value) =>
                              //           controller.changedistrict(value!),
                              //       items: controller.listdistrict
                              //           .map((e) => DropdownMenuItem(
                              //               value: e,
                              //               child: Text(
                              //                 "${e.nameAr}",
                              //                 style: style15semibold,
                              //               )))
                              //           .toList()),
                              // ),
                              MultiSelectDialogField(
                                itemsTextStyle: TextStyle(fontFamily: 'Cairo'),
                                selectedItemsTextStyle: TextStyle(
                                  fontFamily: 'Cairo',
                                ),
                                cancelText: Text("إلغاء"),
                                chipDisplay: MultiSelectChipDisplay<District>(
                                  chipColor: kPrimaryColor,
                                  textStyle: style15semiboldwhite,
                                ),
                                confirmText: Text("موافق"),
                                buttonText: Text(
                                  "اختر الأحياء",
                                  style: style15semibold,
                                ),
                                buttonIcon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                ),
                                decoration: BoxDecoration(
                                  color: kThirdryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                separateSelectedItems: true,
                                searchable: true,
                                searchHint: "بحث",
                                title: Text("اختر الأحياء"),
                                items:
                                    controller.listdistrict
                                        .map(
                                          (e) => MultiSelectItem(e, e.nameAr!),
                                        )
                                        .toList(),
                                listType: MultiSelectListType.LIST,
                                selectedColor: kPrimaryColor,
                                unselectedColor: kThirdryColor,
                                onConfirm: (values) {
                                  controller.selecteddistricts =
                                      values.map((e) => e.districtId!).toList();
                                  log(controller.selecteddistricts.toString());
                                },
                              ),
                              Gap(20),
                            ],
                          ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "صورة شخصية واضحة",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(70),
                          GestureDetector(
                            onTap:
                                () =>
                                    controller.SelectImage(context, 'personal'),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: kSecendryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(Icons.add, color: kBaseColor),
                            ),
                          ),
                          MaxGap(40),
                          controller.personal_image == null
                              ? Container()
                              : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        controller.personal_image!,
                                        fit: BoxFit.fill,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: GestureDetector(
                                        onTap:
                                            () => controller.removeImage(
                                              'personal',
                                            ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: kSecendryColor,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Icon(
                                              Icons.delete,
                                              color: kBaseColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                      ),
                      Gap(10),
                      Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        children: [
                          Text(
                            "صورة السيارة موضحاً فيها اللوحة الأمامية",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // MaxGap(70),
                          GestureDetector(
                            onTap:
                                () => controller.SelectImage(
                                  context,
                                  'car_front',
                                ),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: kSecendryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(Icons.add, color: kBaseColor),
                            ),
                          ),
                          // MaxGap(40),
                          controller.car_image_front == null
                              ? Container()
                              : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        controller.car_image_front!,
                                        fit: BoxFit.fill,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: GestureDetector(
                                        onTap:
                                            () => controller.removeImage(
                                              'car_front',
                                            ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: kSecendryColor,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Icon(
                                              Icons.delete,
                                              color: kBaseColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                      ),
                      Gap(10),
                      Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        children: [
                          Text(
                            "صورة السيارة موضحاً فيها اللوحة الخلفية",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // MaxGap(70),
                          GestureDetector(
                            onTap:
                                () =>
                                    controller.SelectImage(context, 'car_back'),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: kSecendryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(Icons.add, color: kBaseColor),
                            ),
                          ),
                          // MaxGap(40),
                          controller.car_image_back == null
                              ? Container()
                              : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        controller.car_image_back!,
                                        fit: BoxFit.fill,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: GestureDetector(
                                        onTap:
                                            () => controller.removeImage(
                                              'car_back',
                                            ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: kSecendryColor,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Icon(
                                              Icons.delete,
                                              color: kBaseColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                      ),
                      Gap(10),
                      Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        children: [
                          Text(
                            "صورة رخصة القيادة",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // MaxGap(70),
                          GestureDetector(
                            onTap:
                                () =>
                                    controller.SelectImage(context, 'licence'),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: kSecendryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(Icons.add, color: kBaseColor),
                            ),
                          ),
                          // MaxGap(40),
                          controller.licence_image == null
                              ? Container()
                              : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        controller.licence_image!,
                                        fit: BoxFit.fill,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: GestureDetector(
                                        onTap:
                                            () => controller.removeImage(
                                              'licence',
                                            ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: kSecendryColor,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Icon(
                                              Icons.delete,
                                              color: kBaseColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                      ),
                      Gap(10),
                      Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        children: [
                          Text(
                            "صورة عن استمارة السيارة",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // MaxGap(70),
                          GestureDetector(
                            onTap:
                                () => controller.SelectImage(
                                  context,
                                  'car_licence',
                                ),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: kSecendryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(Icons.add, color: kBaseColor),
                            ),
                          ),
                          // MaxGap(40),
                          controller.car_licence == null
                              ? Container()
                              : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        controller.car_licence!,
                                        fit: BoxFit.fill,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: GestureDetector(
                                        onTap:
                                            () => controller.removeImage(
                                              'car_licence',
                                            ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: kSecendryColor,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Icon(
                                              Icons.delete,
                                              color: kBaseColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                      ),
                      Gap(10),
                      Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        children: [
                          Text(
                            "صورة عن الهوية الوطنية أو الإقامة",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // MaxGap(70),
                          GestureDetector(
                            onTap: () => controller.SelectImage(context, 'id'),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: kSecendryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(Icons.add, color: kBaseColor),
                            ),
                          ),
                          // MaxGap(40),
                          controller.id_image == null
                              ? Container()
                              : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        controller.id_image!,
                                        fit: BoxFit.fill,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: GestureDetector(
                                        onTap:
                                            () => controller.removeImage('id'),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: kSecendryColor,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Icon(
                                              Icons.delete,
                                              color: kBaseColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                      ),
                      Gap(43),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("لديك حساب بالفعل؟", style: style15semibold),
                          Gap(10),
                          GestureDetector(
                            onTap: () => controller.toLoginPage(context),
                            child: Text(
                              "تسجيل دخول",
                              style: TextStyle(
                                fontSize: 15,
                                color: kFourthColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(120),
                      GestureDetector(
                        onTap: () async {
                          await controller.Signup(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            height: 43,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [kPrimaryColor, kBaseThirdyColor],
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
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap(63),
                    ],
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
