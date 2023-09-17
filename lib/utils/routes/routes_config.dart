import 'package:flutter/material.dart';
import 'package:limboscan/features/camera/screens/camera_screen.dart';
import 'package:limboscan/features/dashboard/screens/dashboard_screen.dart';
import 'package:limboscan/features/splash/screens/splash_screen.dart';
import 'package:limboscan/features/urls/screens/url_profile_screen.dart';
import 'package:limboscan/features/welcome/screens/welcome_screens.dart';
import 'package:limboscan/utils/routes/route_enum.dart';

Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    RoutesList.splash: (context) => const SplashScreen(),
    RoutesList.welcome: (context) => const WelcomeScreen(),
    RoutesList.dashboard: (context) => const DashboardScreen(),
    RoutesList.camera: (context) => const CameraScreen(),
    RoutesList.urlPreview: (context) => const UrlProfileScreen(),
  };
}
