import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/routes/app_pages.dart';
import 'package:todolist/app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todolist',
      getPages: AppPages.pages,
      initialRoute: Routes.initial,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Poppins"),
    );
  }
}