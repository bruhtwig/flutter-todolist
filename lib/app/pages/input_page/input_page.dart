import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todolist/app/controller/input_controller.dart';
import 'package:todolist/app/routes/app_routes.dart';

class InputPage extends GetView<InputController> {
  InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Positioned(
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                Center(
                  child: Text(
                    "Create New Task",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Title",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0x80000000),
              ),
            ),
            TextField(
              controller: controller.title,
              maxLength: 30,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF363942),
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF5F5F5),
                hintText: "Enter your title here",
                counterText: '',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Date",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0x80000000),
              ),
            ),
            MaterialButton(
              onPressed: () => controller.selectDate(context),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              elevation: 0,
              color: Color(0xFFF5F5F5),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      controller.date.value != null
                          ? DateFormat.yMMMMEEEEd()
                              .format(controller.date.value!)
                          : '',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF363942),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.calendar_today,
                    color: Color(0xFF363942),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Add Category",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0x80000000),
              ),
            ),
            Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFF5F5F5),
              ),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: List.generate(
                  controller.categories.length <= 10
                      ? controller.categories.length
                      : 10,
                  (index) => Obx(
                    () => MaterialButton(
                      onPressed: () => controller.setCategory(index),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: controller.categoryIsSelected[index]
                          ? Color(0xFF4B7BE5)
                          : Color(0xFFEBF3FC),
                      textColor: controller.categoryIsSelected[index]
                          ? Colors.white
                          : Colors.black,
                      child: Text(controller.categories[index].title),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0x80000000),
              ),
            ),
            TextField(
              controller: controller.description,
              maxLines: 5,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF363942),
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF5F5F5),
                hintText: "Enter your description here",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Spacer(),
            MaterialButton(
              onPressed: () => controller.inputTask().then(
                  (value) => value ? Get.offAllNamed(Routes.dashboard) : null),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              color: Color(0xFF4B7BE5),
              child: Text(
                "Create a new task",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
