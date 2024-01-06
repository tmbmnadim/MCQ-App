class QuestionModel {
  final String question;
  final List<String> answers;
  final int correctAnswer;
  final List<bool> checkBoxValues;

  QuestionModel({
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.checkBoxValues,
  });
}
