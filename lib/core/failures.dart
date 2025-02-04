import 'package:dio/dio.dart';

class Failures {
  final String errorMessage;

  Failures({required this.errorMessage});
}

class ApiServerEror extends Failures {
  ApiServerEror({required super.errorMessage});

  factory ApiServerEror.fromDioException(DioException dioExCeption) {
    switch (dioExCeption.type) {
      case DioExceptionType.connectionTimeout:
        return ApiServerEror(errorMessage: 'Api Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ApiServerEror(errorMessage: 'Api sending request Timeout');
      case DioExceptionType.receiveTimeout:
        return ApiServerEror(errorMessage: 'Api Receive requeste Timeout');
      case DioExceptionType.badCertificate:
        return ApiServerEror(errorMessage: 'badCertificate');
      case DioExceptionType.badResponse:
        return ApiServerEror.fromresponse(
            dioExCeption.response!.statusCode!, dioExCeption.response!.data);
      case DioExceptionType.cancel:
        return ApiServerEror(errorMessage: 'Api cancel request');
      case DioExceptionType.connectionError:
        return ApiServerEror(errorMessage: 'No InterNet Connection');
      case DioExceptionType.unknown:
        return ApiServerEror(errorMessage: 'opps there was an erro, Try later');
    }
  }

  factory ApiServerEror.fromresponse(int status, dynamic response) {
    if (status == 400 || status == 401 || status == 403) {
      return ApiServerEror(errorMessage: response["error"]["message"]);
    } else if (status == 404) {
      return ApiServerEror(
          errorMessage: 'Your request not found please. ty later');
    } else if (status == 500) {
      return ApiServerEror(errorMessage: 'Internal server error. try later');
    } else {
      return ApiServerEror(errorMessage: 'opps there was an error, try again');
    }
  }
}
