import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:ini_labs/app/auth/auth_controller.dart';
import 'package:ini_labs/app/modules/home/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/user_input_page_controller.dart';

class UserInputPageView extends GetView<UserInputPageController> {
  UserInputPageView({Key? key}) : super(key: key);
  final authController = Get.put(AuthController());
  final controller = Get.put(UserInputPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        flexibleSpace: SafeArea(
            child: Icon(
          FontAwesomeIcons.github,
          size: 50,
          color: Colors.white,
        )),
        actions: [
          Obx(
            () => Switch(
                value: controller.darkTheme.value,
                activeColor: Colors.white,
                inactiveThumbColor: Colors.amber,
                inactiveTrackColor: Colors.amber,
                onChanged: (data) async {
                  controller.setDarkThemePref(data);
                  print(data);

                  controller.darkTheme.value = data;
                }),
          )
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.github,
                size: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Input github user name",
                style: Get.textTheme.titleLarge,
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: controller.textController,
                autofocus: true,
                decoration: InputDecoration(
                  focusColor: Get.theme.primaryColor,
                  focusedBorder: UnderlineInputBorder(),
                  label: Text(
                    "User Name",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(Get.width, 50),
                ),
                onPressed: () async {
                  authController.users.value = [];
                  authController.repo.value = [];
                  print(controller.textController.text);
                  controller.name.value = controller.textController.text;
                  authController.getUserData(controller.textController.text);
                  authController.getUserrepo(
                      controller.textController.text,"", "", "");

                  controller.textController.clear();
                },
                child: Text(
                  "Find User",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
