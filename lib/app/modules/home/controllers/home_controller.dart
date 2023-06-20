import 'package:get/get.dart';
import 'package:ini_labs/app/auth/auth_controller.dart';
import 'package:ini_labs/main_controller.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  RxBool grid = false.obs;

  @override
  void onInit() {
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

  void listToGrid() {
    grid.value = !grid.value;

    print(grid);
  }

  void increment() => count.value++;
}
