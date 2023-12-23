import 'package:flutter/material.dart';
import 'package:flutter_survey/flutter_survey.dart';

import '../../consts/colors.dart';

class ChallengePage extends StatelessWidget {
  final String title;
  const ChallengePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    List<QuestionResult> _questionResults = [];
    final List<Question> mobileData = [
      Question(
        isMandatory: true,
        question: 'What is Flutter primarily used for?',
        answerChoices: {
          "Web development": null,
          "Mobile app development": null,
          "Database management": null,
          "Game development": null,
        },
      ),
      Question(
        isMandatory: true,
        question: 'Which type of widget does not maintain state in Flutter?',
        answerChoices: {
          "Stateless Widget": null,
          "Stateful Widget": null,
          "Inherited Widget": null,
          "Stateful Builder": null,
        },
      ),
      Question(
        isMandatory: true,
        question:
            'Explain the difference between stateful and stateless widgets in Flutter.',
      ),
    ];

    final List<Question> webData = [
      Question(
        isMandatory: true,
        question:
            'What is the purpose of CSS Flexbox and how is it used in web development?',
      ),
      Question(
        isMandatory: true,
        question:
            'What are the benefits of using a frontend framework in web development?',
      ),
      Question(
        isMandatory: true,
        question: 'Compare and contrast ReactJS, Angular, and Vue.js.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$title Challenges",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Survey(
            onNext: (questionResults) {
              _questionResults = questionResults;
            },
            initialData: title == "Mobile" ? mobileData : webData),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: AppColors.mainColor,
        child: Icon(
          Icons.done,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
