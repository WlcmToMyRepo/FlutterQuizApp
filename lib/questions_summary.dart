import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionsSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: summaryData.map((data) {
      return Expanded(
          child: Row(
        children: [
          Text(
            "${data['questionIndex']}",
          ),
          Text(
            data['question'] as String,
          ),
        ],
      ));
    }).toList());
  }
}
