import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Constant/styles.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          key: scaffoldKey,
          endDrawer: Drawer(),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: kBaseColor,
              boxShadow: [
                BoxShadow(
                    color: kBaseThirdyColor.withAlpha(150),
                    blurRadius: 7,
                    offset: Offset(0, 0))
              ],
            ),
            height: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15),
                      border: Border.all(color: kFourthColor)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svg/whatsapp.svg"),
                        Gap(10),
                        Text(
                          "مشاركة عن طريق واتساب",
                          style: TextStyle(color: kFourthColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(10),
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15),
                      border: Border.all(color: kPrimaryColor)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svg/excel.svg"),
                        Gap(10),
                        Text("XL ملف"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
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
            title: Text("اسم المندوب"),
            bottom: PreferredSize(
              preferredSize: Size(Responsive.getWidth(context),
                  Responsive.getHeight(context) * .08),
              child: Column(
                children: [
                  Container(
                    color: kBaseColor,
                    height: 12,
                  ),
                  Container(
                    color: kBaseSecandryColor,
                    child: TabBar(
                      physics: BouncingScrollPhysics(),
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      labelColor: kBaseThirdyColor,
                      unselectedLabelColor: kSecendryColor,
                      tabs: [
                        Tab(child: Text("حالة التوفر")),
                        Tab(child: Text("حالات الإلغاء")),
                        Tab(child: Text("حالة المندوب")),
                        Tab(child: Text("الطلبات")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              available_reports(),
              cancel_reports(),
              agent_status_reports(),
              order_reports(),
            ],
          ),
        ),
      ),
    );
  }
}

class order_reports extends StatelessWidget {
  const order_reports({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: [
                Text("التاريخ"),
                Text("من"),
                SizedBox(
                    width: 100,
                    child: TextFormField(
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                      cursorHeight: 15,
                      // cursorHeight: 20,
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus!.unfocus(),
                      // enabled: false,
                      decoration: InputDecoration(
                        constraints: BoxConstraints.expand(height: 30),
                        suffixIcon: Icon(
                          Icons.calendar_month,
                          size: 15,
                        ),
                        suffixIconConstraints:
                            BoxConstraints.expand(width: 25, height: 15),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        isDense: true,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        fillColor: kThirdryColor,
                        filled: true,
                      ),
                    )),
                Text("إلى"),
                SizedBox(
                    width: 100,
                    child: TextFormField(
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                      cursorHeight: 15,
                      // cursorHeight: 20,
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus!.unfocus(),
                      // enabled: false,
                      decoration: InputDecoration(
                        constraints: BoxConstraints.expand(height: 30),
                        suffixIcon: Icon(
                          Icons.calendar_month,
                          size: 15,
                        ),
                        suffixIconConstraints:
                            BoxConstraints.expand(width: 25, height: 15),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        isDense: true,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        fillColor: kThirdryColor,
                        filled: true,
                      ),
                    )),
              ],
            ),
            Gap(20),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: [
                Text("الوقت"),
                Text("من"),
                SizedBox(
                  width: 100,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                        isDense: true,
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2),
                            isDense: true,
                            fillColor: kThirdryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            )),
                        onChanged: (value) {},
                        items: []
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  "$e",
                                  style: style15semibold,
                                )))
                            .toList()),
                  ),
                ),
                Text("إلى"),
                SizedBox(
                  width: 100,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                        isDense: true,
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2),
                            isDense: true,
                            fillColor: kThirdryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            )),
                        onChanged: (value) {},
                        items: []
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  "$e",
                                  style: style15semibold,
                                )))
                            .toList()),
                  ),
                ),
              ],
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 100,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kFourthColor,
                  ),
                  child: Center(
                    child: Text(
                      "بحث",
                      style: TextStyle(
                        color: kBaseColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Gap(10),
            Container(
              decoration: BoxDecoration(
                  color: kBaseColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: kFourthColor)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("رقم الطلب"),
                            Gap(20),
                            Text("7418596"),
                          ],
                        ),
                        Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("وقت الالغاء"),
                            Gap(20),
                            Text("7418596"),
                          ],
                        ),
                      ],
                    ),
                    Gap(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("رقم الطلب"),
                            Gap(20),
                            Text("7418596"),
                          ],
                        ),
                        Gap(20),
                        Container(
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: kBaseSecandryColor,
                          ),
                          child: Center(
                            child: Text(
                              "التفاصيل",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Gap(10),
            Container(
              decoration: BoxDecoration(
                  color: kBaseColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: kFourthColor)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("رقم الطلب"),
                            Gap(20),
                            Text("7418596"),
                          ],
                        ),
                        Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("وقت الالغاء"),
                            Gap(20),
                            Text("7418596"),
                          ],
                        ),
                      ],
                    ),
                    Gap(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("رقم الطلب"),
                            Gap(20),
                            Text("7418596"),
                          ],
                        ),
                        Gap(20),
                        Container(
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: kBaseSecandryColor,
                          ),
                          child: Center(
                            child: Text(
                              "التفاصيل",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class agent_status_reports extends StatelessWidget {
  const agent_status_reports({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: [
                Text("التاريخ"),
                Text("من"),
                SizedBox(
                    width: 100,
                    child: TextFormField(
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                      cursorHeight: 15,
                      // cursorHeight: 20,
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus!.unfocus(),
                      // enabled: false,
                      decoration: InputDecoration(
                        constraints: BoxConstraints.expand(height: 30),
                        suffixIcon: Icon(
                          Icons.calendar_month,
                          size: 15,
                        ),
                        suffixIconConstraints:
                            BoxConstraints.expand(width: 25, height: 15),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        isDense: true,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        fillColor: kThirdryColor,
                        filled: true,
                      ),
                    )),
                Text("إلى"),
                SizedBox(
                    width: 100,
                    child: TextFormField(
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                      cursorHeight: 15,
                      // cursorHeight: 20,
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus!.unfocus(),
                      // enabled: false,
                      decoration: InputDecoration(
                        constraints: BoxConstraints.expand(height: 30),
                        suffixIcon: Icon(
                          Icons.calendar_month,
                          size: 15,
                        ),
                        suffixIconConstraints:
                            BoxConstraints.expand(width: 25, height: 15),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        isDense: true,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        fillColor: kThirdryColor,
                        filled: true,
                      ),
                    )),
              ],
            ),
            Gap(20),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: [
                Text("الوقت"),
                Text("من"),
                SizedBox(
                  width: 100,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                        isDense: true,
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2),
                            isDense: true,
                            fillColor: kThirdryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            )),
                        onChanged: (value) {},
                        items: []
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  "$e",
                                  style: style15semibold,
                                )))
                            .toList()),
                  ),
                ),
                Text("إلى"),
                SizedBox(
                  width: 100,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                        isDense: true,
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2),
                            isDense: true,
                            fillColor: kThirdryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            )),
                        onChanged: (value) {},
                        items: []
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  "$e",
                                  style: style15semibold,
                                )))
                            .toList()),
                  ),
                ),
              ],
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 100,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kFourthColor,
                  ),
                  child: Center(
                    child: Text(
                      "بحث",
                      style: TextStyle(
                        color: kBaseColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Gap(10),
            Text("22 / 10 / 2023"),
            Gap(10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  size: 15,
                  color: kFourthColor,
                ),
                Gap(10),
                Text("رقم الطلب"),
                Gap(10),
                Text("74185296"),
                Gap(10),
                Text("اون لاين مشغول"),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  size: 15,
                  color: kFourthColor,
                ),
                Gap(10),
                Text("رقم الطلب"),
                Gap(10),
                Text("74185296"),
                Gap(10),
                Text("اون لاين مشغول"),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  size: 15,
                  color: kFourthColor,
                ),
                Gap(10),
                Text("رقم الطلب"),
                Gap(10),
                Text("74185296"),
                Gap(10),
                Text("اون لاين مشغول"),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  size: 15,
                  color: kFourthColor,
                ),
                Gap(10),
                Text("رقم الطلب"),
                Gap(10),
                Text("74185296"),
                Gap(10),
                Text("اون لاين مشغول"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class cancel_reports extends StatelessWidget {
  const cancel_reports({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: [
                Text("التاريخ"),
                Text("من"),
                SizedBox(
                    width: 100,
                    child: TextFormField(
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                      cursorHeight: 15,
                      // cursorHeight: 20,
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus!.unfocus(),
                      // enabled: false,
                      decoration: InputDecoration(
                        constraints: BoxConstraints.expand(height: 30),
                        suffixIcon: Icon(
                          Icons.calendar_month,
                          size: 15,
                        ),
                        suffixIconConstraints:
                            BoxConstraints.expand(width: 25, height: 15),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        isDense: true,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        fillColor: kThirdryColor,
                        filled: true,
                      ),
                    )),
                Text("إلى"),
                SizedBox(
                    width: 100,
                    child: TextFormField(
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                      cursorHeight: 15,
                      // cursorHeight: 20,
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus!.unfocus(),
                      // enabled: false,
                      decoration: InputDecoration(
                        constraints: BoxConstraints.expand(height: 30),
                        suffixIcon: Icon(
                          Icons.calendar_month,
                          size: 15,
                        ),
                        suffixIconConstraints:
                            BoxConstraints.expand(width: 25, height: 15),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        isDense: true,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        fillColor: kThirdryColor,
                        filled: true,
                      ),
                    )),
              ],
            ),
            Gap(20),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: [
                Text("الوقت"),
                Text("من"),
                SizedBox(
                  width: 100,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                        isDense: true,
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2),
                            isDense: true,
                            fillColor: kThirdryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            )),
                        onChanged: (value) {},
                        items: []
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  "$e",
                                  style: style15semibold,
                                )))
                            .toList()),
                  ),
                ),
                Text("إلى"),
                SizedBox(
                  width: 100,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                        isDense: true,
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2),
                            isDense: true,
                            fillColor: kThirdryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            )),
                        onChanged: (value) {},
                        items: []
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  "$e",
                                  style: style15semibold,
                                )))
                            .toList()),
                  ),
                ),
              ],
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 100,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kFourthColor,
                  ),
                  child: Center(
                    child: Text(
                      "بحث",
                      style: TextStyle(
                        color: kBaseColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Gap(10),
            Container(
              decoration: BoxDecoration(
                  color: kBaseColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: kFourthColor)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("رقم الطلب"),
                            Gap(20),
                            Text("7418596"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("وقت الالغاء"),
                            Gap(20),
                            Text("7418596"),
                          ],
                        ),
                        Text("سبب الالغاء"),
                        Text("تعديل المحتوى"),
                      ],
                    ),
                    Gap(20),
                    Row(
                      children: [
                        Text("وقت الاستلام"),
                        Gap(20),
                        Text("7418596"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Gap(10),
            Container(
              decoration: BoxDecoration(
                  color: kBaseColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: kFourthColor)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("رقم الطلب"),
                            Gap(20),
                            Text("7418596"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("وقت الالغاء"),
                            Gap(20),
                            Text("7418596"),
                          ],
                        ),
                        Text("سبب الالغاء"),
                        Text("تعديل المحتوى"),
                      ],
                    ),
                    Gap(20),
                    Row(
                      children: [
                        Text("وقت الاستلام"),
                        Gap(20),
                        Text("7418596"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Gap(10),
            Container(
              decoration: BoxDecoration(
                  color: kBaseColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: kFourthColor)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("رقم الطلب"),
                            Gap(20),
                            Text("7418596"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("وقت الالغاء"),
                            Gap(20),
                            Text("7418596"),
                          ],
                        ),
                        Text("سبب الالغاء"),
                        Text("تعديل المحتوى"),
                      ],
                    ),
                    Gap(20),
                    Row(
                      children: [
                        Text("وقت الاستلام"),
                        Gap(20),
                        Text("7418596"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Gap(10)
          ],
        ),
      ),
    );
  }
}

