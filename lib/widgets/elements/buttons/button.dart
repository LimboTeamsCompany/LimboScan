import 'package:flutter/material.dart';
import 'package:limboscan/utils/theme/theme_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.text,
      this.width,
      this.onTap,
      this.outlined = false,
      this.height,
      this.rounded = true,
      this.backgroundColor});
  final String text;
  final double? height, width;
  final bool outlined, rounded;
  final Color? backgroundColor;
  final void Function()? onTap;

  Color getBackgroundColor(BuildContext context) {
    if (outlined) return Colors.transparent;

    return backgroundColor ?? colorPmy(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: backgroundColor ?? colorPmy(context)),
            color: getBackgroundColor(context),
            borderRadius: BorderRadius.circular(rounded ? 100 : 0)),
        height: height ?? 6.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: outlined ? colorPmy(context) : Colors.white,
                  fontFamily: 'Mulish',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
