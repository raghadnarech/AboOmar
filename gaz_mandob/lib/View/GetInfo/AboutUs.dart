import 'package:flutter/material.dart';
import 'package:gaz_mandob/Constant/colors.dart';
import 'package:gaz_mandob/Constant/styles.dart';
import 'package:gaz_mandob/Services/Responsive.dart';
import 'package:gaz_mandob/View/GetInfo/Controller/GetInfoController.dart';
import 'package:gaz_mandob/View/Widgets/AppBar/AppBarCustom.dart';
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustomPageDrawer(context, "من نحن"),
        body: Consumer<GetInfoController>(
          builder: (context, controller, child) => Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/maskpage.png',
                fit: BoxFit.cover,
                width: Responsive.getWidth(context),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: controller.isloadinggetinfo
                      ? LoadingAnimationWidget.hexagonDots(
                          color: kPrimaryColor, size: 30)
                      : SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: kBaseColor.withAlpha(150),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Center(
                                  child: Text(
                                    controller.PrivacyPolicy!,
                                    style: style18semibold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
