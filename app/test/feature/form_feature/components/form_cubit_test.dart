import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sytex_coding_challenge/core/entities/form_questions_entity.dart';
import 'package:sytex_coding_challenge/features/form_module/components/form_container/cubit/form_container_cubit.dart';
import 'package:sytex_coding_challenge/features/form_module/components/form_container/cubit/form_container_state.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/interactor/answer_question_use_case.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/input_output/get_form_questions_output.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/interactor/get_form_questions_use_case.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/connection_helper.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<ConnectionHelper>()])
@GenerateNiceMocks([MockSpec<GetFormQuestionsUseCase>()])
@GenerateNiceMocks([MockSpec<AnswerQuestionUseCase>()])
import 'form_cubit_test.mocks.dart';

void main() {
  blocTest<FormContainerCubit, FormContainerState>(
    'should emit [Loading, ConnectionError] when user does not have connection',
    build: () {
      var _mockConnectionHelper = MockConnectionHelper();
      var _mockGetFormDataUseCase = MockGetFormQuestionsUseCase();
      var _mockSendFormAnswersUseCase = MockAnswerQuestionUseCase();

      when(_mockConnectionHelper.isConnected()).thenAnswer((realInvocation) async => Future.value(false));

      return FormContainerCubit(
        connectionHelper: _mockConnectionHelper,
        answerQuestionUseCase: _mockSendFormAnswersUseCase,
        getFormQuestionsUseCase: _mockGetFormDataUseCase,
      );
    },
    act: (cubit) async => await cubit.getData(),
    expect: () => [
      isA<Loading>(),
      isA<ConnectionError>(),
    ],
  );

  blocTest<FormContainerCubit, FormContainerState>(
    'should emit [Loading, Error] when endpoint failed',
    build: () {
      var _mockConnectionHelper = MockConnectionHelper();
      var _mockGetFormDataUseCase = MockGetFormQuestionsUseCase();
      var _mockSendFormAnswersUseCase = MockAnswerQuestionUseCase();

      when(_mockConnectionHelper.isConnected()).thenAnswer((realInvocation) async => Future.value(true));

      when(_mockGetFormDataUseCase.execute())
          .thenAnswer((realInvocation) async => GetFormQuestionsOutput(errors: ['status code 500']));

      return FormContainerCubit(
        connectionHelper: _mockConnectionHelper,
        answerQuestionUseCase: _mockSendFormAnswersUseCase,
        getFormQuestionsUseCase: _mockGetFormDataUseCase,
      );
    },
    act: (cubit) async => await cubit.getData(),
    expect: () => [
      isA<Loading>(),
      isA<Error>(),
    ],
  );

  blocTest<FormContainerCubit, FormContainerState>(
    'should emit [Loading, Loaded] when endpoint response is correct',
    build: () {
      var _mockConnectionHelper = MockConnectionHelper();
      var _mockGetFormDataUseCase = MockGetFormQuestionsUseCase();
      var _mockSendFormAnswersUseCase = MockAnswerQuestionUseCase();

      when(_mockConnectionHelper.isConnected()).thenAnswer((realInvocation) async => Future.value(true));

      when(_mockGetFormDataUseCase.execute()).thenAnswer((realInvocation) async => GetFormQuestionsOutput(
            questionsData:
                FormQuestionsEntity(name: '', description: 'description', createdAt: DateTime.now(), content: []),
          ));

      return FormContainerCubit(
        connectionHelper: _mockConnectionHelper,
        answerQuestionUseCase: _mockSendFormAnswersUseCase,
        getFormQuestionsUseCase: _mockGetFormDataUseCase,
      );
    },
    act: (cubit) async => await cubit.getData(),
    expect: () => [
      isA<Loading>(),
      isA<Loaded>(),
    ],
  );
}
