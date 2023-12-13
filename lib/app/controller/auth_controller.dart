import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist/app/data/model/user.dart';
import 'package:todolist/app/routes/app_routes.dart';

class AuthController extends GetxController {
  final box = GetStorage();
  User? _user;
  List<User> _users = [];

  final username = TextEditingController();
  final password = TextEditingController();
  RxBool isObscure = true.obs;

  @override
  void onInit() {
    super.onInit();
    if (box.hasData('user')) Get.offNamed(Routes.dashboard);
    if (box.hasData('users')) _users = box.read('users');
  }

  void login() {
    if (!validateForm()) {
      Get.snackbar("Failed", "Please fill all form");
      return;
    }
    if (!usernameExist()) {
      Get.snackbar("Failed", "No Username that match");
      return;
    }
    if (!validatePassword()) {
      Get.snackbar("Failed", "Password is incorrect");
      return;
    }
    box.write('user', _user);
    Get.offNamed(Routes.dashboard);
  }

  void register() {
    if (!validateForm()) {
      Get.snackbar("Failed", "Please fill all form");
      return;
    }
    if (usernameExist()) {
      Get.snackbar("Failed", "Username has exist");
      return;
    }
    setUser();
    Get.offNamed(Routes.dashboard);
  }

  bool validateForm() => username.text.isNotEmpty && password.text.isNotEmpty;

  bool validatePassword() => _user!.password == password.text;

  bool usernameExist() {
    if (_users.isNotEmpty) {
      try {
        _user = _users.firstWhere((user) => user.username == username.text);
      } catch (e) {
        _user = null;
      }
      if (_user != null) return true;
    }
    return false;
  }

  void setUser() {
    _user = User(
      id: _users.isNotEmpty ? _users.last.id + 1 : 1,
      username: username.text,
      password: password.text,
    );
    _users.add(_user!);
    box.write('user', _user);
    box.write('users', _users);
  }

  void setObscure() => isObscure(!isObscure.value);
}
