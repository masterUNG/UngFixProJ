import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Color(0xff389310);
  Color primaryColor = Color(0xff6dc446);
  Color lightColor = Color(0xff0f776);

  BoxDecoration mainBG() => BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(15),
      );

  BoxDecoration mainBGwhite() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      );

  MyStyle();
}
