import 'package:dio/dio.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/http_helper.dart';

class HttpHelperImplementation implements HttpHelper {
  static Future<Dio> _buildDio({bool hasToken = true}) async {
    var dio = Dio();

    if (hasToken) {
      /*
        final token = await _getToken();
        dio.options.headers.addAll({'Authorization' : token});
      */
    }

    return dio;
  }

  @override
  Future<HttpResponse<T>> get<T>(String url,
      {Map<String, dynamic>? query}) async {
    final dio = await _buildDio();
    final Response<T> response = await dio.get(url, queryParameters: query);
    final httpResponse = HttpResponse<T>(response.data, response.statusCode);

    return httpResponse;
  }

  @override
  Future<HttpResponse<T>> patch<T>(String url, {dynamic data}) async {
    final dio = await _buildDio();
    final Response<T> response = await dio.patch(url, data: data);
    final httpResponse = HttpResponse<T>(response.data, response.statusCode);

    return httpResponse;
  }

  @override
  Future<HttpResponse<T>> post<T>(String url, {dynamic data}) async {
    final dio = await _buildDio();
    final Response<T> response = await dio.post(url, data: data);
    final httpResponse = HttpResponse<T>(response.data, response.statusCode);

    return httpResponse;
  }

  @override
  Future<HttpResponse<T>> put<T>(String url, {dynamic data}) async {
    final dio = await _buildDio();
    final Response<T> response = await dio.put(url, data: data);
    final httpResponse = HttpResponse<T>(response.data, response.statusCode);

    return httpResponse;
  }

  @override
  Future<HttpResponse<T>> delete<T>(String url, {dynamic data}) async {
    final dio = await _buildDio();
    final Response<T> response = await dio.delete(url, data: data);
    final httpResponse = HttpResponse<T>(response.data, response.statusCode);

    return httpResponse;
  }
}
