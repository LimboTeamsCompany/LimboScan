import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class SystemUtils {
  Future<void> setUISystemColorAsSection() async {
    await setUISystemColor(
      color: Colors.white,
      colorBottom: Colors.white,
    );
  }

  Future<void> setUISystemColor({
    required Color color,
    bool onlyTop = false,
    Color? colorBottom,
    bool animate = true,
  }) async {
    if (kIsWeb) return;
    await FlutterStatusbarcolor.setStatusBarColor(color, animate: animate);
    if (useWhiteForeground(color)) {
      await FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
      await FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
    } else {
      await FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
      await FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }

    if (onlyTop) return;

    await FlutterStatusbarcolor.setNavigationBarColor(
      colorBottom ?? color,
      animate: animate,
    );

    final bool useWhiteIcons = useWhiteForeground(colorBottom ?? color);

    if (useWhiteIcons || colorBottom == const Color(0xff343674)) {
      await FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
      await FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
    } else {
      await FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
      await FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
    }
  }
}

bool isIos() {
  if (kIsWeb) {
    return false;
  }

  return Platform.isIOS;
}

bool isLandscape(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.landscape;
}

bool isTablet(BuildContext context) {
  return (MediaQuery.of(context).size.height > 1024) || isLandscape(context);
}
