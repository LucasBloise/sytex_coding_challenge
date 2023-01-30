import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sytex_coding_challenge/features/form_module/components/form_container/cubit/form_container_state.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/input_output/answer_question_input.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/interactor/answer_question_use_case.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/interactor/get_form_questions_use_case.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/connection_helper.dart';

class FormContainerCubit extends Cubit<FormContainerState> {
  final GetFormQuestionsUseCase _getFormQuestionsUseCase;
  final AnswerQuestionUseCase _answerQuestionUseCase;
  final ConnectionHelper _connectionHelper;
  FormContainerCubit({
    required GetFormQuestionsUseCase getFormQuestionsUseCase,
    required AnswerQuestionUseCase answerQuestionUseCase,
    required ConnectionHelper connectionHelper,
  })  : _getFormQuestionsUseCase = getFormQuestionsUseCase,
        _answerQuestionUseCase = answerQuestionUseCase,
        _connectionHelper = connectionHelper,
        super(Initial());

  Future<void> getData() async {
    emit(Loading());
    if (await userIsNotConnected()) {
      emit(ConnectionError());
      return;
    }

    final formDataOutput = await _getFormQuestionsUseCase.execute();

    if (formDataOutput.hasErrors()) {
      emit(
        Error(formDataOutput.errors!.first),
      );
    } else {
      emit(
        Loaded(formDataOutput.questionsData!),
      );
    }
  }

  Future<void> saveAnswer(AnswerQuestionInput input) async {
    final formData = await _answerQuestionUseCase.execute(input);
  }

  Future<bool> userIsNotConnected() async => !await _connectionHelper.isConnected();
}
