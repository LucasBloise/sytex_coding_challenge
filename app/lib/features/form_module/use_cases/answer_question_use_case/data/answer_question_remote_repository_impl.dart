import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/input_output/answer_question_input.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/input_output/answer_question_output.dart';

import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/repositories/answer_question_repository.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/http_helper.dart';

class AnswerQuestionRemoteRepositoryImpl implements AnswerQuestionRepository {
  final HttpHelper _httpClient;
  static const String _answerQuestionEndpoint = 'http://localhost:8080/form/content';
  final List<String> _errors = [];

  AnswerQuestionRemoteRepositoryImpl({
    required String baseUrl,
    required HttpHelper httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<AnswerQuestionOutput> getAnswerQuestionOutput(AnswerQuestionInput input) async {
    final url = '$_answerQuestionEndpoint/${input.id}';

    final response = await _httpClient.patch(url, data: input.toJson());

    if (response.isOk) {
      log('datos guardados correctamente: ${input.toJson()}');
      return _mapApiData(response.data as Map<String, dynamic>);
    }

    if (response != null) {
      _errors.add(response.statusCode.toString());
      return AnswerQuestionOutput(
        errors: _errors,
      );
    } else {
      _errors.add('server error');
      return AnswerQuestionOutput(
        errors: _errors,
      );
    }
  }
}

AnswerQuestionOutput _mapApiData(Map<String, dynamic> data) {
  return AnswerQuestionOutput.fromJson(data);
}
