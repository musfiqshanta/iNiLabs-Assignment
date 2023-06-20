import 'package:get/get.dart';

import '../controllers/user_input_page_controller.dart';

class UserInputPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserInputPageController>(
      () => UserInputPageController(),
    );
  }
}
