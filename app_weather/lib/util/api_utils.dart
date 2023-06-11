import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../backend/models/response/base_response.dart';
import '../exception/api_error.dart';


Future<BaseResponse<T>> handleApi<T, E>(
    {required Future<E> Function() request,
    Function(T)? onResponse,
    Function(dynamic errorResponse, ApiError)? onError}) async {
  E response;
  ApiError apiError;
  try {
    response = await request();
    if (T == E) {
      onResponse?.call(response as T);
      return BaseResponse()..data = response as T;
    }

    // if (response is GeneralResponse) {
    //   debugPrint("GeneralResponse");
    //   onResponse?.call(response.data);
    //   return BaseResponse()..data = response.data;
    // }
    // if (response is Pagination) {
    //   if (response.data is T) {
    //     onResponse?.call(response.data as T);
    //     return BaseResponse()..data = response.data as T;
    //   }
    // }

    throw 'Invalid response type';
  } on DioException catch (e, stackTrace) {
    debugPrint("Exception occured: $e stackTrace: $stackTrace");
    apiError = ApiError.withError(e);
    onError?.call(e.response?.data, apiError);
    return BaseResponse()..setException(apiError);
  } catch (e, stackTrace) {
    debugPrint("Exception occured: $e stackTrace: $stackTrace");
    apiError = ApiError.unknownError();
    onError?.call(null, apiError);
    return BaseResponse()..setException(apiError);
  }
}
