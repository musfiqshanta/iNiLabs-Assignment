import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ini_labs/app/modules/home/views/home_view.dart';
import 'package:ini_labs/app/modules/userInputPage/controllers/user_input_page_controller.dart';

import 'app/modules/userInputPage/views/user_input_page_view.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/dark_ligh_theme.dart';
import 'app/theme/text_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Obx(
    () => GetMaterialApp(
      title: "Application",
      home: UserInputPageView(),
      theme: Get.put(UserInputPageController()).darkTheme != true
          ? darkTheme
          : lightTheme,
    ),
  ));
}
