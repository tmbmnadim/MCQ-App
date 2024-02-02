import 'package:engineeringexamgroup/Models/question_model.dart';

// class QuestionRepo {
  List<Map<String, dynamic>> questionsNet = [
    {
      "questionTitle": "Job 1",
      "questionID": "00001",
      "questionLink": "/",
      "password": "12345",
      "duration": 600,
      "published": true,
      "category": "Civil Technology",
      "repeatExam": 2
    },
  ];

  Future<List<QuestionModel>> getQuestionRepo() async {
    List<QuestionModel> questions = [];
    for (var question in questionsNet) {
      questions.add(QuestionModel.fromJson(question));
    }
    return questions;
  }

  void createQuestionRepo({required QuestionModel questionModel}) {
    questionsNet.add(questionModel.toJson());
  }
// }
