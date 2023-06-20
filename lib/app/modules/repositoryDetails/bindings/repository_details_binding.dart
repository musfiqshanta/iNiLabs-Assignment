import 'package:get/get.dart';

import '../controllers/repository_details_controller.dart';

class RepositoryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepositoryDetailsController>(
      () => RepositoryDetailsController(),
    );
  }
}
