import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limboscan/utils/cubit/cubit_utils.dart';
import 'package:limboscan/utils/routes/route_enum.dart';
import 'package:limboscan/utils/routes/router_observer.dart';
import 'package:limboscan/utils/routes/routes_config.dart';
import 'package:limboscan/utils/theme/theme_utils.dart';
import 'package:oktoast/oktoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomNavigatorObserver navigatorObserver = CustomNavigatorObserver();

    return OKToast(
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MultiBlocProvider(
            providers: getCubits(),
            child: MaterialApp(
              title: 'LimboScan',
              navigatorObservers: [navigatorObserver],
              theme: ThemeUtils().getTheme(),
              home: Container(),
              routes: getRoutes(),
              initialRoute: RoutesList.splash,
            ),
          );
        },
      ),
    );
  }
}
