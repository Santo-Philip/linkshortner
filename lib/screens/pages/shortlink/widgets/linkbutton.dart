import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:random_x/random_x.dart';
import 'package:web/screens/controller/logincontroller.dart';
import 'package:web/screens/pages/shortlink/database/functions/add_link.dart';
import 'package:web/screens/pages/shortlink/database/model/linksmodel.dart';

// ignore: must_be_immutable
class GetLinkButton extends StatelessWidget {
  final TextEditingController textlink;
  LoginController loginController = Get.put(LoginController());
  GetLinkButton({required this.textlink, Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: Get.mediaQuery.devicePixelRatio * 50,
          width: Get.mediaQuery.devicePixelRatio * 150,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              )
            ),
            onPressed: () async {
              final Uri uri = Uri.parse(textlink.text);
              if (uri.hasScheme) {
                var hostname = Uri.base.toString();
                var rndstr = RndX.randomString(
                  type: RandomCharStringType.alphaNumerical,
                  length: 5,
                );
                addToLinks(
                  boxName: 'linkdb',
                  key: rndstr,
                  longlink: textlink.text,
                  shortlink: hostname + rndstr,
                  user: loginController.usernameController.text
                );
                
                final db = await Hive.openBox<LinkModel>('linkdb');
                var value = db.get(rndstr);
                Get.snackbar(
                  margin: const EdgeInsets.all(15),
                  'Your link is ready',
                  value!.shortlink,
                  mainButton: TextButton(
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: value.shortlink));
                      Get.snackbar(
                        'Link Copied',
                        'Your link has been copied to your clipboard',
                        barBlur: 40,
                        backgroundColor: const Color.fromARGB(98, 161, 160, 160),
                        snackStyle: SnackStyle.FLOATING,
                        duration: const Duration(seconds: 5),
                        margin: const EdgeInsets.all(30),
                      );
                      Get.back();
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.copy),
                        Text('Copy'),
                      ],
                    ),
                  ),
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(days: 5),
                  snackStyle: SnackStyle.FLOATING,
                );
              } else if (textlink.text.isEmpty) {
                Get.showSnackbar(

                  const GetSnackBar(
                    icon: Icon(Icons.warning),
                    title: 'Warning',
                    message: 'Put a valid link',
                    duration: Duration(seconds: 3),
                    snackPosition: SnackPosition.BOTTOM,
                    snackStyle: SnackStyle.FLOATING,
                    margin: EdgeInsets.all(30),
                    backgroundColor: Color.fromARGB(153, 155, 148, 148),
                    forwardAnimationCurve: Curves.bounceIn,
                    borderRadius: 20,
                  ),
                );
              } else {
                Get.showSnackbar(
                  const GetSnackBar(
                    icon: Icon(Icons.warning),
                    title: 'Warning',
                    message: 'Check the link once again',
                    duration: Duration(seconds: 3),
                    snackPosition: SnackPosition.BOTTOM,
                    snackStyle: SnackStyle.FLOATING,
                    margin: EdgeInsets.all(15),
                    backgroundColor: Color.fromARGB(144, 116, 113, 113),
                    forwardAnimationCurve: Curves.bounceIn,
                    borderRadius: 20,
                  ),
                );
              }
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get Link',
                  style: TextStyle(fontSize: 20, color: Colors.amber),
                ),
                Icon(
                  Icons.arrow_right_alt_outlined,
                  size: 40,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
