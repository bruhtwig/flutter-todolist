import 'package:get/get.dart';
import 'package:todolist/app/controller/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthController());
  }
}