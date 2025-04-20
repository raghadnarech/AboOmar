import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Constant/styles.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';
import 'package:gas_manager_mandob/View/Widgets/AppBar/AppBarCustom.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustomPageDrawer(context, "تواصل معنا"),
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
                          BoxDecoration(color: kBaseColor.withAlpha(200)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ارسل رسالة للدعم الفني",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            Gap(10),
                            TextFormField(
                              maxLines: 4,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: kPrimaryColor, width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: kPrimaryColor, width: 2)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: kPrimaryColor, width: 2))),
                            ),
                            Gap(35),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xff809FB4),
                                        Color(0xff40505A)
                                      ]),
                                ),
                                child: Center(
                                    child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "ارسل",
                                    style: TextStyle(
                                        color: kBaseColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                              ),
                            ),
                            Gap(35),
                            Divider(
                              color: kPrimaryColor,
                              thickness: 2,
                              indent: 20,
                              endIndent: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "او ارسل عن طريق الواتساب",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Gap(20),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: kBaseColor,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                              color: kBaseThirdyColor
                                                  .withAlpha(50),
                                              offset: Offset(0, 0),
                                              blurRadius: 7),
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: SvgPicture.asset(
                                        'assets/svg/whatsapp.svg',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
