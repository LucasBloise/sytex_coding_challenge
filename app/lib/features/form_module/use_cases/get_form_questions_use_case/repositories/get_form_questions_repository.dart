import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/input_output/get_form_questions_output.dart';

abstract class GetFormQuestionsRepository {
  Future<GetFormQuestionsOutput> getGetFormQuestionsOutput();
}
