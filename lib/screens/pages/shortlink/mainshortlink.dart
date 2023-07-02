import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web/screens/pages/shortlink/widgets/header.dart';
import 'package:web/screens/pages/shortlink/widgets/linkbutton.dart';
import 'package:web/screens/pages/shortlink/widgets/linkform.dart';
import '../../controller/theme_controller.dart';

class ShortLinks extends StatelessWidget {
  final TextEditingController textlink = TextEditingController();
  final themecontroller = Get.find<ThemeController>();

 ShortLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ShortenerHeader(),
          LinkForm(textlink: textlink),
          GetLinkButton(textlink: textlink)
        ],
      ),
    );
  }
}
