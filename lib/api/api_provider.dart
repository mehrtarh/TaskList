import 'dart:async';

import 'package:task/api/api.dart';
import 'package:task/servermodel/response/task_list_response.dart';

import 'error/error_handling.dart';
abstract class ApiProviderAbstract {

  Future<TaskListResponse> getTasks();

}

class ApiProviderI implements ApiProviderAbstract{

  final MyApi _jobApi;

  ApiProviderI () : _jobApi = MyApiImplementation();



  @override
  Future<TaskListResponse> getTasks() async{
    try{
      return _jobApi.getTasks();
    } catch (error) {
      var completer = new Completer<TaskListResponse>();
      completer.complete(TaskListResponse.withError(ErrorHandling.getErrorModel(error as Exception)));
      return completer.future;
    }
  }

}

