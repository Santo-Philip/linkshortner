import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/screens/controller/theme_controller.dart';

class ShortenerHeader extends StatelessWidget {
  const ShortenerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put<ThemeController>(ThemeController());

    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        height: Get.pixelRatio * 200,
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Mehub',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: Get.pixelRatio * 50,
              child: Row(
                children: [
                  InkWell(
                    onTap: ()async {
                      final Uri url = Uri.parse('https://t.me/BlazingSquad');
                      await launchUrl(url);
                    },
                    child: SizedBox(
                      width: Get.mediaQuery.devicePixelRatio * 60,
                      child: Container(
                        child: Text('Telegram'),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/sign-up');
                    },
                    child:const Row(
                      children: [
                        Icon(Icons.app_registration),
                        Text('Register')
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
                      themeController.saveTheme(newThemeMode == ThemeMode.dark);
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
          ],
        ),
      ),
    );
  }
}
