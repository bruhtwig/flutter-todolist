import 'package:get/get.dart';
import 'package:todolist/app/bindings/auth_binding.dart';
import 'package:todolist/app/bindings/dashboard_binding.dart';
import 'package:todolist/app/bindings/input_binding.dart';
import 'package:todolist/app/bindings/task_binding.dart';
import 'package:todolist/app/bindings/user_binding.dart';
import 'package:todolist/app/pages/auth/auth.dart';
import 'package:todolist/app/pages/dashboard/dashboard.dart';
import 'package:todolist/app/pages/input_page/input_page.dart';
import 'package:todolist/app/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => Auth(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => Dashboard(),
      bindings: [DashboardBinding(), TaskBinding(), UserBinding()],
    ),
    GetPage(
      name: Routes.input,
      page: () => InputPage(),
      binding: InputBinding(),
    ),
  ];
}
