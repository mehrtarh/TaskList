import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/presentation/colors_value.dart';
//, , , , , 
extension CheckedType on String {
  CheckedInputType get checkInputType {
    if (this == 'photo')
      return CheckedInputType.Photo;
    else if (this == 'video')
      return CheckedInputType.Video;
    else if (this == 'checkbox')
      return CheckedInputType.Checkbox;
    else if (this == 'dropdown') return CheckedInputType.Dropdown;
    else if (this == 'text') return CheckedInputType.Text;
    else if (this == 'number') return CheckedInputType.Number;
    else return CheckedInputType.Non;
  }
}

enum CheckedInputType {
  Photo,
  Video,
  Checkbox,
  Dropdown,
  Text,
  Number,
  Non,
}

extension CheckInputTypeExtension on CheckedInputType {
  String get name {
    return this.toString().split(".").last.toLowerCase();
  }
  IconData get icon{
    if (this == CheckedInputType.Photo)
      return Icons.photo_outlined;
    else  if (this == CheckedInputType.Video)
      return Icons.video_call_outlined;
    else  if (this == CheckedInputType.Checkbox)
      return Icons.check_circle_outline;
    else  if (this == CheckedInputType.Dropdown)
      return Icons.arrow_drop_down_circle_outlined;
    else  if (this == CheckedInputType.Text)
      return Icons.text_snippet_outlined;
    else  if (this == CheckedInputType.Number)
      return Icons.confirmation_number_outlined;
    else return Icons.remove;
  }
}
