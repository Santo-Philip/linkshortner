import 'package:hive_flutter/hive_flutter.dart';
import 'package:web/screens/pages/login/database/loginmodel.dart';

Future<void> addCredentials({
  required String key,
  required String boxName,
  required String username,
  required String email,
  required String password,
  required String name
}) async {
  final box = await Hive.openBox<LoginModel>(boxName);
  final loginModel = LoginModel(username, name, email, password,);
  await box.put(key, loginModel);
  await box.close();
}