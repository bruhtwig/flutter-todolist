import 'package:get/get.dart';
import 'package:todolist/app/controller/user_controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UserController());
  }
}