import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/View/Drawer/Drawer.dart';
import 'package:supplier/View/MainPage/Controller/MainPageController.dart';
import 'package:supplier/View/HomePage/Widget/CardInvoices.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: CustomDrawer(),
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => scaffoldKey.currentState?.openDrawer(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/svg/menu.svg',
                width: 15,
                height: 15,
              ),
            ),
          ),
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: Text(
            "الصفحة الرئيسية",
            style: style15semiboldwhite,
          ),
        ),
        body: Consumer<MainPageController>(
          builder: (context, controller, child) => RefreshIndicator(
            onRefresh: () => controller.GetMyInvoices(),
            child: ListView(
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "الطلبات الواردة",
                    style: style15semibold,
                  ),
                ),
                controller.isloadinggetmyinvoice
                    ? ListView.builder(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) => Shimmer.fromColors(
                          baseColor:
                              Color.fromARGB(255, 229, 229, 229).withAlpha(150),
                          highlightColor: kBaseColor.withAlpha(100),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kBaseColor,
                              ),
                              width: double.infinity,
                              child: Text(''),
                            ),
                          ),
                        ),
                      )
                    : controller.listinvoice.isEmpty
                        ? Center(child: Text("لايوجد طلبات حالياً"))
                        : RefreshIndicator(
                            onRefresh: () => controller.GetMyInvoices(),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.listinvoice.length,
                              itemBuilder: (context, index) => CardInvoices(
                                invoice: controller.listinvoice[index],
                              ),
                            ),
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
