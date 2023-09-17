part of 'urls_cubit.dart';

abstract class UrlsState extends Equatable {
  final List<String> urls;
  const UrlsState({this.urls = const []});

  UrlsState copyWith({List<String>? urls});

  @override
  List<Object?> get props => [urls];
}

class UrlsInitial extends UrlsState {
  UrlsInitial({List<String>? urls}) : super(urls: urls ?? []);

  @override
  UrlsInitial copyWith({List<String>? urls}) {
    return UrlsInitial(
      urls: urls ?? this.urls,
    );
  }
}
