import 'package:flutter/material.dart';
import 'package:limboscan/utils/theme/theme_utils.dart';
import 'package:oktoast/oktoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void toast(
  String text, {
  int? seconds,
  bool log = false,
  bool isError = false,
  ToastPosition? position,
}) {
  showToastWidget(
    MediaQuery(
      data: const MediaQueryData(),
      child: SizedBox(
        width: 92.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            toastContent(text, isError: isError, log: log),
          ],
        ),
      ),
    ),
    duration: seconds == null ? null : Duration(seconds: seconds),
    position: position ?? ToastPosition.top,
  );
}

Widget toastContent(String text, {bool log = false, bool isError = false}) {
  return Builder(builder: (context) {
    return Container(
      width: 88.w,
      padding: EdgeInsets.symmetric(
        vertical: 1.h,
        horizontal: 3.w,
      ),
      decoration: BoxDecoration(
        color: colorPmy(context),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 4.w,
                color: Colors.white,
              ),
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  });
}
