// ignore_for_file: prefer_typing_uninitialized_variables

class AppException implements Exception{
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix: $_message';
  }
  
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, 'No Internet Connection');
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message, 'Request Time Out');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Internal Server Error');
}

class InvalidUrlException extends AppException {
  InvalidUrlException([String? message]) : super(message, 'Invalid Url');
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'Error During Communication'); 
}