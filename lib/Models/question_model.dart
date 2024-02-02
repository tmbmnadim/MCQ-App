class QuestionModel {
  String? questionTitle;
  String? questionID;
  String? questionLink;
  String? password;
  int? duration;
  bool? published;
  String? category;
  int? repeatExam;

  QuestionModel({
    this.questionTitle,
    this.questionID,
    this.questionLink,
    this.password,
    this.duration,
    this.published,
    this.category,
    this.repeatExam,
  });

  QuestionModel.fromJson(Map<String, dynamic> json) {
    questionTitle = json['questionTitle'];
    questionLink = json['questionLink'];
    password = json['password'];
    questionID = json['questionID'];
    duration = json['duration'];
    published = json['published'];
    category = json['category'];
    repeatExam = json['repeatExam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['questionTitle'] = questionTitle;
    data['questionLink'] = questionLink;
    data['password'] = password;
    data['questionID'] = questionID;
    data['duration'] = duration;
    data['published'] = published;
    data['category'] = category;
    data['repeatExam'] = repeatExam;
    return data;
  }
}
