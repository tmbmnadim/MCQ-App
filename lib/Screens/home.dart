import 'package:engineeringexamgroup/Screens/Homepage.dart';
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
    Homepage(),
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
          //     Homepage(),
          //     ResultPage(),
          //     ResultPage(),
          //   ],
          // ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: screenSize.height * 0.1,
              width: screenSize.width,
              child: BottomNavigationBar(
                onTap: (index) {
                  _currentPage = index;
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.edit_document), label: "Result"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.edit_document), label: "Result"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
