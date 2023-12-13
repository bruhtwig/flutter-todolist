import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist/app/controller/task_controller.dart';
import 'package:todolist/app/controller/user_controller.dart';
import 'package:todolist/app/data/model/category.dart';
import 'package:todolist/app/data/model/task.dart';

class InputController extends GetxController {
  final box = GetStorage();

  final title = TextEditingController();
  final description = TextEditingController();
  var date = Rxn<DateTime>();
  var time = Rxn<TimeOfDay>();
  late RxList<Category> categories;
  late RxList<bool> categoryIsSelected;

  @override
  void onInit() {
    super.onInit();
    final taskC = Get.find<TaskController>();

    categories = taskC.categories;
    categoryIsSelected = List.generate(categories.length, (_) => false).obs;

    if (Get.arguments != null) setForm(taskC.tasks[Get.arguments]);
  }

  setForm(Task task) {
    title.text = task.title;
    description.text = task.description ?? '';
    date.value = task.deadline;
  }

  selectDate(BuildContext context) async {
    date.value = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
  }

  selectTime(BuildContext context) async {
    time.value = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  Future<bool> inputTask() async {
    if (title.text.isEmpty) {
      Get.snackbar("Failed", "Please fill the title");
      return false;
    }
    try {
      final taskC = Get.find<TaskController>();
      final userC = Get.find<UserController>();
      Get.arguments == null
          ? taskC.createTask(setTask(userC.user.value?.id))
          : taskC.updateTask(setTask(userC.user.value?.id), Get.arguments);
      return true;
    } catch (e) {
      Get.snackbar("Failed", "Something is wrong");
      return false;
    }
  }

  setTask(userId) {
    return Task(
      id: box.hasData('task_id_count') ? box.read('task_id_count') + 1 : 1,
      userId: userId,
      title: title.text,
      category: getSelectedCategory(),
      deadline: date.value,
      description: description.text,
    );
  }

  setCategory(index) => categoryIsSelected[index] = !categoryIsSelected[index];

  getSelectedCategory() {
    return categories
        .where((category) => categoryIsSelected[categories.indexOf(category)])
        .map((category) => category.title)
        .toList();
  }
}
