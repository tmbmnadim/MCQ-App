import 'package:engineeringexamgroup/Screens/Admin/admin_page.dart';
import 'package:engineeringexamgroup/Screens/Authentication/sign_in_page.dart';
import 'package:engineeringexamgroup/Screens/exam_page.dart';
import 'package:engineeringexamgroup/State%20Manager/admin_state.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'State Manager/mcq_state.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const EngineeringExamGroup());
}

class EngineeringExamGroup extends StatelessWidget {
  const EngineeringExamGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MCQState()),
        ChangeNotifierProvider(create: (context) => AdminPanelState()),
      ],
      child: const MaterialApp(
        title: 'Engineering Exam Group - Mansur Nadim',
        home: SignInScreen(),
      ),
    );
  }
}
