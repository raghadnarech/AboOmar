// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:supplier/View/MainCategorey/MainCategoriesPage.dart';
import 'package:supplier/View/HomePage/HomePage.dart';
import 'package:supplier/View/Profile/ProfilePage.dart';

class MainPage extends StatefulWidget {
  MainPage();

  @override
  State<MainPage> createState() => _MainPageState();
}

int? currentIndex = 1;

class _MainPageState extends State<MainPage> {
  final List<Widget> screens = [
    HomePage(),
    MainCategoriesPage(),
    ProfilePage()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentIndex!],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex!,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'الصفحة الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_rounded),
              label: 'الأصناف',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'البروفايل',
            ),
          ],
        ),
      ),
    );
  }
}
