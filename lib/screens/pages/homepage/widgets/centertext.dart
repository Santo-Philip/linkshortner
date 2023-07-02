import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadmeSection extends GetResponsiveView {
   ReadmeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          'Welcome to Mehub',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
