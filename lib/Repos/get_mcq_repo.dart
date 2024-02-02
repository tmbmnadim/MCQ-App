import 'package:engineeringexamgroup/Models/mcq_model.dart';

List<MCQModel> resultRepo = [];

List<MCQModel> getResultRepo() {
  return resultRepo;
}

List<MCQModel> getMCQRepo() {
  List<Map<String, dynamic>> questionsNet = [
    {
      "question": "She insisted on ––– leaving the house.",
      "options": ["he", "him", "himself", "his"],
      "category": "ইংরেজি",
      "checkBoxValues": [false, false, false, false],
      "correctAnswer": 4
    },
    {
      "question": "The phrase “Achilles’ heel” means––",
      "options": [
        "a strong point",
        "a strong solution",
        "a weak point",
        "a permanent solution"
      ],
      "category": "প্রেশনা",
      "checkBoxValues": [false, false, false, false],
      "correctAnswer": 3
    },
    {
      "question": "He does not adhere ––– any principle.",
      "options": ["by", "in", "at", "to"],
      "category": "অগ্রগতি",
      "checkBoxValues": [false, false, false, false],
      "correctAnswer": 4
    },
    {
      "question": "Millennium is a period of–––",
      "options": ["100 year", "1000 year", "1 million year", "1 million year"],
      "category": "Programming",
      "checkBoxValues": [false, false, false, false],
      "correctAnswer": 1
    },
    {
      "question":
          "Identify the passive form of the following sentence : Who has broken this jug?",
      "options": [
        "By whom has this jug been broken?",
        "By whom has this jug broken?",
        "By whom this jug has been broken?",
        "Whom has this gug been broken?"
      ],
      "category": "Programming",
      "checkBoxValues": [false, false, false, false],
      "correctAnswer": 1
    },
    {
      "question": "Who is not a Victorian poet?",
      "options": [
        "Alfred Tennyson",
        "Robert Browning",
        "William Wordsworth",
        "Matthew Arnold"
      ],
      "category": "Programming",
      "checkBoxValues": [false, false, false, false],
      "correctAnswer": 3
    },
    {
      "question": "Which of the following novels was written by George Orwell?",
      "options": [
        "1984",
        "Brave New World",
        "A clockwork Orange",
        "For Whom the Bell Tolls"
      ],
      "category": "Programming",
      "checkBoxValues": [false, false, false, false],
      "correctAnswer": 1
    },
    {
      "question": "Identify the correct sentence:",
      "options": [
        "She speaks English like English",
        "She speaks the English like English",
        "She speaks the English like the English",
        "She speaks English like the English"
      ],
      "category": "Programming",
      "checkBoxValues": [false, false, false, false],
      "correctAnswer": 4
    },
    {
      "question": "When one makes a promise, one must not go ––– on it.",
      "options": ["forward", "back", "by", "around"],
      "category": "Programming",
      "checkBoxValues": [false, false, false, false],
      "correctAnswer": 3
    },
    {
      "question": "I can't put up with him any more. Here put up with' means :",
      "options": ["To protect", "To terminate", "To tolerate", "To prevent"],
      "category": "Programming",
      "checkBoxValues": [false, false, false, false],
      "correctAnswer": 3
    }
  ];
  List<MCQModel> questions = [];
  for (var question in questionsNet) {
    questions.add(MCQModel.fromJson(question));
  }
  return questions;
}
