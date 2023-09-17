import 'package:flutter/material.dart';
import 'package:limboscan/features/welcome/widgets/video/video_welcome.dart';
import 'package:limboscan/utils/routes/route_enum.dart';
import 'package:limboscan/utils/theme/theme_utils.dart';
import 'package:limboscan/widgets/elements/buttons/button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void onContinue(BuildContext context) {
    Navigator.pushNamed(context, RoutesList.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const VideoScreen(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 3.h),
                    child: Text(
                      'Bienvenido a LimboScan',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: colorPmy(context),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  const Text(
                    'Explora y accede al instante a datos con nuestra app de códigos QR, transformando tu experiencia en el mundo digital.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Button(
                    text: 'Continuar',
                    width: 50.w,
                    onTap: () => onContinue(context),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
