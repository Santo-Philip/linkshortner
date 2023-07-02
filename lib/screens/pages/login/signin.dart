import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web/screens/controller/logincontroller.dart';

class SignInPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: Get.height / 1.5,
          width: Get.height / 1.5,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'LogIn',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.mediaQuery.devicePixelRatio * 10,
                ),
                TextField(
                  controller: loginController.usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                TextField(
                  controller: loginController.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(
                  height: Get.pixelRatio * 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    loginController.login();
                    if (loginController.isLoggedIn) {
                      Get.toNamed("/");
                    } else {
                      Get.toNamed('/login');
                    }
                  },
                  child: const Text('Sign In'),
                ),
                SizedBox(height: Get.mediaQuery.devicePixelRatio * 30,),
                TextButton(onPressed: (){
                  Get.toNamed('/sign-up');
                }, child: Text('Register'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
