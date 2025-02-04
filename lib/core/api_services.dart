import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;

  ApiServices({required Dio dio}) : _dio = dio;
  final String baseUrl = 'https://v3.football.api-sports.io/';
  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParams,
  }) async {
    Response response = await _dio.get('$baseUrl$endPoint',
        queryParameters: queryParams,
        options: Options(headers: {
          'x-apisports-key': '6cc1b7258f915c57006c23d99e580ccd',
        }));

    Map<String, dynamic> jsonData = response.data;
    return jsonData;
  }
}
