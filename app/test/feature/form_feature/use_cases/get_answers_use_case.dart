import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import '../components/form_cubit_test.mocks.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/interactor/get_form_questions_use_case.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/repositories/get_form_questions_repository.dart';

@GenerateNiceMocks([MockSpec<GetFormQuestionsUseCase>()])
@GenerateNiceMocks([MockSpec<GetFormQuestionsRepository>()])
void main() {
  var _mockGetFormQuestionsUseCase = MockGetFormQuestionsUseCase();

  test('should return the form question when response is successful', () async {});
}
