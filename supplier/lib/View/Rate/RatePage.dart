import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/View/MainPage/Controller/MainPageController.dart';
import 'package:supplier/View/MainPage/MainPage.dart';
import 'package:supplier/View/Rate/Controller/RateController.dart';
import 'package:supplier/View/Widgets/TextInput/TextInputCustom.dart';
import 'package:provider/provider.dart';

class RatePage extends StatelessWidget {
  const RatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        backgroundColor: Color(0xff445461),
        centerTitle: true,
        title: Text(
          "تقييم المورد",
          style: style15semibold,
        ),
      ),
      body: Consumer<RateController>(
        builder: (context, controller, child) => ListView(
          padding: EdgeInsets.all(8),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("تقييم المندوب"),
                RatingBar(
                  minRating: 1,
                  maxRating: 5,
                  allowHalfRating: false,
                  itemSize: 25,
                  ratingWidget: RatingWidget(
                      full: Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      half: Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      empty: Icon(
                        Icons.star_border_outlined,
                        color: Colors.amber,
                      )),
                  glow: false,
                  onRatingUpdate: (value) {
                    controller.stars = value;
                  },
                )
              ],
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextInputCustom(
                controller: controller.comment,
              ),
            ),
            Gap(100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("تقييم الخدمة"),
                RatingBar(
                  allowHalfRating: false,
                  itemSize: 25,
                  minRating: 1,
                  maxRating: 5,
                  ratingWidget: RatingWidget(
                      full: Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      half: Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      empty: Icon(
                        Icons.star_border_outlined,
                        color: Colors.amber,
                      )),
                  glow: false,
                  onRatingUpdate: (value) {},
                ),
              ],
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextInputCustom(),
            ),
            Gap(150),
            GestureDetector(
              onTap: () {
                controller.Rate(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topRight,
                          colors: [
                            Color(0xff722B23),
                            Color(0xffE45545),
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Center(
                        child: Text(
                      "ارسال",
                      style: TextStyle(
                          color: kBaseColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
              ),
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: GestureDetector(
                onTap: () {
                  CustomRoute.RouteAndRemoveUntilTo(
                    context,
                    ChangeNotifierProvider<MainPageController>(
                      create: (context) => MainPageController()
                        ..GetMyInvoices()
                        ..GetProfile()
                        ..GetMainCategory(),
                      builder: (context, child) => MainPage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        kPrimaryColor,
                        kBaseThirdyColor,
                      ],
                      begin: Alignment.bottomRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Center(
                        child: Text(
                      "تخطي",
                      style: style15semiboldwhite,
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
