import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limboscan/features/urls/cubit/urls_cubit.dart';

dynamic getCubits() {
  return [
    BlocProvider(create: (context) => UrlsCubit()),
  ];
}
