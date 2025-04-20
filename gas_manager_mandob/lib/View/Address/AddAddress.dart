// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Constant/styles.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';
import 'package:gas_manager_mandob/Services/Routes.dart';
import 'package:gas_manager_mandob/View/Home/HomeNavigation.dart';
import 'package:gas_manager_mandob/View/Widgets/AppBar/AppBarCustom.dart';
import 'package:gas_manager_mandob/View/Widgets/CheckBox/CheckBoxCustom.dart';
import 'package:gas_manager_mandob/View/Widgets/TextInput/TextInputCustom.dart';

class AddAddress extends StatefulWidget {
  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  bool? residential = false;
  bool? commercial = false;
  bool? haselevater = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustom(context, 'إضافة العناوين'),
        body: Center(
          child: SizedBox(
            width: Responsive.getWidth(context) * .9,
            child: ListView(
              children: [
                Gap(30),
                Text(
                  "أضف عنوان",
                  style: style15semibold,
                ),
                Gap(15),
                Row(
                  children: [
                    Text(
                      "اسم العنوان",
                      style: style12semibold,
                    ),
                    Gap(20),
                    Expanded(child: TextInputCustom())
                  ],
                ),
                Gap(15),
                Text(
                  "العنوان على الخريطة",
                  style: style12semibold,
                ),
                Gap(10),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: kThirdryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Gap(15),
                Text(
                  "نوع السكن",
                  style: style12semibold,
                ),
                Gap(10),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CheckBoxCustom(
                          check: residential!,
                          onChanged: (newValue) {
                            setState(() {
                              residential = newValue!;
                              commercial = false;
                            });
                          },
                        ),
                        Gap(10),
                        Text(
                          "سكني",
                          style: style12semibold,
                        )
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        CheckBoxCustom(
                          check: commercial!,
                          onChanged: (newValue) {
                            setState(() {
                              commercial = newValue!;
                              residential = false;
                            });
                          },
                        ),
                        Gap(10),
                        Text(
                          "تجاري",
                          style: style12semibold,
                        )
                      ],
                    )),
                  ],
                ),
                Gap(15),
                Row(
                  children: [
                    Text(
                      "الطابق",
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
                          items: listfloor
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
                Gap(15),
                Row(
                  children: [
                    CheckBoxCustom(
                      check: haselevater!,
                      onChanged: (newValue) {
                        setState(() {
                          haselevater = newValue!;
                        });
                      },
                    ),
                    Gap(10),
                    Text(
                      "يوجد مصعد",
                      style: style15semibold,
                    )
                  ],
                ),
                Gap(50),
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
                        "إضافة",
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

List<int> listfloor = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
