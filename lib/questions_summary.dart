import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionsSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: summaryData.map((data) {
                return Row(
                  children: [
                    Text(
                      ((data['questionIndex'] as int) + 1).toString(),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            data['question'] as String,
                          ),
                          Text(
                            data['userAnswer'] as String,
                          ),
                          Text(
                            data['correctAns'] as String,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList()),
        ));
  }
}
