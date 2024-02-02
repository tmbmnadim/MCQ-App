import 'package:engineeringexamgroup/Screens/exam_page.dart';
import 'package:engineeringexamgroup/Screens/test_result.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  List<Widget> bottomPages = [
    ExamPage(),
    ResultPage(),
    ResultPage(),
    ResultPage(),
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          bottomPages.elementAt(_currentPage),
          // PageView(
          //   controller: PageController(
          //     initialPage: 0,
          //   ),
          //   physics: const NeverScrollableScrollPhysics(),
          //   children: const [
          //      ExamPage(),
          //     ResultPage(),
          //     ResultPage(),
          //   ],
          // ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: screenSize.height * 0.08,
              width: screenSize.width,
              child: BottomNavigationBar(
                currentIndex: _currentPage,
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.black54,
                onTap: (index) {
                  _currentPage = index;
                  setState(() {});
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.edit_document),
                    label: "Exam",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.markunread_mailbox_outlined),
                    label: "Result",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.markunread_mailbox_outlined),
                    label: "Result",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu),
                    label: "Menu",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
