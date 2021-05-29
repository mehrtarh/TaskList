import 'package:dio/dio.dart';
import 'package:task/servermodel/response/task_list_response.dart';

import 'api_config.dart';
import 'endpoint.dart';
import 'error/error_handling.dart';

abstract class MyApi {
  Future<TaskListResponse> getTasks();

}

class MyApiImplementation implements MyApi {
 late Dio _dio;

  MyApiImplementation() {
    _dio = ApiConfig.createServer();
  }


  @override
  Future<TaskListResponse> getTasks() async {
    try {
      Response response = await _dio.get(
        EndPoint.task,
      );
      return TaskListResponse.fromJson(
          {'data':response.data}
          );
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TaskListResponse.withError(ErrorHandling.getErrorModel(error as Exception));
    }
  }
}
