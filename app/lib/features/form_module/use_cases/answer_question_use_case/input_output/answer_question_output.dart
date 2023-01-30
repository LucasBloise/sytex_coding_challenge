import 'package:sytex_coding_challenge/core/interfaces/error_notifier.dart';

class AnswerQuestionOutput implements ErrorNotifier {
  final String? id;
  final String? index;
  final String? type;
  final int? input_type;
  final String? label;
  final Object? answer;
  final List<String>? errors;

  AnswerQuestionOutput({
    this.id,
    this.index,
    this.type,
    this.input_type,
    this.label,
    this.answer,
    this.errors,
  });

  factory AnswerQuestionOutput.fromJson(Map<String, dynamic> json) => AnswerQuestionOutput(
        id: json['id'] as String,
        index: json['index'] as String,
        type: json['type'] as String,
        input_type: json['input_type'] as int,
        label: json['label'] as String,
        answer: json['answer'],
      );

  @override
  List<String>? getErrors() {
    return errors;
  }

  @override
  bool hasErrors() => errors != null;
}
