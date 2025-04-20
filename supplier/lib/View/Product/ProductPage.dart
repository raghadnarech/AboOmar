// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Model/Category.dart';
import 'package:supplier/Model/SubCategory.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/View/Drawer/Drawer.dart';
import 'package:supplier/View/Product/Add/AddProduct.dart';
import 'package:supplier/View/Product/Add/Controller/AddProcductController.dart';
import 'package:supplier/View/Product/Widgets/CardProduct.dart';
import 'package:supplier/View/Product/Controller/ProductPageController.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class ProductPage extends StatelessWidget {
  ProductPage({this.category, this.subCategory});
  Category? category;
  SubCategory? subCategory;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: CustomDrawer(),
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
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: Text(
            "قسم ${subCategory!.name}",
            style: style15semiboldwhite,
          ),
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "المنتجات ",
                  style: style15semibold,
                ),
                GestureDetector(
                  onTap: () {
                    CustomRoute.RouteReplacementTo(
                        context,
                        ChangeNotifierProvider<AddProductController>(
                          create: (context) => AddProductController(),
                          builder: (context, child) => AddProduct(
                            category: category,
                            subCategory: subCategory,
                          ),
                        ));
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: kFourthColor,
                    ),
                    child: Icon(
                      Icons.add,
                      color: kBaseColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Consumer<ProductPageController>(
              builder: (context, controller, child) => controller
                      .isloadinggetproduct
                  ? GridView.builder(
                      itemCount: 6,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // childAspectRatio: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      padding: EdgeInsets.all(16),
                      itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor:
                            Color.fromARGB(255, 229, 229, 229).withAlpha(150),
                        highlightColor: kBaseColor.withAlpha(100),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kBaseColor,
                          ),
                          width: double.infinity,
                          child: Text(''),
                        ),
                      ),
                    )
                  : controller.listproduct.isEmpty
                      ? Center(
                          child: Text("لايوجد منتجات بعد"),
                        )
                      : GridView.builder(
                          padding: EdgeInsets.all(16),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  // childAspectRatio: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.listproduct.length,
                          itemBuilder: (context, index) => CardProduct(
                                product: controller.listproduct[index],
                                subCategory: subCategory,
                                category: category,
                              ))),
          // Gap(20),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 50),
          //   child: GestureDetector(
          //     onTap: () {
          //       CustomRoute.RouteReplacementTo(
          //           context,
          //           ChangeNotifierProvider<EditeSubCategoreyController>(
          //             create: (context) => EditeSubCategoreyController()
          //               ..initstate(subCategory!),
          //             builder: (context, child) => EditeSubCategorey(
          //               subCategory: subCategory,
          //               category: category,
          //             ),
          //           ));
          //     },
          //     child: Container(
          //       height: 50,
          //       decoration: BoxDecoration(
          //         gradient: LinearGradient(
          //           colors: [
          //             kPrimaryColor,
          //             kBaseThirdyColor,
          //           ],
          //           begin: Alignment.bottomRight,
          //           end: Alignment.bottomLeft,
          //         ),
          //         borderRadius: BorderRadius.circular(30),
          //       ),
          //       child: Center(
          //           child: Text(
          //         " تعديل التصنيف الفرعي",
          //         style: style15semiboldwhite,
          //       )),
          //     ),
          //   ),
          // ),
          // Gap(10),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 50),
          //   child: GestureDetector(
          //     onTap: () {
          //       showDialog(
          //         context: context,
          //         barrierDismissible: false,
          //         barrierLabel: '',
          //         barrierColor: Colors.transparent,
          //         builder: (BuildContext context) {
          //           return BackdropFilter(
          //             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          //             child: Dialog(
          //               insetPadding: EdgeInsets.all(15),
          //               elevation: 10,
          //               alignment: Alignment(0, -.4),
          //               child: Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Stack(
          //                   children: [
          //                     Positioned(
          //                       top: 0,
          //                       left: 0,
          //                       child: GestureDetector(
          //                         onTap: () {
          //                           CustomRoute.RoutePop(context);
          //                         },
          //                         child: Icon(
          //                           Icons.close,
          //                           color: kBaseThirdyColor,
          //                           size: 18,
          //                         ),
          //                       ),
          //                     ),
          //                     Padding(
          //                       padding: const EdgeInsets.only(top: 20),
          //                       child: Column(
          //                         mainAxisSize: MainAxisSize.min,
          //                         mainAxisAlignment: MainAxisAlignment.start,
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: [
          //                           Text(
          //                             "هل انت متأكد من حذف التصنيف الفرعي مع العلم انه سيتم حذف جميع المنتجات الفرعية ؟",
          //                             style: TextStyle(
          //                                 color: kFourthColor,
          //                                 fontSize: 15,
          //                                 fontWeight: FontWeight.w600),
          //                           ),
          //                           Gap(20),
          //                           Padding(
          //                             padding: const EdgeInsets.symmetric(
          //                                 vertical: 20),
          //                             child: Row(
          //                               mainAxisAlignment:
          //                                   MainAxisAlignment.spaceAround,
          //                               children: [
          //                                 Consumer<EditeSubCategoreyController>(
          //                                   builder:
          //                                       (context, controller, child) {
          //                                     return GestureDetector(
          //                                         onTap: () {
          //                                           controller
          //                                               .DeleteSubCategory(
          //                                             context,
          //                                             category!,
          //                                             subCategory!.id!,
          //                                           );
          //                                         },
          //                                         child: Text(
          //                                           "نعم ",
          //                                           style: TextStyle(
          //                                               color: kFourthColor,
          //                                               fontSize: 14,
          //                                               fontWeight:
          //                                                   FontWeight.w500),
          //                                         ));
          //                                   },
          //                                 ),
          //                                 Gap(10),
          //                                 GestureDetector(
          //                                     onTap: () {
          //                                       CustomRoute.RoutePop(context);
          //                                     },
          //                                     child: Text(
          //                                       "لا ",
          //                                       style: TextStyle(
          //                                           color: kBaseThirdyColor,
          //                                           fontSize: 14,
          //                                           fontWeight:
          //                                               FontWeight.w500),
          //                                     )),
          //                               ],
          //                             ),
          //                           )
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           );
          //         },
          //       );
          //     },
          //     child: Container(
          //       height: 50,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(30),
          //           gradient: LinearGradient(
          //               begin: Alignment.bottomCenter,
          //               end: Alignment.topRight,
          //               colors: [
          //                 Color(0xff722B23),
          //                 Color(0xffB04135),
          //               ])),
          //       child: Center(
          //         child: Text(
          //           "حذف التصنيف الفرعي",
          //           style: TextStyle(
          //               color: kBaseColor,
          //               fontSize: 15,
          //               fontWeight: FontWeight.w600),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Gap(10)
        ]),
      ),
    );
  }
}
