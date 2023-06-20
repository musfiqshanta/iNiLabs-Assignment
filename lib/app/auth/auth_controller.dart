import 'dart:math';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:ini_labs/app/model/repo_model.dart';
import 'package:ini_labs/app/model/user_model.dart';
import 'package:ini_labs/app/modules/home/views/home_view.dart';

class AuthController extends GetxController {
  //TODO: Implement UserInputPageController
  final dio = Dio();
  final users = <User>[].obs;
  final repo = <Repository>[].obs;
  final isLoading = true.obs;
  RxInt totalCount = 0.obs;
  RxString repoName = "".obs;
  RxInt page = 1.obs;
  RxInt itemLength = 1.obs;
  List<String> type = [
    "all",
    "public",
    "private",
  ];
  RxString typeValu = "public".obs;
  List<String> sort = [
    "last update",
    "name",
    "star",
  ];
  RxString sortValu = "name".obs;

  int x = 0;
  @override
  void onInit() async {

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

  Future<void> getUserData(String uname) async {
    print(uname);
// User Details
    try {
      final response = await dio.get("https://api.github.com/users/$uname");

      if (response.statusCode == 200) {
        //users.value = User.fromJson(response.data);

        final data = User.fromJson(response.data);

        users.add(data);

        isLoading.value = false;
      }
      Get.to(HomeView());
      print("fund");
    } catch (e) {
      if (kDebugMode) {
        print("Not found ");
        print(e);
        Get.snackbar(
          "Error",
          "User Not found",
          backgroundColor: Colors.red[700],
          colorText: Colors.white,
        );
      }
    }
  }

  Future<void> getUserrepo(
      String uname, String? repoName, String? type, String? sort) async {
    print("Get user");
    print(repoName);
    print(type);
    print(sort);

    String? update =
        sort == "last update" ? 'updated&order=desc' : "$sort&order=asc";
    String baseUrl = "https://api.github.com/search/repositories";

// User repository
    try {
      final responsesRepo = await dio.get(
        "$baseUrl?q=user:$uname+${repoName!}+is:${type!}&sort=$update&page=${page.value}",
      );

      String url =
          "$baseUrl?q=user:$uname+${repoName!}+is:${type!}&sort=$update&page=${page.value}";

      print("Url");
      print(url);
      // final responsesRepo = await dio.get(
      //     "https://api.github.com/search/repositories?q=user:musfiqshanta+plug&type=public&language=&sort=name");
      if (responsesRepo.statusCode == 200) {
        final data = responsesRepo.data;
        print("total");
        // totalCount.value = data['total_count'];
       itemLength.value =data['items'].length;
        //print(data['items'].length);
        for (var response in data['items']) {
          final data = Repository.fromJson(response);
          print(response);
          repo.add(data);
        }

        isLoading.value = false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
