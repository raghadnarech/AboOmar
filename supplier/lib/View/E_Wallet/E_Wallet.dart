// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Services/Responsive.dart';
import 'package:supplier/Services/Routes.dart';
import 'package:supplier/View/E_Wallet/Controller/E_WalletController.dart';
import 'package:supplier/View/Widgets/CheckBox/CheckBoxCustom.dart';
import 'package:supplier/View/Widgets/TextInput/TextInputCustom.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class E_Wallet extends StatelessWidget {
  bool mybank = false;

  bool anotherbank = false;

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
          title: Text("المحفظة الالكترونية"),
        ),
        body: Consumer<E_WalletController>(
          builder: (context, controller, child) => Center(
            child: SizedBox(
                width: Responsive.getWidth(context) * .9,
                child: controller.loadingwallet
                    ? LoadingAnimationWidget.fallingDot(
                        color: kPrimaryColor, size: 30)
                    : ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          Gap(10),
                          Text(
                            "المحفظة الخاصة بك",
                            style: TextStyle(
                                color: kFourthColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          Gap(10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "الرصيد المتوافر",
                                style: style12semibold,
                              ),
                              Gap(60),
                              Text(
                                "${controller.walletTrans.balance} ريال",
                                style: style12semibold,
                              ),
                            ],
                          ),
                          Gap(20),
                          Text(
                            "عمليات الإيداع على المحفظة",
                            style: TextStyle(
                                color: kFourthColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Gap(10),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.walletTrans.transaction!
                                .where((element) => element.status == 'add')
                                .length,
                            itemBuilder: (context, index) {
                              final filteredTransactions = controller
                                  .walletTrans.transaction!
                                  .where((element) => element.status == 'add')
                                  .toList();
                              final transaction = filteredTransactions[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: kBaseThirdyColor.withAlpha(50),
                                        offset: Offset(0, 0),
                                        blurRadius: 10,
                                      ),
                                    ],
                                    color: kThirdryColor,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "رقم الطلب",
                                                  style: style15semibold,
                                                ),
                                                Gap(5),
                                                Text(
                                                  "${transaction.number}",
                                                  style: style15semibold,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "${DateFormat('yyyy-MM-dd').format(DateTime.parse(transaction.createdAt.toString()))}",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "المبلغ",
                                                  style: style15semibold,
                                                ),
                                                Gap(15),
                                                Text(
                                                  "${transaction.amount} ريال",
                                                  style: style15semibold,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "رقم الحساب",
                                                  style: style15semibold,
                                                ),
                                                Gap(10),
                                                Text(
                                                  "${transaction.walletId}",
                                                  style: style15semibold,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Text(
                            "عمليات السحب الخاصة بك",
                            style: TextStyle(
                                color: kFourthColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.walletTrans.transaction!
                                .where(
                                    (element) => element.status == 'withdraw')
                                .length,
                            itemBuilder: (context, index) {
                              final filteredTransactions = controller
                                  .walletTrans.transaction!
                                  .where(
                                      (element) => element.status == 'withdraw')
                                  .toList();
                              final transaction = filteredTransactions[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: kBaseThirdyColor.withAlpha(50),
                                        offset: Offset(0, 0),
                                        blurRadius: 10,
                                      ),
                                    ],
                                    color: kThirdryColor,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "رقم الطلب",
                                                  style: style15semibold,
                                                ),
                                                Gap(5),
                                                Text(
                                                  "${transaction.number}",
                                                  style: style15semibold,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "${DateFormat('yyyy-MM-dd').format(DateTime.parse(transaction.createdAt.toString()))}",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "المبلغ",
                                                  style: style15semibold,
                                                ),
                                                Gap(15),
                                                Text(
                                                  "${transaction.amount} ريال",
                                                  style: style15semibold,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "رقم الحساب",
                                                  style: style15semibold,
                                                ),
                                                Gap(10),
                                                Text(
                                                  "${transaction.walletId}",
                                                  style: style15semibold,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Gap(20),
                          ButtonWithdrowTransaction(
                            controller: controller,
                          ),
                        ],
                      )),
          ),
        ),
      ),
    );
  }
}

class ButtonWithdrowTransaction extends StatelessWidget {
  ButtonWithdrowTransaction({required this.controller});
  E_WalletController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          barrierDismissible: false,
          barrierLabel: '',
          context: context,
          barrierColor: Colors.transparent,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Dialog(
                insetPadding: EdgeInsets.all(15),
                elevation: 10,
                alignment: Alignment(0, -.4),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: GestureDetector(
                          onTap: () {
                            CustomRoute.RoutePop(context);
                            controller.anotherbank = false;
                            controller.mybank = false;
                          },
                          child: Icon(
                            Icons.close,
                            color: kBaseThirdyColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "طلب سحب رصيد",
                              style: TextStyle(
                                  color: kFourthColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            Gap(20),
                            Row(
                              children: [
                                Text(
                                  "الرصيد المتاح",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Gap(10),
                                Text(
                                  "${controller.walletTrans.balance} ريال",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Gap(10),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "الرصيد المراد سحبه",
                                  style: style12semibold,
                                ),
                                Gap(20),
                                Expanded(
                                    child: TextInputCustom(
                                  controller: controller.amountcontroller,
                                  hint: '',
                                  ispassword: false,
                                ))
                              ],
                            ),
                            Gap(20),
                            Row(
                              children: [
                                CheckBoxCustom(
                                  color: kFourthColor,
                                  check: controller.mybank,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        controller.mybank = value!;
                                        controller.anotherbank = false;
                                      },
                                    );
                                  },
                                ),
                                Gap(15),
                                Text(
                                  "الحساب البنكي الخاصي بي",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Gap(10),
                            Row(
                              children: [
                                CheckBoxCustom(
                                  color: kFourthColor,
                                  check: controller.anotherbank,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        controller.anotherbank = value!;
                                        controller.mybank = false;
                                      },
                                    );
                                  },
                                ),
                                Gap(15),
                                Text(
                                  "حساب بنكي اخر",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Gap(10),
                            Visibility(
                              visible: controller.anotherbank,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "رقم الحساب البنكي",
                                    style: style12semibold,
                                  ),
                                  Gap(20),
                                  Expanded(
                                      child: TextInputCustom(
                                    controller: controller.otherbank,
                                    hint: '',
                                    ispassword: false,
                                  ))
                                ],
                              ),
                            ),
                            Gap(35),
                            GestureDetector(
                              onTap: () {
                                controller.WithdrawTransaction(context);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Center(
                                        child: Text(
                                      "متابعة",
                                      style: TextStyle(
                                          color: kBaseColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ),
                                ),
                              ),
                            ),
                            Gap(20),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
              "طلب سحب رصيد",
              style: TextStyle(
                  color: kBaseColor, fontSize: 15, fontWeight: FontWeight.w600),
            )),
          ),
        ),
      ),
    );
  }
}
