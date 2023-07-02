import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:web/screens/pages/login/database/loginmodel.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final userBox = Hive.box<LoginModel>('credentials');

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController usernameController;
  late TextEditingController nameController;

  bool isLoggedIn = false;
  bool get isUserLoggedIn => isLoggedIn;

  @override
  void onInit() async {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    nameController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    nameController.dispose();
    super.onClose();
  }

  void login() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      return;
    }

    var user = userBox.get(usernameController.text);
    if (user != null && user.password == passwordController.text) {
      isLoggedIn = true;
      update();
    }
  }

  void signup() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        usernameController.text.isEmpty ||
        nameController.text.isEmpty) {
      return;
    }

    var user = LoginModel(
      usernameController.text,
      emailController.text,
      passwordController.text,
      nameController.text,
    );
    await userBox.put(usernameController.text, user);
    isLoggedIn = true;
    update();
  }

  void logout() {
    isLoggedIn = false;
    update();
  }

  void getCurrentUsername() {
    if (isLoggedIn) {
      userBox.get(usernameController);
    }
    return null;
  }
  
  Map<String, dynamic> getuserValues() {
    if (isLoggedIn) {
      var user = userBox.get(usernameController.text);
      if (user != null) {
        return {
          'username': user.username,
          'email': user.email,
          'password': user.password,
          'name' : user.name
        };
      }
    }
    return {};
  }
}
