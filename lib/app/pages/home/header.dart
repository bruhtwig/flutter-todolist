import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todolist/app/controller/user_controller.dart';

class Header extends GetView<UserController> {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello ${controller.user.value?.username}",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF363942),
            ),
          ),
          Text(
            DateFormat.yMMMMd().format(DateTime.now()),
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF363942),
            ),
          ),
        ],
      ),
    );
  }
}
