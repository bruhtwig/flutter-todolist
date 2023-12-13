import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/controller/user_controller.dart';
import 'package:todolist/app/routes/app_routes.dart';

class Profile extends GetView<UserController> {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Profile",
            style: TextStyle(
              fontSize: 32,
              color: Color(0xFF363942),
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.person_pin, size: Get.width * 0.25),
          _buildTextField(
            title: "Username",
            controller: controller.username,
            isObscure: false.obs,
          ),
          _buildTextField(
            title: "Password",
            controller: controller.password,
            isObscure: controller.isObscure,
          ),
          _buildButton(
            "Edit Profile",
            () => controller.updateUser().then((value) =>
                value ? Get.snackbar("Success", "User updated") : null),
            const Color(0xFF4B7BE5),
          ),
          _buildButton(
            "Logout",
            () => controller.logout().then((_) => Get.offNamed(Routes.initial)),
            const Color(0xB34B7BE5),
          ),
          SizedBox(height: Get.height * 0.15),
        ],
      ),
    );
  }

  _buildButton(text, onPressed, color) {
    return MaterialButton(
      height: Get.height * 0.065,
      minWidth: double.infinity,
      onPressed: onPressed,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _buildTextField({title, controller, required RxBool isObscure}) {
    return Obx(
      () => TextField(
        controller: controller,
        maxLength: title == "Username" ? 20 : null,
        obscureText: isObscure.value,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF363942),
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF5F5F5),
          labelText: title,
          counterText: '',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: title == "Password"
              ? IconButton(
                  onPressed: () => isObscure(!isObscure.value),
                  icon: Icon(
                    this.controller.isObscure.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
