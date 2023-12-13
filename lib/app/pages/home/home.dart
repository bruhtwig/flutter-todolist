import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/controller/task_controller.dart';
import 'package:todolist/app/pages/home/add_category_card.dart';
import 'package:todolist/app/pages/home/category_card.dart';
import 'package:todolist/app/pages/home/header.dart';
import 'package:todolist/app/pages/home/task_card.dart';

class Home extends GetView<TaskController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
          child: TextField(
            controller: controller.taskFinder,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF5F5F5),
              hintText: "Find your task",
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
          child: Text(
            "Categories",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF363942),
            ),
          ),
        ),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length + 1,
            itemBuilder: (context, index) {
              return index < controller.categories.length
                  ? CategoryCard(index)
                  : AddCategoryCard();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
          child: Text(
            "My Task",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF363942),
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.tasks.length,
              itemBuilder: (context, index) => TaskCard(index),
            ),
          ),
        ),
      ],
    );
  }
}