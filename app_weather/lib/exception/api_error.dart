import 'package:dio/dio.dart' hide Headers;

class ApiError implements Exception {
  int _errorCode = 0;
  String _errorMessage = "";

  ApiError.withError(DioException error) {
    _errorCode = error.response?.statusCode ?? 0;

    if (error.response != null && error.response!.data is Map) {
      var errorResponse = error.response!.data as Map<String, dynamic>;
      if (errorResponse["message"] is String) {
          _errorMessage = errorResponse["message"];
          return;
        }
    }

    _handleError(error);
  }

  ApiError(String message) {
    _errorMessage = message;
  }

  ApiError.unknownError() {
    _errorMessage = "Unknown Error";
  }

  int getErrorCode() {
    return _errorCode;
  }

  String get errorMessage => _errorMessage;

  void _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        _errorMessage = "Request was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioExceptionType.connectionError:
        _errorMessage = "Connection error";
        break;
      case DioExceptionType.badCertificate:
        _errorMessage =
            "Connection failed due to bad certificate";
        break;
      case DioExceptionType.receiveTimeout:
        _errorMessage = "Receive timeout in connection";
        break;
      case DioExceptionType.badResponse:
        _errorMessage =
            "Received invalid status code: ${error.response?.statusCode ?? 'NO STATUS CODE'}";
        break;
      case DioExceptionType.sendTimeout:
        _errorMessage = "Receive timeout in send request";
        break;
      case DioExceptionType.unknown:
        _errorMessage = "Unknown error";
        break;
    }
  }
}