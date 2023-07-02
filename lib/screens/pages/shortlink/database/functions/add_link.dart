import 'package:hive_flutter/hive_flutter.dart';
import 'package:web/screens/pages/shortlink/database/model/linksmodel.dart';

Future<void> addToLinks({
  required String key,
  required String boxName,
  required String longlink,
  required String shortlink,
  String? date,
  String? user,

}) async {
  final box = await Hive.openBox<LinkModel>(boxName);
  final linkModel = LinkModel(longlink, date?? '', user ?? '', shortlink);
  await box.put(key, linkModel);
  await box.close();
  // final cc = await Hive.openBox<LinkModel>('test');
  // print(cc.keys);
  // var value = cc.get('hmm');
  // print(value?.longlink);
}