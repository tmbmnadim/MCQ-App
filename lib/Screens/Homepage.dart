import 'dart:async';

import 'package:engineeringexamgroup/Custom%20Widgets/mcq_box.dart';
import 'package:engineeringexamgroup/Repos/get_mcq_repo.dart';
import 'package:engineeringexamgroup/State%20Manager/mcq_state.dart';
import 'package:engineeringexamgroup/Screens/test_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final MCQState mcqObj = Get.put(MCQState());

  late Timer _timer;
  int _start = 20;

  @override
  void initState() {
    super.initState();
    mcqObj.getMCQ();
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
          GetBuilder<MCQState>(
            builder: (mcq) => Container(
              color: Colors.white,
              height: screenSize.height * 0.73,
              width: screenSize.width,
              child: ListView.builder(
                itemCount: mcq.mcq.length + 1,
                itemBuilder: (context, index) {
                  if (mcq.mcq.length > index) {
                    return IgnorePointer(
                      ignoring: (_start == 0),
                      child: MCQBox(
                        question: mcq.mcq[index]["question"],
                        answers: mcq.mcq[index]["answers"],
                        checkBoxValues: mcq.mcq[index]["checkBoxValues"],
                        onChanged: (value, index2) {
                          mcq.mcq[index]["checkBoxValues"].fillRange(0,
                              mcq.mcq[index]["checkBoxValues"].length, false);
                          mcq.mcq[index]["checkBoxValues"][index2] = value!;
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
                          resultRepo = mcqObj.mcq;
                          Get.to(ResultPage());
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
