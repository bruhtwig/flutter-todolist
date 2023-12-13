import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/controller/task_controller.dart';

class CategoryCard extends GetView<TaskController> {
  final int index;

  const CategoryCard(this.index, {super.key});

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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx(
              () => Text(
                controller.categories[index].title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFF8F6FF),
                ),
              ),
            ),
            Obx(
              () => Text(
                '${controller.categoryCount(controller.categories[index].title)} Tasks',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFFF8F6FF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
