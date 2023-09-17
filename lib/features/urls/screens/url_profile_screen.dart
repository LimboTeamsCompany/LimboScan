import 'package:flutter/material.dart';
import 'package:limboscan/features/urls/widgets/history/url_history.dart';
import 'package:limboscan/features/urls/widgets/qr_preview/qr_preview.dart';
import 'package:limboscan/utils/routes/route_enum.dart';
import 'package:limboscan/utils/system/system_utils.dart';
import 'package:limboscan/utils/theme/theme_utils.dart';
import 'package:limboscan/utils/urls/urls_utils.dart';
import 'package:limboscan/widgets/elements/buttons/button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UrlProfileScreen extends StatelessWidget {
  const UrlProfileScreen({super.key});

  void onNewScan(BuildContext context) {
    Navigator.pushNamed(context, RoutesList.camera);
    SystemUtils().setUISystemColor(
        color: Colors.transparent, colorBottom: Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    final urlScanned = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: const Color(0xfffcd681),
      body: Stack(
        children: [
          SizedBox(
            height: 100.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w)
                        .copyWith(top: 8.h, bottom: 2.h),
                    child: Column(
                      children: [
                        Text(
                          'Escanea y Descubre',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: colorPmy(context),
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        QrPreview(
                          url: urlScanned,
                        ),
                        Button(
                          text: 'Abrir URL',
                          onTap: () => openUrl(urlScanned),
                        )
                      ],
                    ),
                  ),
                  const UrlHistory(),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              width: 100.w,
              child: Container(
                color: (isIos() ? colorPmy(context) : null),
                padding: EdgeInsets.only(bottom: isIos() ? 2.h : 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                        height: 8.h,
                        width: 100.w,
                        rounded: false,
                        text: 'Nuevo Escaneo',
                        onTap: () => onNewScan(context)),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
