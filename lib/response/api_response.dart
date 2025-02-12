import 'package:fake_media/response/status.dart';

/*
  A generic class to handle API responses with different states.
  This class represents the status of an API call along with the corresponding data or error message.
*/
class ApiResponse<T> {
  // The status of the API response (loading, success, or error).
  Status? status;
  // The data returned from the API (if successful).
  T? data;
  // The error message (if the API call fails).
  String? message;

  /// Creates an [ApiResponse] with the given status, data, and message.
  ApiResponse(this.status, this.data, this.message);

  /// Creates an [ApiResponse] indicating that the request is loading.
  ApiResponse.loading() : status = Status.loading;

  /// Creates an [ApiResponse] indicating that the request was successful with data.
  ApiResponse.success(this.data) : status = Status.success;

  /// Creates an [ApiResponse] indicating that the request failed with an error message.
  ApiResponse.error(this.message) : status = Status.error;
}