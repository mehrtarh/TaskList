import 'check_list_model.dart';

class TaskModel {
  final String taskName;
  final int taskStatus;
  final String taskLocation;
  final String taskType;
  final String startTime;
  final String finishByTime;
  final List<CheckListModel> checkList;

  TaskModel.fromJson(Map<String, dynamic> json)
      : taskName = json["task_name"],
        taskStatus = json["task_status"],
        taskLocation = json["task_location"],
        taskType = json["task_type"],
        startTime = json["start_time"],
        finishByTime = json["finishBy_time"],
        checkList = json["check_list"] != null
            ? (json['check_list'] as List)
                .map((contentItem) => CheckListModel.fromJson(contentItem))
                .toList()
            : [];

  Map<String, dynamic> toJson() => {
        'task_name': taskName,
        'task_status': taskStatus,
        'task_location': taskLocation,
        'task_type': taskType,
        'start_time': startTime,
        'finishBy_time': finishByTime,
        'check_list':
        checkList != null ? checkList.map((e) => e.toJson()).toList() : null,
      };
}
