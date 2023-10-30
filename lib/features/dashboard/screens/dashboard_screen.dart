import 'package:flutter/material.dart';
import 'package:limboscan/features/dashboard/widget/dashboard_top_part/dashboard_top_part.dart';
import 'package:limboscan/utils/system/system_utils.dart';
import 'package:limboscan/utils/theme/theme_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemUtils().setUISystemColor(
          color: Colors.transparent, colorBottom: colorBgy(context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBgy(context),
      body: Column(
        children: [
          const DashboardTopPart(),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
              child: const Column(
                children: [
                  Text(
                    'Escanéa, descubre y accede rápidamente a información con nuestra aplicación de escaneo de códigos QR, simplificando la forma en que interactúas con el mundo digital',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
