import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist/app/data/model/category.dart';
import 'package:todolist/app/data/model/task.dart';

class TaskController extends GetxController {
  final box = GetStorage();

  var tasks = <Task>[].obs;
  var categories = <Category>[
    Category(id: 1, userId: 1, title: "Category 1"),
    Category(id: 2, userId: 2, title: "Category 2"),
    Category(id: 3, userId: 3, title: "Category 3"),
    Category(id: 4, userId: 4, title: "Category 4"),
  ].obs;

  var _allTasks = <Task>[];
  var _allCategories = <Category>[];

  final taskFinder = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _allTasks = box.read('all_tasks') ?? [];
    // _allCategories = box.read('all_categories') ?? [];
    readTask();
    // readCategories();
  }

  createTask(Task task) {
    tasks.add(task);
    box.write('tasks', tasks);

    _allTasks.add(task);
    box.write('all_tasks', _allTasks);
    box.hasData('task_id_count')
        ? box.write('task_id_count', box.read('task_id_count') + 1)
        : box.write('task_id_count', 1);
  }

  readTask() {
    tasks.value = _allTasks.where((task) {
      return task.userId == box.read('user').id;
    }).toList();
    box.write('tasks', tasks);
  }

  updateTask(Task task, int index) {
    tasks[index] = task;
    box.write('tasks', tasks);

    _allTasks[index] = task;
    box.write('all_tasks', _allTasks);
  }

  deleteTask(int index) {
    tasks.removeAt(index);
    box.write('tasks', tasks);

    _allTasks.removeAt(index);
    box.write('all_tasks', tasks);
  }

  createCategories(Category category) {
    categories.add(category);
    box.write('categories', categories);

    _allCategories.add(category);
    box.write('all_categories', _allCategories);
    box.hasData('category_id_count')
        ? box.write('category_id_count', box.read('category_id_count') + 1)
        : box.write('category_id_count', 1);
  }

  readCategories() {
    categories.value = _allCategories.where((category) {
      return category.userId == box.read('user').id;
    }).toList();
    box.write('categories', categories);
  }

  updateCategories(Category category, int index) {
    categories[index] = category;
    box.write('categories', categories);

    _allCategories[index] = category;
    box.write('all_categories', _allCategories);
  }

  deleteCategories(int index) {
    categories.removeAt(index);
    box.write('categories', categories);

    _allCategories.removeAt(index);
    box.write('all_categories', _allCategories);
  }

  categoryCount(val) {
    return tasks.where((task) => task.category?.contains(val) ?? false).length;
  }
}
