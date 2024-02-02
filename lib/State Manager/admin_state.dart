import 'package:engineeringexamgroup/Repos/get_question_repo.dart';
import 'package:flutter/material.dart';
import 'package:engineeringexamgroup/Models/question_model.dart';

class AdminPanelState extends ChangeNotifier {
  String selectedCategory = "All";
  List<QuestionModel> questions = [];
  List<QuestionModel> categorizedQuestions = [];
  List<String> searchCategory = [];
  List<String> categories = [
    'All',
    'Favourites',
    'Civil Technology',
    'Computer Technology',
    'Mechanical Technology',
    'Electrical Technology',
    'Power Technology',
  ];

  void getQuestions() async {
    questions = await getQuestionRepo();
    notifyListeners();
  }

  void changeSelection(String selection) {
    selectedCategory = selection;
    if (selection != "All") {
      getCategorizedQuestions();
      notifyListeners();
    } else {
      getQuestions();
    }
  }

  void searchCategoryFunc({required String searchValue}) {
    searchCategory.clear();
    if (searchValue.isNotEmpty) {
      for (var element in categories) {
        if (element.toLowerCase().contains(searchValue.toLowerCase()) &&
            searchCategory.length < 3 &&
            element.toLowerCase() != searchValue.toLowerCase()) {
          searchCategory.add(element);
        }
      }
    } else {
      searchCategory.clear();
    }
    notifyListeners();
  }

  void clearSearchCategory(){
    searchCategory.clear();
    notifyListeners();
  }

  void addNewQuestion({
    required String title,
    required String password,
    required int duration,
    required String category,
    required int repeat,
  }) {
    QuestionModel tempQuestion = QuestionModel(
      questionTitle: title,
      password: password,
      questionID: "${DateTime.now().millisecondsSinceEpoch}",
      duration: duration,
      published: false,
      category: category,
      repeatExam: repeat,
    );
    createQuestionRepo(questionModel: tempQuestion);
    getQuestions();
  }

  void addNewCategory({required String newCategory}) {
    categories.add(newCategory);
    notifyListeners();
  }

  void getCategorizedQuestions() {
    categorizedQuestions = [];
    for (var que in questions) {
      if (que.category == selectedCategory) {
        categorizedQuestions.add(que);
      }
    }
  }
}