class available_reports extends StatelessWidget {
  const available_reports({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: [
                Text("التاريخ"),
                Text("من"),
                SizedBox(
                    width: 100,
                    child: TextFormField(
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                      cursorHeight: 15,
                      // cursorHeight: 20,
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus!.unfocus(),
                      // enabled: false,
                      decoration: InputDecoration(
                        constraints: BoxConstraints.expand(height: 30),
                        suffixIcon: Icon(
                          Icons.calendar_month,
                          size: 15,
                        ),
                        suffixIconConstraints:
                            BoxConstraints.expand(width: 25, height: 15),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        isDense: true,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        fillColor: kThirdryColor,
                        filled: true,
                      ),
                    )),
                Text("إلى"),
                SizedBox(
                    width: 100,
                    child: TextFormField(
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start,
                      cursorHeight: 15,
                      // cursorHeight: 20,
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus!.unfocus(),
                      // enabled: false,
                      decoration: InputDecoration(
                        constraints: BoxConstraints.expand(height: 30),
                        suffixIcon: Icon(
                          Icons.calendar_month,
                          size: 15,
                        ),
                        suffixIconConstraints:
                            BoxConstraints.expand(width: 25, height: 15),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        isDense: true,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        fillColor: kThirdryColor,
                        filled: true,
                      ),
                    )),
              ],
            ),
            Gap(20),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: [
                Text("الوقت"),
                Text("من"),
                SizedBox(
                  width: 100,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                        isDense: true,
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2),
                            isDense: true,
                            fillColor: kThirdryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            )),
                        onChanged: (value) {},
                        items: []
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  "$e",
                                  style: style15semibold,
                                )))
                            .toList()),
                  ),
                ),
                Text("إلى"),
                SizedBox(
                  width: 100,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                        isDense: true,
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2),
                            isDense: true,
                            fillColor: kThirdryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            )),
                        onChanged: (value) {},
                        items: []
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  "$e",
                                  style: style15semibold,
                                )))
                            .toList()),
                  ),
                ),
              ],
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 100,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kFourthColor,
                  ),
                  child: Center(
                    child: Text(
                      "بحث",
                      style: TextStyle(
                        color: kBaseColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Gap(10),
            Text("22 / 10 / 2023"),
            Gap(10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  size: 15,
                  color: kFourthColor,
                ),
                Gap(10),
                Text("اون لاين من الساعة 2 - 3")
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  size: 15,
                  color: kFourthColor,
                ),
                Gap(10),
                Text("اون لاين من الساعة 2 - 3")
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  size: 15,
                  color: kFourthColor,
                ),
                Gap(10),
                Text("اون لاين من الساعة 2 - 3")
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  size: 15,
                  color: kFourthColor,
                ),
                Gap(10),
                Text("اون لاين من الساعة 2 - 3")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
