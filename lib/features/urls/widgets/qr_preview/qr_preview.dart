import 'package:flutter/material.dart';
import 'package:limboscan/widgets/url/url_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrPreview extends StatelessWidget {
  const QrPreview({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
          width: 80.w,
          height: 78.w,
          margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h)
              .copyWith(bottom: 6.5.h),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(6.w),
                padding: EdgeInsets.all(6.w),
                width: 68.w,
                height: 68.w,
                child: PrettyQr(
                  data: url,
                ),
              ),
              cornerTopLeft(),
              cornerBottomLeft(),
              cornerBottomRight(),
              cornerTopRight(),
            ],
          ),
        ),
        urlIndicatorPositioned(),
      ],
    );
  }

  Widget cornerTopLeft() {
    return Positioned(
      left: 6.w,
      top: 6.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          horizontalLine(),
          verticalLine(),
        ],
      ),
    );
  }

  Widget cornerBottomLeft() {
    return Positioned(
      left: 6.w,
      bottom: 6.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalLine(),
          horizontalLine(),
        ],
      ),
    );
  }

  Widget cornerBottomRight() {
    return Positioned(
      right: 6.w,
      bottom: 6.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          verticalLine(),
          horizontalLine(),
        ],
      ),
    );
  }

  Widget cornerTopRight() {
    return Positioned(
      right: 6.w,
      top: 6.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          horizontalLine(),
          verticalLine(),
        ],
      ),
    );
  }

  Widget horizontalLine() {
    return Container(
      width: 14.w,
      height: 6,
      color: Colors.black,
    );
  }

  Widget verticalLine() {
    return Container(
      width: 6,
      height: 14.w,
      color: Colors.black,
    );
  }

  Widget urlIndicatorPositioned() {
    return Positioned(
        top: 80.w,
        child: Column(
          children: [
            UrlContainer(
              url: url,
              yellowTheme: true,
            ),
          ],
        ));
  }
}
