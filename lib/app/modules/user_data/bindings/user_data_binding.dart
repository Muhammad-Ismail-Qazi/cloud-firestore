import 'package:get/get.dart';

import '../controllers/user_data_controller.dart';

class UserDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserDataController>(
      () => UserDataController(),
    );
  }
}
