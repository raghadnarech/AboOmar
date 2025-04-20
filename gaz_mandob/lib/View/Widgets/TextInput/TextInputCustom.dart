// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gaz_mandob/Constant/colors.dart';

class TextInputCustom extends StatefulWidget {
  TextInputCustom({
    this.icon,
    this.type,
    this.controller,
    this.hint,
    this.ispassword = false,
  });
  Widget? icon;
  TextInputType? type;
  String? hint;
  bool? ispassword;
  TextEditingController? controller;
  @override
  State<TextInputCustom> createState() => _TextInputCustomState();
}

class _TextInputCustomState extends State<TextInputCustom> {
  bool? showpassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.type,
      obscureText: showpassword!,
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        suffixIcon:
            widget.ispassword!
                ? showpassword!
                    ? GestureDetector(
                      onTap:
                          () => setState(() {
                            showpassword = !showpassword!;
                          }),
                      child: Icon(
                        Icons.visibility_off_rounded,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                    )
                    : GestureDetector(
                      onTap:
                          () => setState(() {
                            showpassword = !showpassword!;
                          }),
                      child: Icon(
                        Icons.visibility,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                    )
                : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        hintText: widget.hint,
        fillColor: kThirdryColor,
        contentPadding: EdgeInsets.all(8),
        isDense: true,
      ),
    );
  }
}
