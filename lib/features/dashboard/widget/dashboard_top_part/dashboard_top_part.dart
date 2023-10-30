// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limboscan/utils/camera/camera_utils.dart';
import 'package:limboscan/utils/routes/route_enum.dart';
import 'package:limboscan/utils/system/system_utils.dart';
import 'package:limboscan/utils/theme/theme_utils.dart';
import 'package:limboscan/widgets/elements/buttons/button.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardTopPart extends StatefulWidget {
  const DashboardTopPart({super.key});

  @override
  State<DashboardTopPart> createState() => _DashboardTopPartState();
}

class _DashboardTopPartState extends State<DashboardTopPart> {
  void checkPermissions() async {
    final cameraPermissionIsGranted = await Permission.camera.isGranted;

    if (!cameraPermissionIsGranted) {
      openModalToAskPermissions(context);
    } else {
      Navigator.pushNamed(context, RoutesList.camera);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double whiteSquareSize = isTablet(context) ? 40.w : 70.w;

    return GestureDetector(
      onTap: checkPermissions,
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff3a3c99), Color(0xff2b2c60)],
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.w),
                bottomRight: Radius.circular(10.w))),
        width: 100.w,
        height: 50.h,
        child: Stack(
          children: [
            SizedBox(
              width: 100.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: whiteSquareSize,
                    height: whiteSquareSize,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorYellow, width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/camera.svg'),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'Usa tu cámara para escanear',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 82.w,
                left: 12.5.w,
                child: Button(
                  width: 75.w,
                  text: 'Aquí verás la URL al escanear',
                  backgroundColor: colorYellow,
                ))
          ],
        ),
      ),
    );
  }
}
