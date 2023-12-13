import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/controller/task_controller.dart';

class AddCategoryCard extends GetView<TaskController> {
  const AddCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: Get.width * 0.4,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          colors: [
            Color(0xFF0093E9),
            Color(0xFF80D0C7),
          ],
        ),
      ),
      child: Icon(Icons.add_circle_outline),
    );
  }
}
