import 'package:get/get.dart';

import 'package:firebase_firestore/app/modules/home/bindings/home_binding.dart';
import 'package:firebase_firestore/app/modules/home/views/home_view.dart';
import 'package:firebase_firestore/app/modules/user_data/bindings/user_data_binding.dart';
import 'package:firebase_firestore/app/modules/user_data/views/user_data_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.USER_DATA,
      page: () => UserDataView(),
      binding: UserDataBinding(),
    ),
  ];
}