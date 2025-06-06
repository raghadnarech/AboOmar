// ignore_for_file: unnecessary_string_escapes, library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:gaz_mandob/Constant/colors.dart';
import 'package:intl/intl.dart' as Intl;
import 'package:provider/provider.dart';
import 'package:gaz_mandob/Constant/styles.dart';
import 'package:gaz_mandob/Services/Responsive.dart';
import 'package:gaz_mandob/View/Noificition/Controller/NotificationController.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // endDrawer: CustomDrawer(),
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: Text(
            "الاشعارات",
            style: style15semiboldwhite,
          ),
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Consumer<NotificationController>(
            builder: (context, controller, child) => ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.notifications.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            color: kFourthColor,
                            width: Responsive.getWidth(context) * 0.025,
                            height: Responsive.getHeight(context) * 0.013,
                          ),
                          Gap(16),
                          Padding(
                            padding: const EdgeInsets.only(top: 14),
                            child: Text(
                              "${controller.notifications[index].text}",
                              style: style12semibold,
                              textDirection: TextDirection.ltr,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ],
                      ),
                      // Gap(5),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 12, left: 12, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              textDirection: TextDirection.ltr,
                              "${Intl.DateFormat('yyyy-MM-dd  hh:mm a').format(DateTime.parse(controller.notifications[index].createdAt.toString()))}",
                              style: TextStyle(fontSize: 12),
                            ),
                            //   Gap(130),
                            Text(
                              "10\3\1992",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
