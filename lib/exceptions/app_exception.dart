// ignore_for_file: prefer_typing_uninitialized_variables
/* 
  A base class for handling custom exceptions in the app.
  This class extends [Exception] and provides a standardized way to handle different types of errors with a message and prefix.
*/
class AppException implements Exception {
  // The error message describing the exception.
  final _message;
  // A prefix that helps categorize the exception type.
  final _prefix;

  AppException([this._message, this._prefix]);

  /// Creates an [AppException] with an optional message and prefix.
  @override
  String toString() {
    return '$_prefix: $_message';
  }
}

// Exception thrown when there is no internet connection.
class InternetException extends AppException {
  /// Creates an [InternetException] with an optional message.
  InternetException([String? message]) : super(message, 'No Internet Connection');
}

// Exception thrown when a request times out.
class RequestTimeOut extends AppException {
  /// Creates a [RequestTimeOut] exception with an optional message.
  RequestTimeOut([String? message]) : super(message, 'Request Time Out');
}

// Exception thrown when the server encounters an error.
class ServerException extends AppException {
  /// Creates a [ServerException] with an optional message.
  ServerException([String? message]) : super(message, 'Internal Server Error');
}

// Exception thrown when an invalid URL is used.
class InvalidUrlException extends AppException {
  /// Creates an [InvalidUrlException] with an optional message.
  InvalidUrlException([String? message]) : super(message, 'Invalid Url');
}

// Exception thrown when there is an issue during data fetching.
class FetchDataException extends AppException {
  /// Creates a [FetchDataException] with an optional message.
  FetchDataException([String? message]) : super(message, 'Error During Communication');
}
