import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/controller/auth_controller.dart';

class Auth extends GetView<AuthController> {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Image.asset("images/onboard.png"),
          const Text(
            "Todolist",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              color: Color(0xFF363942),
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Manage Your Task",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0x99363942),
              fontWeight: FontWeight.normal,
            ),
          ),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 300),
            child: Row(
              children: [
                _buildButton(
                  "Login",
                  () => controller.login(),
                  const Color(0xFF4B7BE5),
                ),
                const SizedBox(width: 20),
                _buildButton(
                  "Register",
                  () => controller.register(),
                  const Color(0xB34B7BE5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildButton(text, onPressed, color) {
    return Expanded(
      child: MaterialButton(
        height: Get.height * 0.065,
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
      ),
    );
  }

  _buildTextField({title, controller, required RxBool isObscure}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Obx(
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
      ),
    );
  }
}
