import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limboscan/features/urls/cubit/urls_cubit.dart';
import 'package:limboscan/utils/system/system_utils.dart';
import 'package:limboscan/utils/theme/theme_utils.dart';
import 'package:limboscan/widgets/url/url_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UrlHistory extends StatefulWidget {
  const UrlHistory({super.key});

  @override
  State<UrlHistory> createState() => _UrlHistoryState();
}

class _UrlHistoryState extends State<UrlHistory> {
  bool showMore = false;

  void toggleShowMore() {
    setState(() {
      showMore = !showMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> allUrlList = context.watch<UrlsCubit>().state.urls;

    List<String> urlList = [];

    if (allUrlList.length > 3 && !showMore) {
      urlList = allUrlList.sublist(0, 3);
    } else {
      urlList = allUrlList;
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/clock.svg'),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'Historial',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: colorPmy(context),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              if (urlList.isEmpty)
                Container(
                  margin: EdgeInsets.only(top: 2.h),
                  child: const Text(
                    'Aun no has escaneado algun QR, ¡Empieza a explorar el mundo digital! Escanea códigos QR para llenar tu historial y acceder rápidamente a tus descubrimientos anteriores.',
                    textAlign: TextAlign.center,
                  ),
                )
              else
                SizedBox(
                  height: 1.h,
                ),
            ],
          ),
        ),
        for (String url in urlList) UrlContainer(url: url, yellowTheme: false),
        if (allUrlList.length > 3)
          GestureDetector(
            onTap: toggleShowMore,
            child: Container(
              margin: EdgeInsets.only(top: 2.h, bottom: isIos() ? 14.h : 5.h),
              child: Text(
                showMore ? 'Ver menos' : 'Ver más',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    color: colorPmy(context)),
              ),
            ),
          )
      ],
    );
  }
}
