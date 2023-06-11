import '../../../exception/api_error.dart';

class BaseResponse<T> {
  ApiError? _error;
  late final T data;

  void setException(ApiError error) {
    _error = error;
  }

  bool get hasError => _error != null;
  ApiError get error => _error ?? ApiError("");
}
