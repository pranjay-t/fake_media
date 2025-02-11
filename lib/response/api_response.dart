import 'package:fake_media/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.loading; 
  ApiResponse.success(this.data) : status = Status.success; 
  ApiResponse.error(this.message) : status = Status.error; 

}