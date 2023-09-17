import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CameraModalDeniedPermissions extends StatelessWidget {
  const CameraModalDeniedPermissions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h)
          .copyWith(bottom: 3.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: SvgPicture.asset('assets/ilustrations/man_with_advice.svg'),
    );
  }
}
