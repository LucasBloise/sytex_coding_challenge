import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/input_output/get_form_questions_output.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/interactor/get_form_questions_use_case.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/repositories/get_form_questions_repository.dart';

class GetFormQuestionsUseCaseImpl implements GetFormQuestionsUseCase {
  final GetFormQuestionsRepository _getFormQuestionsRepository;
  GetFormQuestionsUseCaseImpl({required GetFormQuestionsRepository getFormQuestionsRepository})
      : _getFormQuestionsRepository = getFormQuestionsRepository;

  @override
  Future<GetFormQuestionsOutput> execute() async {
    final GetFormQuestionsOutput output = await _getFormQuestionsRepository.getGetFormQuestionsOutput();
    return output;
  }
}
