import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/input_output/answer_question_input.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/input_output/answer_question_output.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/interactor/answer_question_use_case.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/repositories/answer_question_repository.dart';

class AnswerQuestionUseCaseImpl implements AnswerQuestionUseCase {
  final AnswerQuestionRepository _answerQuestionRepository;
  AnswerQuestionUseCaseImpl({required AnswerQuestionRepository answerQuestionRepository})
      : _answerQuestionRepository = answerQuestionRepository;

  @override
  Future<AnswerQuestionOutput> execute(AnswerQuestionInput input) async {
    final output = await _answerQuestionRepository.getAnswerQuestionOutput(input);
    return output;
  }
}
