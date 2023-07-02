import 'package:hive_flutter/hive_flutter.dart';

part 'linksmodel.g.dart';

@HiveType(typeId: 0)
class LinkModel extends HiveObject {
  @HiveField(0)
  late String longlink;
  @HiveField(1)
  late String date;
  @HiveField(2)
  late String user;
  @HiveField(3)
  late String shortlink;

  LinkModel(this.longlink,this.date,this.user,this.shortlink);

}