import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';
import 'package:gas_manager_mandob/Services/Routes.dart';
import 'package:gas_manager_mandob/View/Auth/Login/Login.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          width: Responsive.getWidth(context),
          height: Responsive.getHeight(context),
          child: Image.asset('assets/images/splash.png', fit: BoxFit.cover),
        ),
        Positioned(
          width: Responsive.getWidth(context),
          bottom: Responsive.getHeight(context) * .1,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Text(
                  "أهلاً بك في",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: kBaseColor),
                ),
                Text(
                  "تطبيق الغاز",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: kFourthColor),
                ),
                Gap(30),
                GestureDetector(
                  onTap: () => CustomRoute.RouteReplacementTo(context, Login()),
                  child: Container(
                    width: Responsive.getWidth(context) * .7,
                    height: 40,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color(0xff809FB4),
                              Color(0xff40505A),
                            ]),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      "البدء",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kBaseColor),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
        // Positioned(
        //   bottom: 75,
        //   width: Responsive.getWidth(context),
        //   child: Align(
        //     alignment: AlignmentDirectional.bottomCenter,
        //     child: ,
        //   ),
        // ),
      ]),
    );
  }
}
