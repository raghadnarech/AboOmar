// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Constant/styles.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';
import 'package:gas_manager_mandob/Services/Routes.dart';
import 'package:gas_manager_mandob/View/Address/AddAddress.dart';
import 'package:gas_manager_mandob/View/Home/GasPage.dart';
import 'package:gas_manager_mandob/View/Widgets/AppBar/AppBarCustom.dart';
import 'package:gas_manager_mandob/View/Widgets/CheckBox/CheckBoxCustom.dart';
import 'package:gas_manager_mandob/View/Widgets/TextInput/TextInputCustom.dart';

class SelectSubSupplier extends StatefulWidget {
  @override
  State<SelectSubSupplier> createState() => _SelectSubSupplierState();
}

class _SelectSubSupplierState extends State<SelectSubSupplier> {
  bool nearestrepresentative = false;
  bool selectedrepresentative = false;
  bool representativefromlist = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBarCustom(context, 'اختر المورد الفرعي'),
      body: Center(
          child: SizedBox(
        width: Responsive.getWidth(context) * .9,
        child: ListView(
          children: [
            Gap(30),
            Row(
              children: [
                CheckBoxCustom(
                  check: nearestrepresentative,
                  onChanged: (value) {
                    setState(() {
                      nearestrepresentative = value!;
                      selectedrepresentative = false;
                      representativefromlist = false;
                    });
                  },
                ),
                Gap(15),
                Text(
                  "اختيار اقرب مندوب معين ضمن المنطقة",
                  style: style15semibold,
                )
              ],
            ),
            Gap(20),
            Row(
              children: [
                CheckBoxCustom(
                  check: selectedrepresentative,
                  onChanged: (value) {
                    setState(() {
                      selectedrepresentative = value!;
                      nearestrepresentative = false;
                      representativefromlist = false;
                    });
                  },
                ),
                Gap(15),
                Text(
                  "ارسال الطلب الى مندوب معين",
                  style: style15semibold,
                )
              ],
            ),
            Gap(20),
            Visibility(
                visible: selectedrepresentative,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "كود المندوب",
                          style: style12semibold,
                        ),
                        Gap(20),
                        Expanded(child: TextInputCustom()),
                      ],
                    ),
                    Gap(25),
                  ],
                )),
            Row(
              children: [
                CheckBoxCustom(
                  check: representativefromlist,
                  onChanged: (value) {
                    setState(() {
                      representativefromlist = value!;
                      nearestrepresentative = false;
                      selectedrepresentative = false;
                    });
                  },
                ),
                Gap(15),
                Text(
                  "اختيار مورد معين ضمن المنطقة",
                  style: style15semibold,
                )
              ],
            ),
            Gap(20),
            Visibility(
                visible: representativefromlist,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "اختر مورد معين",
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
                    Gap(25),
                  ],
                )),
            Gap(170),
            GestureDetector(
              onTap: () => CustomRoute.RouteReplacementTo(context, GasPage()),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 43,
                  width: Responsive.getWidth(context) * .8,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: kBaseThirdyColor.withAlpha(75),
                          blurRadius: 7)
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff445461),
                  ),
                  child: Center(
                    child: Text(
                      "متابعة",
                      style: TextStyle(
                          fontSize: 15,
                          color: kBaseColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    ));
  }
}
