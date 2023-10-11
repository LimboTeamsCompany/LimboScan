// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:limboscan/utils/camera/camera_utils.dart';
import 'package:limboscan/utils/routes/route_enum.dart';
import 'package:limboscan/utils/theme/theme_utils.dart';
import 'package:limboscan/widgets/elements/buttons/button.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CameraModalAskPermissions extends StatelessWidget {
  const CameraModalAskPermissions({super.key});

  void onAcceppt(BuildContext context) async {
    final result = await Permission.camera.request();

    if (result == PermissionStatus.granted) {
      Navigator.pushReplacementNamed(context, RoutesList.camera);
    } else if (result == PermissionStatus.permanentlyDenied) {
      Navigator.pop(context);
      openModalDeniedPermissions(context);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h)
          .copyWith(bottom: 3.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/photo_camera.png',
              ),
              SizedBox(
                width: 1.w,
              ),
              Text(
                'Permitir acceso a la camara',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: colorPmy(context),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
            child: const Text(
                'En LimboScan necesitamos acceso a la camara para poder escanear los codigos QR.\n\nPor favor permite el acceso para continuar.'),
          ),
          Button(
            text: 'Permitir acceso',
            onTap: () => onAcceppt(context),
          ),
          SizedBox(
            height: 2.h,
          ),
          Button(
            text: 'No permitir',
            outlined: true,
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
