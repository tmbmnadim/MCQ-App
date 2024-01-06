import 'package:engineeringexamgroup/Repos/get_mcq_repo.dart';
import 'package:get/get.dart';

class MCQState extends GetxController {
  List<Map<String, dynamic>> mcq = [];
  Map<String, dynamic> result = {
    "questions": 0,
    "points": 0,
    "correctAnswers": 0,
    "wrongAnswers": 0,
  };

  void updateMCQ() {
    update();
  }

  void getMCQ() {
    mcq = getMCQRepo();
    update();
  }

  void getResult() {
    mcq = getResultRepo();
    result["points"] = 0;
    for (var question in mcq) {
      result["questions"]++;
      if (question["checkBoxValues"][question["correctAnswer"] - 1]) {
        result["points"]++;
        result["correctAnswers"]++;
      } else {
        for (var item in question["checkBoxValues"]) {
          if (item) {
            result["points"] = result["points"] - 0.5;
            result["wrongAnswers"]++;
          }
        }
      }
    }
  }
}
