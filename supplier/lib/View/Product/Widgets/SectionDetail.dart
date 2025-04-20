// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:supplier/Constant/styles.dart';

class SectionDetail extends StatelessWidget {
  SectionDetail({this.title, this.detail});
  String? title;
  String? detail;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            title!,
            style: style12semibold,
          ),
          Gap(35),
          detail == null
              ? Container()
              : AutoSizeText(
                  "${detail!}",
                  style: style12semibold,
                )
        ],
      ),
    );
  }
}
