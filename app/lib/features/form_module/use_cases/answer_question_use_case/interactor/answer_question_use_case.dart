import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/input_output/answer_question_input.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/input_output/answer_question_output.dart';

abstract class AnswerQuestionUseCase {
  Future<AnswerQuestionOutput> execute(AnswerQuestionInput input);
}
