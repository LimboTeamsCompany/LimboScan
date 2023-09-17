import 'package:flutter/material.dart';
import 'package:limboscan/utils/theme/theme_utils.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    onRouteChanged(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null) {
      onRouteChanged(previousRoute);
    }
  }

  void onRouteChanged(Route<dynamic> route) {
    ThemeUtils().setColorToUISystemWithRoute(route.settings.name ?? '');
  }
}
