import 'package:dio/dio.dart';
import 'package:task/api/error/error_model.dart';
import 'package:task/api/error/error_type.dart';
import 'package:task/api/error/response_status.dart';

class ErrorHandling {
  static ErrorModel getErrorModel(Exception error) {
    ErrorModel errorModel;
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          errorModel = ErrorModel(
          "Request to API server was cancelled",ErrorType.Cancel);
          break;
        case DioErrorType.connectTimeout:
          errorModel = ErrorModel(
          "Connection timeout with API server",ErrorType.Timeout);
          break;
        case DioErrorType.other:
              errorModel = ErrorModel(
              "Your internet is not connected",ErrorType.Internet_Connection);
          break;
        case DioErrorType.receiveTimeout:
          errorModel = ErrorModel(
              "Receive timeout in connection with API server",ErrorType.Timeout);
          break;
        case DioErrorType.response:
          {
            int statusCode=error.response?.statusCode??0;
            ResponseStatus responseStatus=ResponseStatus.None;
            if(statusCode==401)
              responseStatus=ResponseStatus.Authentication;
            else if(statusCode==400)
              responseStatus=ResponseStatus.BadRequest;
            else if(statusCode>=500)
              responseStatus=ResponseStatus.Server;
            errorModel = ErrorModel(
                "Received invalid status code: ${error.response?.statusCode}",
                ErrorType.Response,status: responseStatus);
            break;
          }
        case DioErrorType.sendTimeout:
          return
              errorModel = ErrorModel(
              "An error occurred. Please try again",ErrorType.Timeout);
          break;
      }
    } else {
      errorModel =  errorModel = ErrorModel("An error occurred. Please try again",ErrorType.Unknown);
    }
    return errorModel;
  }
}
