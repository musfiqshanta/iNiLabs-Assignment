import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInputPageController extends GetxController {
  //TODO: Implement UserInputPageController
  final TextEditingController textController = TextEditingController();
  RxBool darkTheme = false.obs;
  RxString name = "".obs;
  RxInt x = 0.obs;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  final count = 0.obs;
  @override
  void onInit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? darkThemepref = prefs.getBool('dark_theme');
    darkTheme.value = darkThemepref!;

    print("dark theme");
    print(darkTheme);
    //  getvalu();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setDarkThemePref(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dark_theme', value);
  }

  void increment() => count.value++;
}
