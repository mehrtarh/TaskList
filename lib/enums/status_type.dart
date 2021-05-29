import 'package:flutter/cupertino.dart';
import 'package:task/presentation/colors_value.dart';

extension TaskStatus on int {
  TaskStatusType get statusType {
    if (this == 0)
      return TaskStatusType.Assigned;
    else if (this == 1)
      return TaskStatusType.InProgress;
    else if (this == 2)
      return TaskStatusType.Successful;
    else if (this == 3) return TaskStatusType.Failed;
    else return TaskStatusType.Failed;
  }
}

enum TaskStatusType {
  Assigned,
  InProgress,
  Successful,
  Failed,
}

extension TaskStatusTypeExtension on TaskStatusType {
  String get name {
    return this.toString().split(".").last;
  }
  Color get color{
    if (this == TaskStatusType.Assigned)
      return ColorsValue.assigned;
    else  if (this == TaskStatusType.Successful)
      return ColorsValue.accepted;
    else  if (this == TaskStatusType.InProgress)
      return ColorsValue.inProgress;
    else if (this == TaskStatusType.Failed) return ColorsValue.failed;
    else return ColorsValue.failed;
  }
}
