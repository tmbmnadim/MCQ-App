import 'package:engineeringexamgroup/Screens/Admin/admin_page.dart';
import 'package:engineeringexamgroup/State%20Manager/admin_state.dart';
import 'package:engineeringexamgroup/custom_widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const_data.dart';

class CreateQuestionPage extends StatefulWidget {
  const CreateQuestionPage({super.key});

  @override
  State<CreateQuestionPage> createState() => _CreateQuestionPageState();
}

class _CreateQuestionPageState extends State<CreateQuestionPage> {
  UtilManager um = UtilManager();
  TextEditingController questionTitleController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController repeatExamController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: screenSize.height * 0.95,
              width: screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Create a New Question",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 30),
                  um.customTextField(
                    controller: questionTitleController,
                    hintText: "Title of the Question",
                    hintColor: Colors.grey,
                    focusedColor: mainColor,
                    enabledBorderColor: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  um.customTextField(
                    controller: passwordController,
                    hintText: "Password",
                    hintColor: Colors.grey,
                    focusedColor: mainColor,
                    enabledBorderColor: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  um.customTextField(
                    controller: durationController,
                    hintText: "Duration of Exam.(ex: 10min)",
                    hintColor: Colors.grey,
                    focusedColor: mainColor,
                    enabledBorderColor: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  categoryField(screenSize: screenSize),
                  const SizedBox(height: 10),
                  um.customTextField(
                    controller: repeatExamController,
                    hintText: "Times examinee can take the exam? ex: 1",
                    hintColor: Colors.grey,
                    focusedColor: mainColor,
                    enabledBorderColor: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  submitCancelButtons(
                    screenSize: screenSize,
                    onSubmit: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Provider.of<AdminPanelState>(context, listen: false)
                          .addNewQuestion(
                        title: questionTitleController.text,
                        password: passwordController.text,
                        duration: int.tryParse(durationController.text) ?? 0,
                        category: categoryController.text,
                        repeat: int.tryParse(repeatExamController.text) ?? 1,
                      );
                      if(context.mounted){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdminPage(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryField({required Size screenSize}) {
    return Consumer<AdminPanelState>(builder: (_, admin, child) {
      return SizedBox(
        height: 50 + admin.searchCategory.length * 65,
        child: Column(
          children: [
            um.customTextField(
              controller: categoryController,
              hintText: "Ex: Computer Technology",
              hintColor: Colors.grey,
              focusedColor: mainColor,
              suffixIcon: suffixIconButton(
                onTap: () {
                  /// If the category is not in our list it will
                  /// be added else it will not be added
                  if (!admin.categories.contains(categoryController.text)) {
                    admin.addNewCategory(newCategory: categoryController.text);
                  }
                },
              ),
              enabledBorderColor: Colors.grey,
              onChanged: (value) {
                admin.searchCategoryFunc(searchValue: value);
              },
            ),
            SizedBox(
              /// This makes sure that the height is only for 3
              /// Cards or less.
              height: admin.searchCategory.length < 3
                  ? admin.searchCategory.length * 65
                  : 3 * 65,
              width: screenSize.width,
              child: ListView.builder(
                /// Limits itemCount to less than 4
                itemCount: admin.searchCategory.length < 3
                    ? admin.searchCategory.length
                    : 3,
                itemBuilder: (context, index) {
                  return Card(
                    color: mainColor,
                    child: ListTile(
                      onTap: () {
                        categoryController.text = admin.searchCategory[index];
                        admin.clearSearchCategory();
                      },
                      title: Text(
                        admin.searchCategory[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget suffixIconButton({required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(10),
          ),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget submitCancelButtons({
    required Size screenSize,
    required Function() onSubmit,
  }) {
    return SizedBox(
      width: screenSize.width,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          um.customButton(
            width: 100,
            borderRadius: 5,
            borderColor: mainColor,
            borderWidth: 2,
            splashColor: mainColorDarker,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminPage(),
                ),
              );
            },
            color: Colors.transparent,
            child: Text(
              "Cancel",
              style: TextStyle(
                color: mainColor,
                fontSize: 22,
              ),
            ),
          ),
          um.customButton(
            width: 100,
            borderRadius: 5,
            splashColor: mainColorDarker,
            onTap: onSubmit,
            color: mainColor,
            child: const Text(
              "Submit",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    questionTitleController.dispose();
    durationController.dispose();
    categoryController.dispose();
    repeatExamController.dispose();
    super.dispose();
  }
}
