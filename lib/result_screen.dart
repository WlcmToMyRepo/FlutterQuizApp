import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_data.dart';
// import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final Function(String screen) showQuizScreen;
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.showQuizScreen});

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].text,
        'userAnswer': chosenAnswers[i],
        'correctAns': questions[i].answers[0],
        'rightAnswer': questions[i].answers[0] == chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 48, 9, 138),
            Color.fromARGB(255, 81, 6, 110),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "You have answered ${summaryData.where((element) => element['rightAnswer'] == true).length} out of ${questions.length} questions",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // QuestionsSummary(summaryData: summaryData),
          //this code snippet is my custom summarylist
          SizedBox(height: 600, child: SummaryList(summary: summaryData)),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
              onPressed: () {
                showQuizScreen('question_page');
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              child: const Text("Restart quiz"))
        ],
      ),
    );
  }
}

class SummaryList extends StatelessWidget {
  final List<Map<String, Object>> summary;
  const SummaryList({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: summary.length,
        separatorBuilder: (context, index) => const Divider(
              color: Colors.white,
              height: 2,
            ),
        itemBuilder: (context, index) => ListTile(
            // contentPadding: const EdgeInsets.symmetric(horizontal: 2),
            horizontalTitleGap: 0,
            leading: SizedBox(
              width: 5,
              child: Text("${index + 1}",
                  style: const TextStyle(color: Colors.white)),
            ),
            // leadingAndTrailingTextStyle: const TextStyle(color: Colors.white),
            title: Text(
              summary[index]['question'].toString(),
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summary[index]['correctAns'].toString(),
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                ),
                Text(
                  summary[index]['userAnswer'].toString(),
                  style: TextStyle(
                    color: summary[index]['rightAnswer'] == true
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ],
            ),
            trailing: summary[index]['rightAnswer'] == true
                ? const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 30,
                    textDirection: TextDirection.rtl,
                  )
                : const Icon(
                    Icons.cancel,
                    size: 30,
                    color: Colors.red,
                    textDirection: TextDirection.rtl,
                  )));
  }
}
