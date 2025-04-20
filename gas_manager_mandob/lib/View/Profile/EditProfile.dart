import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Constant/styles.dart';
import 'package:gas_manager_mandob/Services/Responsive.dart';
import 'package:gas_manager_mandob/Services/Routes.dart';
import 'package:gas_manager_mandob/View/AboutUs/AboutUs.dart';
import 'package:gas_manager_mandob/View/ContactUs/ContactUs.dart';
import 'package:gas_manager_mandob/View/E_Wallet/E_Wallet.dart';
import 'package:gas_manager_mandob/View/PrivacyPolicy/PricacyPolicy.dart';
import 'package:gas_manager_mandob/View/Widgets/TextInput/TextInputCustom.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Color(0xff1B2A36),
                  Color(0xff35536B),
                ])),
            child: ListView(
              children: [
                Gap(10),
                CircleAvatar(
                  backgroundColor: kBaseColor,
                  foregroundColor: kBaseColor,
                  radius: 100,
                ),
                Gap(10),
                Center(
                    child: Text(
                  "اسم المستخدم",
                  style: TextStyle(
                      color: kBaseColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )),
                Gap(20),
                CustomSectionDrawer(
                    assetsvg: 'assets/svg/orderDrawer.svg',
                    titile: "كشف حساب يومي"),
                Gap(20),
                CustomSectionDrawer(
                    assetsvg: 'assets/svg/profile.svg',
                    titile: "الصفحة الشخصية"),
                Gap(20),
                CustomSectionDrawer(
                    assetsvg: 'assets/svg/noti.svg', titile: "الإشعارات"),
                Gap(20),
                CustomSectionDrawer(
                    assetsvg: 'assets/svg/e_wallet.svg',
                    titile: "المحفظة الالكترونية",
                    nextpage: E_Wallet()),
                Gap(20),
                CustomSectionDrawer(
                    assetsvg: 'assets/svg/about_us.svg',
                    titile: "من نحن",
                    nextpage: AboutUs()),
                Gap(20),
                CustomSectionDrawer(
                  assetsvg: 'assets/svg/priv_poli.svg',
                  titile: "سياسة الخصوصية",
                  nextpage: PricacyPolicy(),
                ),
                Gap(20),
                CustomSectionDrawer(
                  assetsvg: 'assets/svg/contact_us.svg',
                  titile: "تواصل معنا",
                  nextpage: ContactUs(),
                )
              ],
            )),
      ),
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () => scaffoldKey.currentState?.openDrawer(),
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
        leading: Container(),
        backgroundColor: Color(0xff445461),
        centerTitle: true,
        title: Text("تعديل الصفحة الشخصية"),
      ),
      body: Center(
        child: SizedBox(
          width: Responsive.getWidth(context) * .9,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Gap(30),
              Text(
                "الاسم المستخدم",
                style: style15semibold,
              ),
              Gap(10),
              TextInputCustom(
                  type: TextInputType.name,
                  icon: Icon(
                    CupertinoIcons.profile_circled,
                    color: kPrimaryColor,
                    size: 20,
                  )),
              Gap(10),
              Text(
                "الايميل",
                style: style15semibold,
              ),
              Gap(10),
              TextInputCustom(
                  type: TextInputType.emailAddress,
                  icon: Icon(
                    CupertinoIcons.mail_solid,
                    color: kPrimaryColor,
                    size: 20,
                  )),
              Gap(10),
              Text(
                "رقم الهاتف",
                style: style15semibold,
              ),
              Gap(10),
              TextInputCustom(
                  type: TextInputType.phone,
                  icon: Icon(
                    CupertinoIcons.phone_fill,
                    color: kPrimaryColor,
                    size: 20,
                  )),
              Gap(10),
              Text(
                "رقم الحساب البنكي",
                style: style15semibold,
              ),
              Gap(10),
              TextInputCustom(
                  type: TextInputType.text,
                  icon: Icon(
                    Icons.account_balance_wallet_rounded,
                    color: kPrimaryColor,
                    size: 20,
                  )),
              Gap(10),
              Text(
                "المورد الافتراضي",
                style: style15semibold,
              ),
              Gap(10),
              DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                    hint: Text(
                      "اسم المورد",
                      style: style15semibold,
                    ),
                    isDense: true,
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        isDense: true,
                        fillColor: kThirdryColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        )),
                    onChanged: (value) {},
                    items: ['المورد 1', 'المورد 2']
                        .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              "$e",
                              style: style15semibold,
                            )))
                        .toList()),
              ),
              Gap(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "لوغو الحساب",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(70),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        color: kSecendryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.add,
                      color: kBaseColor,
                    ),
                  )
                ],
              ),
              Gap(43),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topRight,
                          colors: [
                            Color(0xff1B2A36),
                            Color(0xff35536B),
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Center(
                        child: Text(
                      "حفظ التعديلات",
                      style: TextStyle(
                          color: kBaseColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class CustomSectionDrawer extends StatelessWidget {
  CustomSectionDrawer({this.assetsvg, this.nextpage, this.titile});
  String? titile;
  String? assetsvg;
  Widget? nextpage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CustomRoute.RouteTo(context, nextpage!),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: kBaseColor,
              radius: 30,
              child: SvgPicture.asset(
                assetsvg!,
                width: 35,
              ),
            ),
            Gap(10),
            Text(titile!,
                style: TextStyle(
                    color: kBaseColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }
}
