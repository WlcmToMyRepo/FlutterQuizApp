class Question {
  final String text;
  final List<String> answers;

  const Question(this.text, this.answers);

  List<String> get shuffledAnswers {
    final answercopy = List.of(answers);
    answercopy.shuffle();
    return answercopy;
  }
}
