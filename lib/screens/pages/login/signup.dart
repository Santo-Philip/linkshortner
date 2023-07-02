import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/logincontroller.dart';

class SignUpPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController confirmPasswordController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            height: Get.mediaQuery.devicePixelRatio * 600,
            width: Get.mediaQuery.devicePixelRatio * 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text('Register',style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  height: Get.mediaQuery.devicePixelRatio * 10,
                ),
                TextField(
                  controller: loginController.usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(
                  height: Get.mediaQuery.devicePixelRatio * 10,
                ),
                TextFormField(
                  controller: loginController.emailController,
                  validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
          
                  decoration:const InputDecoration(
                    labelText: 'Email',
                    hintText: 'example@email.com',
                    border: OutlineInputBorder(),
                    errorMaxLines: 1,

                  ),
                ),
                SizedBox(
                  height: Get.mediaQuery.devicePixelRatio * 10,
                ),
                TextFormField(
                  controller: loginController.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(
                  height: Get.mediaQuery.devicePixelRatio * 10,
                ),
                TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration:const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder()
              ),
            ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      final valid = EmailValidator.validate(loginController.emailController.text);
                      final password = loginController.passwordController.text;
                      final username = loginController.usernameController.text;
                      if (valid && password.length >= 8 && username.length >= 7) {
                      loginController.signup();
                      Get.toNamed('/');
                    } else{
                          
                      Get.snackbar(
                        'Warning',
                        'Check the password and email',
                        icon:const  Icon(Icons.warning_rounded),
                        margin:const EdgeInsets.all(20)
                          
                      );
                    }

                    },
                    child:const Text('Sign Up'),
                  ),
                ),
                SizedBox(
                  height: Get.mediaQuery.devicePixelRatio * 30,
                ),
                TextButton(onPressed: (){
                  Get.toNamed('/login');
                }, child: Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
