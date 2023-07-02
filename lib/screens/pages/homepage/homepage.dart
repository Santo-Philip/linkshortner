import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web/screens/controller/theme_controller.dart';
import 'package:web/screens/pages/homepage/widgets/feature_section.dart';
import 'package:web/screens/pages/homepage/widgets/homeheader.dart';
import 'package:web/screens/pages/homepage/widgets/centertext.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final themeController = Get.put<ThemeController>(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(),
          ReadmeSection(),
          FeatureSection(),
        ],
      ),
    );
  }
}
