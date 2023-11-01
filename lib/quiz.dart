import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_page.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  String screen = "start_page";
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        screen = 'result_page';
      });
    }
  }

  void switchScreen(String newScreen) {
    setState(() {
      screen = newScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartPage(switchScreen);

    switch (screen) {
      case "start_page":
        activeScreen = StartPage(switchScreen);
      case "question_page":
        activeScreen = QuestionPage(selectAnswer: chooseAnswer);
      case "result_page":
        activeScreen = ResultScreen(
            chosenAnswers: selectedAnswers, showQuizScreen: switchScreen);
        selectedAnswers = [];
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QuizApp",
      home: Scaffold(
        body: activeScreen,
      ),
    );
  }
}
