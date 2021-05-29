import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task/api/error/error_model.dart';
import 'package:task/presentation/colors_value.dart';
import 'package:task/servermodel/response/base_respons.dart';
import 'package:overlay_support/overlay_support.dart';

class Utils {
  Utils._();

  static showToast(String message) {
    print(message);
    Widget _toastWidget() {
      return Center(
        child: Container(
            alignment: Alignment.center,
            height: 56,
            width: double.infinity,
            decoration: BoxDecoration(
                color: ColorsValue.toast,
                borderRadius: BorderRadius.circular(16.0)),
            child: Text(
              message,
              style: TextStyle(
                  color: ColorsValue.toastText,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            )),
      );
    }

    showSimpleNotification(Center(child: _toastWidget()),
        elevation: 32, background: Colors.transparent);
  }

  static void manageError(BaseResponse response) {
    if (response.error != null) {
      if (response.error is ErrorModel) {
        ErrorModel errorModel = response.error;
        if (errorModel.message != null) showToast(errorModel.message);
      } else if (response.error is String) showToast(response.error);
    }
  }

  static String getTimeFromDate(String dateStringFormat) {
    DateTime date = DateTime.tryParse(dateStringFormat)!;

    if (date != null)
      return DateFormat('hh:mm a').format(date);
    else
      return '';
  }

  static String getDateFromDate(String dateStringFormat) {
    DateTime date = DateTime.tryParse(dateStringFormat)!;

    if (date != null)
      return DateFormat('"MMMM dd, yyyy"').format(date);
    else
      return '';
  }

  static String getPriorityTime(
      String dateStringFormat1, String dateStringFormat2) {
    DateTime date1 = DateTime.tryParse(dateStringFormat1)!;
    DateTime date2 = DateTime.tryParse(dateStringFormat2)!;
    if (date1 != null && date2 != null) {
      Duration difference = date2.difference(date1);
      return difference.inHours.toString() +
          ':' +
          difference.inMinutes.toString();
    } else
      return '';
  }
}
