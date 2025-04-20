import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Constant/styles.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';
import 'package:gas_manager_mandob/View/Widgets/AppBar/AppBarCustom.dart';
import 'package:gas_manager_mandob/View/Widgets/CartProduct/CustomCartProduct.dart';

class GasPage extends StatelessWidget {
  const GasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBarCustom(context, 'الغاز'),
      body: Center(
        child: SizedBox(
          width: Responsive.getWidth(context) * .9,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Gap(30),
              GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 35,
                    mainAxisSpacing: 40),
                children: [
                  CustomCartProduct(
                    title: "انبوبة حديد",
                    desc: "300 ريال + الرسوم",
                  ),
                  CustomCartProduct(
                    title: "انبوبة حديد",
                    desc: "400 ريال + الرسوم",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
