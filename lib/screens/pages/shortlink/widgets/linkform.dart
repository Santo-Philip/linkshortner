import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinkForm extends StatelessWidget {
  final TextEditingController textlink;

  const LinkForm({required this.textlink, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: Get.mediaQuery.devicePixelRatio * 170,
          width: Get.mediaQuery.devicePixelRatio * 600,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Link Shortener',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w100),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  maxLength: 2048,
                  controller: textlink,
                  decoration: InputDecoration(
                    labelText: 'Enter your Email Here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(width: 20),
                    ),
                    icon: const Icon(Icons.link_rounded),
                  ),
                ),
                // ... Add the remaining code for the link form section
              ],
            ),
          ),
        ),
      ),
    );
  }
}
