import 'package:get/get.dart';
import 'package:todolist/app/controller/input_controller.dart';

class InputBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => InputController());
  }
}