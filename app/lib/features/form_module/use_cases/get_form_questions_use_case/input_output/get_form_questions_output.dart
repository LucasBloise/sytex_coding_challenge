import 'package:sytex_coding_challenge/core/entities/form_questions_entity.dart';
import 'package:sytex_coding_challenge/core/interfaces/error_notifier.dart';

class GetFormQuestionsOutput implements ErrorNotifier {
  final FormQuestionsEntity? questionsData;
  final List<String>? errors;

  GetFormQuestionsOutput({
    this.questionsData,
    this.errors,
  });

  @override
  List<String>? getErrors() {
    return errors;
  }

  @override
  bool hasErrors() => errors != null;

  factory GetFormQuestionsOutput.fromJson(Map<String, dynamic> json) =>
      GetFormQuestionsOutput(questionsData: FormQuestionsEntity.fromJson(json));
}
