import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/screens/controller/theme_controller.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put<ThemeController>(ThemeController());

    return ClipPath(
      clipper: WaveClipperTwo(flip: true),
      child: Container(
        color: Colors.amber,
        height: Get.height * 0.25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                'Mehub',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                height: Get.height * 0.1,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        final Uri url = Uri.parse('https://t.me/BlazingSquad');
                        await launchUrl(url);
                      },
                      child: SizedBox(
                        width: Get.width * 0.1,
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                          color: Colors.blue[100],
                          
                          ),
                          child:const Row(
                            children: [
                              Icon(Icons.telegram),
                              Text('Telegram'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/sign-up');
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.login_outlined),
                          Text('Register'),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        ThemeMode newThemeMode =
                            themeController.theme == ThemeMode.dark
                                ? ThemeMode.light
                                : ThemeMode.dark;
                        themeController.changeThemeMode(newThemeMode);
                        themeController.saveTheme(
                            newThemeMode == ThemeMode.dark);
                      },
                      icon: GetBuilder<ThemeController>(
                        builder: (controller) =>
                            controller.theme == ThemeMode.dark
                                ? const Icon(Icons.light_mode_outlined)
                                : const Icon(Icons.dark_mode_outlined),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
