import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todolist/app/controller/task_controller.dart';
import 'package:todolist/app/routes/app_routes.dart';

class TaskCard extends GetView<TaskController> {
  final int index;

  const TaskCard(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.tasks[index].title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF363942),
              ),
            ),
            Text(
              controller.tasks[index].category!.isNotEmpty
                  ? controller.tasks[index].category!.join(', ')
                  : 'No Category',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF363942),
              ),
            ),
            Row(
              children: [
                Text(
                  controller.tasks[index].deadline != null
                      ? DateFormat.yMMMMd()
                          .format(controller.tasks[index].deadline!)
                      : 'No Date',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF363942),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () => Get.toNamed(Routes.input, arguments: index),
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () => controller.deleteTask(index),
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
