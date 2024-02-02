import 'dart:async';

import 'package:engineeringexamgroup/Custom%20Widgets/mcq_box.dart';
import 'package:engineeringexamgroup/State%20Manager/mcq_state.dart';
import 'package:engineeringexamgroup/Screens/test_result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  late Timer _timer;
  int _start = 20;

  @override
  void initState() {
    super.initState();
    Provider.of<MCQState>(context, listen: false).getMCQ();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenSize.height * 0.07,
        title: const Text(
          "Engineering Exam Group - Mansur Nadim",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            height: screenSize.height * 0.07,
            width: screenSize.width,
            child: Center(
              child: Text(
                "Time Left: $_start",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Consumer<MCQState>(
            builder: (context, mcq, _) => Container(
              color: Colors.white,
              height: screenSize.height * 0.75,
              width: screenSize.width,
              child: ListView.builder(
                itemCount: mcq.mcq.length + 1,
                itemBuilder: (context, index) {
                  if (mcq.mcq.length > index) {
                    return IgnorePointer(
                      ignoring: (_start == 0),
                      child: MCQBox(
                        question: mcq.mcq[index].question!,
                        options: mcq.mcq[index].options!,
                        checkBoxValues: mcq.mcq[index].checkBoxValues,
                        onChanged: (value, index2) {
                          mcq.mcq[index].checkBoxValues.fillRange(
                            0,
                            mcq.mcq[index].checkBoxValues.length,
                            false,
                          );
                          mcq.mcq[index].checkBoxValues[index2] = value!;
                          mcq.updateMCQ();
                        },
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: Size(screenSize.width, 80),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResultPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     mcqObj.getMCQ();
          //   },
          //   child: Text("Update Questions"),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     resultRepo = mcqObj.mcq;
          //     Get.to(ResultPage());
          //   },
          //   child: Text("Submit"),
          // )
        ],
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}
