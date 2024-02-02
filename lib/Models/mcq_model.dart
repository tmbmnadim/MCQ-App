class MCQModel {
  String? question;
  List<String>? options;
  String? category;
  late List<bool> checkBoxValues;
  int? correctAnswer;

  MCQModel({
    this.question,
    this.options,
    this.category,
    required this.checkBoxValues,
    this.correctAnswer,
  });

  MCQModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    options = json['options'].cast<String>();
    category = json['category'];
    checkBoxValues = json['checkBoxValues'].cast<bool>();
    correctAnswer = json['correctAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['options'] = options;
    data['category'] = category;
    data['checkBoxValues'] = checkBoxValues;
    data['correctAnswer'] = correctAnswer;
    return data;
  }
}
