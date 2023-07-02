import 'package:hive_flutter/hive_flutter.dart';

part 'loginmodel.g.dart';

@HiveType(typeId: 1)
class LoginModel extends HiveObject {
  @HiveField(0)
  late String username;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String email;
  @HiveField(3)
  late String password;

  LoginModel(this.username,this.name,this.email,this.password);

}