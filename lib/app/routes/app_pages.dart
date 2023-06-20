import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/repositoryDetails/bindings/repository_details_binding.dart';
import '../modules/repositoryDetails/views/repository_details_view.dart';
import '../modules/userInputPage/bindings/user_input_page_binding.dart';
import '../modules/userInputPage/views/user_input_page_view.dart';

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
      name: _Paths.USER_INPUT_PAGE,
      page: () =>  UserInputPageView(),
      binding: UserInputPageBinding(),
    ),
  ];
}
