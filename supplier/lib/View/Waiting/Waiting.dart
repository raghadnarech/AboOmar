import 'package:flutter/material.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Constant/styles.dart';
import 'package:supplier/Services/Responsive.dart';

class Waiting extends StatefulWidget {
  const Waiting({super.key});

  @override
  State<Waiting> createState() => _WaitingState();
}

class _WaitingState extends State<Waiting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 131,
            flexibleSpace: Stack(
              children: [
                Positioned(
                    top: 0,
                    width: Responsive.getWidth(context),
                    height: 95,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: Container(
                        width: Responsive.getWidth(context),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          image: DecorationImage(
                            image: AssetImage('assets/images/appbar.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: Responsive.getHeight(context) * 0.12,
              width: Responsive.getWidth(context) * 0.9,
              decoration: BoxDecoration(
                color: kBaseSecandryColor,
                border: Border.all(
                  color: kFourthColor,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Text(
                  "اهلا بك سيتم الرد على قبول طلبك قيد التدقيق",
                  style: style15semibold,
                ),
              ),
            ),
          )),
    );
  }
}
