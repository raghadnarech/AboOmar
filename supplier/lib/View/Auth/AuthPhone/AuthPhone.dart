import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/View/ChooseService/ChooseService.dart';
import 'package:supplier/View/ChooseService/Controller/ChooseServicesController.dart';
import 'package:supplier/View/Widgets/AppBar/AppBarCustom.dart';

class AuthPhone extends StatelessWidget {
  const AuthPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustom(context, 'التحقق من الرقم'),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Gap(50),
            Center(
              child: Text("ادخل الرمز الذي تم إرساله إلى الرقم "),
            ),
            Center(
              child: Text(
                "+966 xx xxx xxx",
                textDirection: TextDirection.ltr,
                style: style15semibold,
              ),
            ),
            Gap(50),
            Consumer<ChooseServicesController>(
              builder: (context, value, child) => Pinput(
                onTapOutside: (event) =>
                    FocusManager.instance.primaryFocus!.unfocus(),
                length: 6,
                onCompleted: (value) => CustomRoute.RouteTo(
                  context,
                  ChangeNotifierProvider(
                      create: (context) => ChooseServicesController()
                        ..GetAllServices()
                        ..GetAllRegions(),
                      child: ChooseService()),
                ),
              ),
            ),
            Gap(50),
            Center(
              child: Text("لم يصل الرمز"),
            ),
            Center(
              child: Text(
                "أعد إرساله",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
