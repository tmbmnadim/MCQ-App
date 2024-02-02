import 'package:engineeringexamgroup/Custom%20Widgets/mcq_box.dart';
import 'package:engineeringexamgroup/State%20Manager/mcq_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<MCQState>(context, listen: false).getResult();
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
      body: Consumer<MCQState>(builder: (context, mcq, child) {
        return Column(
          children: [
            Container(
              color: Colors.white,
              height: screenSize.height * 0.55,
              width: screenSize.width,
              child: ListView.builder(
                itemCount: mcq.mcq.length,
                itemBuilder: (context, index) => MCQBox(
                  question: mcq.mcq[index].question!,
                  options: mcq.mcq[index].options!,
                  checkBoxValues: mcq.mcq[index].checkBoxValues,
                  correctAnswer: mcq.mcq[index].correctAnswer,
                  onChanged: (value, index2) {
                    mcq.getResult();
                  },
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
                        "Questions: ${mcq.result["questions"]}",
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
                        "Points: ${mcq.result["points"]}",
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
                        "Correct Answers: ${mcq.result["correctAnswers"]}",
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
                        "Wrong Answers: ${mcq.result["wrongAnswers"]}",
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
        );
      }),
    );
  }
}
