import 'package:engineeringexamgroup/Models/question_model.dart';
import 'package:engineeringexamgroup/Screens/Admin/create_question_page.dart';
import 'package:engineeringexamgroup/State%20Manager/admin_state.dart';
import 'package:engineeringexamgroup/const_data.dart';
import 'package:engineeringexamgroup/custom_widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  UtilManager um = UtilManager();

  @override
  void initState() {
    Provider.of<AdminPanelState>(context, listen: false).getQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel - BY MANSUR NADIM"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height * 0.9,
          width: screenSize.width,
          child: Column(
            children: [
              Divider(
                thickness: 2,
                color: mainColor,
              ),
        
              ///==================================== Create Question Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: um.customButton(
                  width: widgetWidth(screenSize),
                  borderRadius: 5,
                  splashColor: mainColorDarker,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateQuestionPage(),
                      ),
                    );
                  },
                  color: mainColor,
                  child: const Text(
                    "Create Question",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2,
                color: mainColor,
              ),
        
              /// ====================================== Categories Selector
              Consumer<AdminPanelState>(builder: (key, admin, child) {
                return dropDownButton(
                  options: admin.categories,
                  selected: admin.selectedCategory,
                  onChanged: (String? newValue) {
                    admin.changeSelection(newValue!);
                  },
                  screenSize: screenSize,
                );
              }),
        
              Divider(
                thickness: 2,
                color: mainColor,
              ),
        
              Consumer<AdminPanelState>(builder: (_, admin, child) {
                List<QuestionModel> showQuestions = [];
                if (admin.selectedCategory != "All") {
                  showQuestions.addAll(admin.categorizedQuestions);
                } else {
                  showQuestions.addAll(admin.questions);
                }
                return SizedBox(
                  height: screenSize.height * 0.6,
                  width: widgetWidth(screenSize),
                  child: ListView.builder(
                    itemCount: showQuestions.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text("${showQuestions[index].questionTitle}"),
                        ),
                      );
                    },
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDownButton({
    required List<String> options,
    required String selected,
    required Size screenSize,
    required Function(String?)? onChanged,
  }) {
    return SizedBox(
      height: screenSize.height * 0.06,
      width: widgetWidth(screenSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Category:  ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                color: mainColor,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              child: DropdownButton(
                value: selected,
                underline: const SizedBox(),
                isDense: true,
                menuMaxHeight: 200,
                iconSize: 30,
                iconEnabledColor: Colors.white,
                dropdownColor: mainColor,
                onChanged: onChanged,
                items: List.generate(
                  options.length,
                  (index) => DropdownMenuItem(
                    value: options[index],
                    child: Text(
                      options[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double widgetWidth(Size screenSize) {
    if (screenSize.width >= (screenSize.height * (9 / 16))) {
      return (screenSize.height * (9 / 16));
    }
    return screenSize.width;
  }
}
