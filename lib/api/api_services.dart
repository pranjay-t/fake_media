import 'dart:async';
import 'package:dio/dio.dart';
import 'package:fake_media/exceptions/app_exception.dart';

/*
 A service class that handles API calls using **Dio**.
 This class provides methods for making **GET** and **POST** requests,
 handling responses, and managing errors gracefully.
*/
class ApiServices{
  // Dio instance for making network requests.
  final Dio _dio = Dio();

  /* 
  Sends a **GET** request to the specified [url].
   - **Returns:** The API response data if successful.
   - **Throws:** An `AppException` if an error occurs.
  */
  Future<dynamic> getApi(String url) async {
    try {
      final response = await _dio.get(url).timeout(const Duration(seconds: 10));
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e){
      throw FetchDataException(e.toString());
    }
  }

   /*
  Sends a **POST** request to the specified [url] with the given [data].
   - **Returns:** The API response data if successful.
   - **Throws:** An `AppException` if an error occurs.
  */
  Future<dynamic> postApi(String url, dynamic data) async {
    try {
      final response = await _dio
          .post(url, data: data, options: Options(contentType: Headers.jsonContentType))
          .timeout(const Duration(seconds: 10));
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /* 
  Handles API responses and processes status codes.
   - **Returns:** The response data if the request is successful.
   - **Throws:** An `AppException` for non-successful responses.
  */
  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 201:
        return response.data;
      case 400:
        throw InvalidUrlException(response.data.toString());
      case 404:
        throw InvalidUrlException(response.data.toString());
      default:
        throw FetchDataException('Server responded with StatusCode ${response.statusCode}');
    }
  }

  /* 
  Handles Dio-specific exceptions and maps them to `AppException`.
   - **Returns:** A specific `AppException` based on the Dio error type.
  */
  AppException _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionError:
        return InternetException('No Internet Connection');
      case DioExceptionType.sendTimeout:
        return RequestTimeOut('Request Timed Out');
      case DioExceptionType.cancel:
        return FetchDataException('Request Cancelled');
      case DioExceptionType.badResponse:
        return InvalidUrlException(e.message ?? 'Bad Response from Server');
      default:
        return FetchDataException(e.message);
    }
  }
}
