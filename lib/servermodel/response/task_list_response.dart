import 'package:task/api/error/error_model.dart';
import 'package:task/api/error/error_type.dart';
import 'package:task/servermodel/model/task_model.dart';
import 'base_respons.dart';

class  TaskListResponse extends BaseResponse<List<TaskModel>>{
  bool isEmpty=false;

  TaskListResponse.fromJson(Map<String,dynamic>json):
        super.fromJson(json,
          (json['data'] as List)
              .map((contentItem) {
                return TaskModel.fromJson(contentItem);
              })
              .toList());


  Map<String, dynamic> toJson()
  {
    List<TaskModel> _result=result;

    return super.toJsonBase(_result.map((e) => e.toJson()).toList());
  }


  TaskListResponse.withError(ErrorModel errorModel) : super.withError(errorModel);

  TaskListResponse.createEmpty():
      isEmpty=true,
       super.withError(ErrorModel('', ErrorType.None));



}