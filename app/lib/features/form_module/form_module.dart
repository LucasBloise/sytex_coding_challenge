import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sytex_coding_challenge/features/form_module/components/form_container/cubit/form_container_cubit.dart';
import 'package:sytex_coding_challenge/features/form_module/components/index_animated_counter/cubit/index_animated_counter_cubit.dart';
import 'package:sytex_coding_challenge/features/form_module/components/input_chip/cubit/input_chip_cubit.dart';
import 'package:sytex_coding_challenge/features/form_module/pages/form_page.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/data/answer_question_remote_repository_impl.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/interactor/answer_question_use_case.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/interactor/answer_question_use_case_impl.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/repositories/answer_question_repository.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/data/get_form_questions_remote_repository_impl.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/interactor/get_form_questions_use_case.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/interactor/get_form_questions_use_case_impl.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/repositories/get_form_questions_repository.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/connection_helper.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/http_helper.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/navigation_helper.dart';
import 'package:sytex_coding_challenge/ioc/injector/injector.dart';

import '../landing_module/pages/landing_page.dart';

abstract class FormModule {
  static const String FormPageRoute = '/form_page';
  static NavigationHelper? _navigationHelper;

  static Map<String, WidgetBuilder> generateRoutes() {
    return {FormPageRoute: (context) => const FormPage()};
  }

  static void registerDependencies(Injector injector) {
    _navigationHelper = injector.resolve<NavigationHelper>();
    _registerGetFormQuestionsFeature(injector);
  }

  static void _registerGetFormQuestionsFeature(Injector injector) {
    injector
      ..registerFactory<GetFormQuestionsRepository>(
        () => GetFormQuestionsRemoteRepositoryImpl(
          httpClient: injector.resolve<HttpHelper>(),
        ),
      )
      ..registerFactory<GetFormQuestionsUseCase>(
        () => GetFormQuestionsUseCaseImpl(
          getFormQuestionsRepository: injector.resolve<GetFormQuestionsRepository>(),
        ),
      )
      ..registerFactory<AnswerQuestionRepository>(
        () => AnswerQuestionRemoteRepositoryImpl(
          httpClient: injector.resolve<HttpHelper>(),
          baseUrl: '',
        ),
      )
      ..registerFactory<AnswerQuestionUseCase>(
        () => AnswerQuestionUseCaseImpl(
          answerQuestionRepository: injector.resolve<AnswerQuestionRepository>(),
        ),
      )
      ..registerFactory<FormContainerCubit>(
        () => FormContainerCubit(
          getFormQuestionsUseCase: injector.resolve<GetFormQuestionsUseCase>(),
          answerQuestionUseCase: injector.resolve<AnswerQuestionUseCase>(),
          connectionHelper: injector.resolve<ConnectionHelper>(),
        ),
      )
      ..registerFactory<IndexAnimatedCounterCubit>(IndexAnimatedCounterCubit.new)
      ..registerFactory<InputChipCubit>(InputChipCubit.new);
  }

  static Future<void> navigateToFormPage(BuildContext context) async {
    await _navigationHelper!.pushReplace(FormPageRoute, context);
  }
}
