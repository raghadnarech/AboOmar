import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Constant/styles.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';
import 'package:gas_manager_mandob/Services/Routes.dart';
import 'package:gas_manager_mandob/View/Home/SelectSubSupplier.dart';
import 'package:gas_manager_mandob/View/Widgets/AppBar/AppBarCustom.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBarCustom(context, 'اختر نوع الخدمة'),
      body: Center(
        child: SizedBox(
          width: Responsive.getWidth(context) * .8,
          child: ListView(physics: BouncingScrollPhysics(), children: [
            Gap(60),
            GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 45,
                crossAxisSpacing: 30,
              ),
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: kBaseThirdyColor.withAlpha(50),
                            blurRadius: 10)
                      ],
                      color: kSecendryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "قريباً",
                        style: style18semibold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => CustomRoute.RouteReplacementTo(
                      context, SelectSubSupplier()),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: kBaseThirdyColor.withAlpha(50),
                            blurRadius: 10)
                      ],
                      color: kThirdryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          foregroundColor: kFourthColor,
                          backgroundColor: kBaseColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/svg/gas.svg',
                              color: kSecendryColor,
                            ),
                          ),
                        ),
                        MaxGap(10),
                        Text(
                          "غاز",
                          style: style15semibold,
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: kBaseThirdyColor.withAlpha(50),
                            blurRadius: 10)
                      ],
                      color: kThirdryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "قريباً",
                        style: style18semibold,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: kBaseThirdyColor.withAlpha(50),
                            blurRadius: 10)
                      ],
                      color: kSecendryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "قريباً",
                        style: style18semibold,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: kBaseThirdyColor.withAlpha(50),
                            blurRadius: 10)
                      ],
                      color: kSecendryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "قريباً",
                        style: style18semibold,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: kBaseThirdyColor.withAlpha(50),
                            blurRadius: 10)
                      ],
                      color: kThirdryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "قريباً",
                        style: style18semibold,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    ));
  }
}
