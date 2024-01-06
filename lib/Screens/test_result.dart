import 'package:engineeringexamgroup/Custom%20Widgets/mcq_box.dart';
import 'package:engineeringexamgroup/State%20Manager/mcq_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final MCQState mcqObj = Get.put(MCQState());

  @override
  void initState() {
    super.initState();
    mcqObj.getResult();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Engineering Exam Group",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          GetBuilder<MCQState>(
            builder: (mcq) => Container(
              color: Colors.white,
              height: screenSize.height * 0.55,
              width: screenSize.width,
              child: ListView.builder(
                itemCount: mcq.mcq.length,
                itemBuilder: (context, index) => MCQBox(
                  question: mcq.mcq[index]["question"],
                  answers: mcq.mcq[index]["answers"],
                  checkBoxValues: mcq.mcq[index]["checkBoxValues"],
                  correctAnswer: mcq.mcq[index]["correctAnswer"],
                  onChanged: (value, index2) {
                    mcq.getResult();
                  },
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: screenSize.height * 0.3,
            width: screenSize.width,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: screenSize.height * 0.1,
                  width: screenSize.width,
                  child: Center(
                    child: Text(
                      "Questions: ${mcqObj.result["questions"]}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: screenSize.height * 0.1,
                  width: screenSize.width,
                  child: Center(
                    child: Text(
                      "Points: ${mcqObj.result["points"]}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: screenSize.height * 0.05,
                  width: screenSize.width,
                  child: Center(
                    child: Text(
                      "Correct Answers: ${mcqObj.result["correctAnswers"]}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: screenSize.height * 0.05,
                  width: screenSize.width,
                  child: Center(
                    child: Text(
                      "Wrong Answers: ${mcqObj.result["wrongAnswers"]}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
