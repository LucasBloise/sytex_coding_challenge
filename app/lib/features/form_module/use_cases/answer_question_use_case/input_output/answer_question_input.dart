class AnswerQuestionInput {
  AnswerQuestionInput({
    required this.id,
    required this.answer,
  });
  final String id;
  final Object? answer;
  Map<String, dynamic> toJson() => {'answer': answer};
}
