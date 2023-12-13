import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist/app/data/model/user.dart';

class UserController extends GetxController {
  final box = GetStorage();

  final user = Rxn<User>();

  final username = TextEditingController();
  final password = TextEditingController();
  RxBool isObscure = true.obs;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  void setUser() {
    user.value = User(
      id: user.value!.id,
      username: username.text,
      password: password.text,
    );
    box.write('user', user.value);
  }

  void getUser() {
    user.value = box.read('user');
    username.text = user.value == null ? '' : user.value!.username;
    password.text = user.value == null ? '' : user.value!.password;
  }

  Future<bool> updateUser() async {
    if (!validateForm()) {
      Get.snackbar("Failed", "Please fill all form");
      return false;
    }
    try {
      setUser();
      final List<User> users = box.read('users');
      final int index = users.indexWhere((e) => e.id == user.value!.id);
      users[index] = user.value!;
      box.write('users', users);
      return true;
    } catch (e) {
      Get.snackbar("Failed", "Something is wrong");
      return false;
    }
  }

  Future<void> logout() async {
    box.remove('user');
    box.remove('tasks');
    box.remove('categories');
  }

  void setObscure() => isObscure(!isObscure.value);

  bool validateForm() => username.text.isNotEmpty && password.text.isNotEmpty;
}
