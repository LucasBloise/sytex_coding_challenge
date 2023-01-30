import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/input_output/get_form_questions_output.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/repositories/get_form_questions_repository.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/http_helper.dart';

class GetFormQuestionsRemoteRepositoryImpl implements GetFormQuestionsRepository {
  final HttpHelper _httpClient;
  final List<String> _errors = [];
  static const String _getFormQuestionsEndpoint = 'http://localhost:8080/form';

  GetFormQuestionsRemoteRepositoryImpl({
    required HttpHelper httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<GetFormQuestionsOutput> getGetFormQuestionsOutput() async {
    const url = _getFormQuestionsEndpoint;

    final response = await _httpClient.get(url);
    if (response.isOk) {
      return _mapApiData(response.data as Map<String, dynamic>);
    }

    if (response != null) {
      _errors.add(response.statusCode.toString());
      return GetFormQuestionsOutput(
        errors: _errors,
      );
    } else {
      _errors.add('server error');
      return GetFormQuestionsOutput(
        errors: _errors,
      );
    }
  }
}

GetFormQuestionsOutput _mapApiData(Map<String, dynamic> data) {
  return GetFormQuestionsOutput.fromJson(data);
}
