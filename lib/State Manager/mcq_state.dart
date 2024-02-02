import 'package:engineeringexamgroup/Models/mcq_model.dart';
import 'package:engineeringexamgroup/Repos/get_mcq_repo.dart';
import 'package:flutter/cupertino.dart';

class MCQState extends ChangeNotifier {
  List<MCQModel> mcq = [];
  Map<String, dynamic> result = {
    "questions": 0,
    "points": 0,
    "correctAnswers": 0,
    "wrongAnswers": 0,
  };

  void updateMCQ() {
    notifyListeners();
  }

  void getMCQ() {
    mcq = getMCQRepo();
    notifyListeners();
  }

  void getResult() {
    result["points"] = 0;
    for (var question in mcq) {
      result["questions"]++;
      if (question.checkBoxValues[question.correctAnswer! - 1]) {
        result["points"]++;
        result["correctAnswers"]++;
      } else {
        for (var item in question.checkBoxValues) {
          if (item) {
            result["points"] = result["points"] - 0.5;
            result["wrongAnswers"]++;
          }
        }
      }
    }
  }
}
