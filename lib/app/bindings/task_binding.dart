import 'package:get/get.dart';
import 'package:todolist/app/controller/task_controller.dart';

class TaskBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TaskController());
  }
}