// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limboscan/features/urls/cubit/urls_cubit.dart';
import 'package:limboscan/utils/urls/urls_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UrlContainer extends StatelessWidget {
  const UrlContainer({super.key, required this.url, required this.yellowTheme});
  final String url;
  final bool yellowTheme;

  Color getBackgroundColor() {
    if (yellowTheme) {
      return const Color(0xffF1B94C);
    }

    return const Color(0xff342D39);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!yellowTheme)
          SizedBox(
            width: 10.w,
          ),
        Container(
          decoration: BoxDecoration(
              color: getBackgroundColor(),
              borderRadius: BorderRadius.circular(100)),
          height: 6.h,
          width: 80.w,
          margin: EdgeInsets.only(top: !yellowTheme ? 1.h : 0.0),
          padding: EdgeInsets.symmetric(horizontal: 6.w).copyWith(
            bottom: yellowTheme ? 0.0 : 0.5.h,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (yellowTheme)
                Container(
                    margin: EdgeInsets.only(right: 2.w),
                    child: GestureDetector(
                        onTap: () => openUrl(url),
                        child: SvgPicture.asset('assets/icons/open_url.svg'))),
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    if (!yellowTheme) {
                      openUrl(url);
                    }
                  },
                  child: Text(
                    url,
                    style: TextStyle(
                        color: yellowTheme
                            ? Colors.white
                            : const Color(0xffd0b378)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => copy(text: url, context: context),
                    child: SvgPicture.asset(
                      'assets/icons/copy${yellowTheme ? '' : '-yellow'}.svg',
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  GestureDetector(
                    onTap: () => share(url),
                    child: SvgPicture.asset(
                      'assets/icons/share${yellowTheme ? '' : '-yellow'}.svg',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (!yellowTheme)
          Container(
              margin: EdgeInsets.only(left: 1.w),
              child: GestureDetector(
                  onTap: () => context.read<UrlsCubit>().deleteUrl(url),
                  child: SvgPicture.asset('assets/icons/trash.svg')))
      ],
    );
  }
}
