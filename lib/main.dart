import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:web/screens/pages/adspages/firstadspage.dart';
import 'package:web/screens/controller/theme_controller.dart';
import 'package:web/screens/pages/homepage/homepage.dart';
import 'package:web/screens/pages/login/database/loginmodel.dart';
import 'package:web/screens/pages/login/signin.dart';
import 'package:web/screens/pages/login/signup.dart';
import 'package:web/screens/pages/shortlink/database/model/linksmodel.dart';
import 'package:web/screens/pages/shortlink/mainshortlink.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LinkModelAdapter());
  Hive.registerAdapter(LoginModelAdapter());
  await Hive.openBox<LoginModel>('credentials');
  await GetStorage.init();
  Get.put(ThemeController());
  runApp(MeHub());
}

class MeHub extends StatelessWidget {
  MeHub({super.key});
  final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/sl', page: () => ShortLinks()),
        GetPage(name: '/sl:string', page: () => FirstAdspage()),
        GetPage(name: '/sign-up', page: () => SignUpPage()),
        GetPage(name: '/login', page: () => SignInPage()),
                 ],
      debugShowCheckedModeBanner: false,
      title: 'MeHub',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeController.theme,
      initialRoute: '/',
    );
  }
}
