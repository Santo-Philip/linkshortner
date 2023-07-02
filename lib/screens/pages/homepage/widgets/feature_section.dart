import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FeatureSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap:() {
          Get.toNamed('/sl');
        },
        child: SizedBox(
          child: Container(
            height: Get.height * 0.4,
            width: Get.width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.amber,
            ),
            child: Row(
              children: [
                Lottie.network(
                    'https://assets5.lottiefiles.com/packages/lf20_7tbuvbtj.json'),
      
               Container(
                height: Get.pixelRatio * 100,
                width: Get.pixelRatio * 250,
                 child: Text('This is our flagship product. Please click here to access our cutting-edge link shortener solution.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                      ),
               ),
                  ]),
                ),
        ),
      ),
    );
  }
}
