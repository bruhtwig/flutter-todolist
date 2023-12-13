import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/controller/dashboard_controller.dart';
import 'package:todolist/app/pages/home/home.dart';
import 'package:todolist/app/pages/profile/profile.dart';
import 'package:todolist/app/pages/schedule/schedule.dart';
import 'package:todolist/app/pages/statistic/statistic.dart';
import 'package:todolist/app/routes/app_routes.dart';

class Dashboard extends GetView<DashboardController> {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.page.value ?? const Home(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.input),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: const MyBottomBar(),
      ),
    );
  }
}

class MyBottomBar extends GetView<DashboardController> {
  const MyBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFFF8F6FF),
      shape: const CircularNotchedRectangle(),
      height: 50,
      notchMargin: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIcon(Icons.home_outlined, const Home()),
          _buildIcon(Icons.calendar_month, const Schedule()),
          const SizedBox(width: 55),
          _buildIcon(Icons.bar_chart, const Statistic()),
          _buildIcon(Icons.person_outline, const Profile()),
        ],
      ),
    );
  }

  Widget _buildIcon(icon, page) {
    return IconButton(
      onPressed: () => controller.setPage(page),
      icon: Icon(
        icon,
        size: 30,
        color: const Color(0xFF4B7BE5),
      ),
    );
  }
}
