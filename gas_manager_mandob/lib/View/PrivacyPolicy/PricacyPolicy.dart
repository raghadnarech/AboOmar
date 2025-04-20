import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Constant/styles.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';
import 'package:gas_manager_mandob/View/Widgets/AppBar/AppBarCustom.dart';

class PricacyPolicy extends StatelessWidget {
  const PricacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustomPageDrawer(context, "سياسة االخصوصية"),
        body: Stack(alignment: Alignment.center, children: [
          Image.asset(
            'assets/images/maskpage.png',
            fit: BoxFit.cover,
            width: Responsive.getWidth(context),
          ),
          Positioned(
              width: Responsive.getWidth(context) * .99,
              top: 25,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Container(
                      decoration:
                          BoxDecoration(color: kBaseColor.withAlpha(150)),
                      child: Center(
                          child: Column(
                        children: [
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          Gap(5),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          Gap(5),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          )
                        ],
                      )),
                    ),
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
