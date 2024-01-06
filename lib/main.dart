import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/Home.dart';

void main() {
  runApp(const EngineeringExamGroup());
}

class EngineeringExamGroup extends StatelessWidget {
  const EngineeringExamGroup({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Engineering Exam Group - Mansur Nadim',
      home: Home(),
    );
  }
}
