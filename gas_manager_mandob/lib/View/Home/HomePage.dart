import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Constant/styles.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';
import 'package:gas_manager_mandob/Services/Routes.dart';
import 'package:gas_manager_mandob/View/Address/AddAddress.dart';
import 'package:gas_manager_mandob/View/AgentDetails/AgentDetails.dart';
import 'package:gas_manager_mandob/View/Home/ServicesPage.dart';
import 'package:gas_manager_mandob/View/Widgets/AppBar/AppBarCustom.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(),
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () => scaffoldKey.currentState?.openEndDrawer(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/svg/menu.svg',
                width: 30,
                height: 25,
              ),
            ),
          ),
        ],
        backgroundColor: Color(0xff445461),
        centerTitle: true,
        title: Text("الصفحة الرئيسية"),
      ),
      body: Center(
          child: SizedBox(
        width: Responsive.getWidth(context) * .9,
        child: ListView(
          children: [
            ElevatedButton(
                onPressed: () => CustomRoute.RouteTo(context, AgentDetails()),
                child: Text("المندوب"))
          ],
        ),
      )),
    ));
  }
}
