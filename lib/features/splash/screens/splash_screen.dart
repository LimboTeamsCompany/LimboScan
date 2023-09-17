import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limboscan/features/urls/cubit/urls_cubit.dart';
import 'package:limboscan/utils/routes/route_enum.dart';
import 'package:limboscan/utils/system/system_utils.dart';
import 'package:limboscan/utils/theme/theme_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void onContinue() async {
    final bool hasUrls =
        (await context.read<UrlsCubit>().getUrlsFromLocalAndSave()).isNotEmpty;

    Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.pushNamed(
            context, hasUrls ? RoutesList.camera : RoutesList.welcome);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      SystemUtils().setUISystemColor(color: colorPmy(context));
      onContinue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPmy(context),
      body: Stack(
        children: [
          SizedBox(
            width: 100.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/logos/splash_logo.svg'),
                SizedBox(
                  height: 1.h,
                ),
                const Text(
                  'Escanea, Conecta, Descubre',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 3.h,
              child: SizedBox(
                width: 100.w,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Limboteams.LLC'),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
