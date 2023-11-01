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
  late Widget screen;
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        screen = ResultScreen(
          chosenAnswers: selectedAnswers,
          showQuizScreen: switchScreen,
        );
        selectedAnswers = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // screen = ResultScreen();
    screen = StartPage(switchScreen);
  }

  void switchScreen() {
    setState(() {
      screen = QuestionPage(
        selectAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartPage(switchScreen);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QuizApp",
      home: Scaffold(
        body: screen,
      ),
    );
  }
}
