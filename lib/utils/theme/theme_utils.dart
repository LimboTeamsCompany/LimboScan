// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:limboscan/utils/system/system_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

const Color colorText = Color(0xff5d5e90);
const Color colorYellow = Color(0xffF1B94C);

class ThemeUtils {
  ThemeData getTheme() {
    return ThemeData(
      textTheme: TextTheme(
        bodyMedium: TextStyle(
            color: colorText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Mulish'),
      ),
      colorScheme: ColorScheme.fromSeed(
          primary: const Color(0xff343674),
          seedColor: const Color(0xff343674),
          background: const Color(0xffFFF7E7),
          tertiary: const Color(0xffBE6096),
          surface: const Color(0xff342D39),
          secondary: const Color(0xffFFD37D)),
      useMaterial3: true,
    );
  }

  void setColorToUISystemWithRoute(String route) {
    switch (route) {
      case '/welcome':
        SystemUtils().setUISystemColor(
            color: Colors.transparent, colorBottom: Colors.white);
        break;
      case '/dashboard':
        SystemUtils().setUISystemColor(
            color: Colors.transparent, colorBottom: const Color(0xffFFF7E7));
        break;
      case '/camera':
        SystemUtils().setUISystemColor(color: Colors.transparent);
        break;

      case '/urlPreview':
        SystemUtils().setUISystemColor(
            color: const Color(0xfffcd681),
            colorBottom: const Color(0xff343674));

        break;
      default:
    }
  }
}

Color Function(BuildContext) colorPmy =
    (BuildContext context) => Theme.of(context).colorScheme.primary;

Color Function(BuildContext) colorPmyVar =
    (BuildContext context) => Theme.of(context).colorScheme.primaryContainer;
Color colorPmyVarTiny = const Color(0xffEFF2FE);
Color Function(BuildContext) colorSdy =
    (BuildContext context) => Theme.of(context).colorScheme.secondary;
Color Function(BuildContext) colorTry =
    (BuildContext context) => Theme.of(context).colorScheme.tertiary;
Color Function(BuildContext) colorBgy =
    (BuildContext context) => Theme.of(context).colorScheme.background;
