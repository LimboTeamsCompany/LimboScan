import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:limboscan/utils/routes/route_enum.dart';
import 'package:limboscan/utils/system/system_utils.dart';
import 'package:limboscan/utils/theme/theme_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'urls_state.dart';

class UrlsCubit extends Cubit<UrlsState> {
  UrlsCubit() : super(UrlsInitial());

  void goToUrlProfile(
      {required String url, required BuildContext context}) async {
    addUrl(url);

    SystemUtils().setUISystemColor(
        color: const Color(0xfffcd681), colorBottom: colorPmy(context));

    Navigator.of(context)
        .pushReplacementNamed(RoutesList.urlPreview, arguments: url);
  }

  void addUrl(String url) {
    List<String> urls = [...state.urls, url];

    emit(UrlsInitial(urls: urls));
    saveUrlsInLocal(urls);
  }

  void deleteUrl(String url) async {
    List<String> urls = [...state.urls];
    urls.remove(url);

    emit(UrlsInitial(urls: urls));
    (await SharedPreferences.getInstance()).setStringList('urls', urls);
  }

  void getUrls() {
    List<String> urls = state.urls;
    emit(UrlsInitial(urls: urls));
  }

  void saveUrlsInLocal(List<String> urls) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList('urls', urls);
  }

  Future<List<String>> getUrlsFromLocalAndSave() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> urls = prefs.getStringList('urls') ?? [];

    emit(UrlsInitial(urls: urls));

    return urls;
  }
}
