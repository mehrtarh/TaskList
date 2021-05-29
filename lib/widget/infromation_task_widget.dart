import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/enums/status_type.dart';
import 'package:task/presentation/colors_value.dart';
import 'package:task/presentation/texts_value.dart';
import 'package:task/servermodel/model/task_model.dart';
import 'package:task/utils/size_config.dart';
import 'package:task/utils/utils.dart';
import 'package:task/widget/line_widget.dart';

class TaskInformationWidget extends StatelessWidget {
  final TaskModel taskModel;

  const TaskInformationWidget({required this.taskModel}) ;

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          taskModel.taskName ,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorsValue.text1,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: taskModel.taskStatus.statusType.color,
                            borderRadius: BorderRadius.circular(16)),
                        padding: EdgeInsets.all(16),
                        child: Text(taskModel.taskStatus.statusType.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorsValue.text4,
                                fontWeight: FontWeight.bold)),
                      )),
                ],
              )),
          LineWidget(),
          Padding(
              padding: EdgeInsets.all(16),
              child: Row(children: [
                Icon(
                  CommunityMaterialIcons.format_list_bulleted_type,
                  size: 18,
                  color: ColorsValue.text1,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(taskModel.taskType ,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14,
                        color: ColorsValue.text2,
                        fontWeight: FontWeight.normal)),
              ])),
          LineWidget(),
          Padding(
              padding: EdgeInsets.all(16),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 18,
                  color: ColorsValue.text1,
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Text(taskModel.taskLocation ,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            color: ColorsValue.text2,
                            fontWeight: FontWeight.normal))),
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsValue.dateBackground),
                    child: Icon(
                      CommunityMaterialIcons.subdirectory_arrow_right,
                      size: 18,
                      color: ColorsValue.text1,
                    )),
              ])),
          LineWidget(),
          Padding(
              padding: EdgeInsets.only(top: 16, bottom: 8, right: 16, left: 16),
              child: Row(children: [
                Icon(
                  Icons.date_range_outlined,
                  size: 18,
                  color: ColorsValue.text1,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(Utils.getDateFromDate(taskModel.startTime),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14,
                        color: ColorsValue.text2,
                        fontWeight: FontWeight.normal)),
              ])),
          Padding(
              padding: EdgeInsets.only(top: 8,right: 16,left:16,bottom: 16),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Icon(
                  CommunityMaterialIcons.clock_outline,
                  size: 18,
                  color: ColorsValue.text1,
                ),
                SizedBox(
                  width: 8,
                ),
                    RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorsValue.text1,
                              fontWeight: FontWeight.normal),
                        children: <TextSpan>[
                          TextSpan(text:  TextsValue.start +
                              Utils.getTimeFromDate(taskModel.startTime ) +
                              ' - ' +
                              TextsValue.end +
                              Utils.getTimeFromDate(taskModel.finishByTime ) ),
                          TextSpan(text: "\n"),
                          TextSpan(
                              text: TextsValue.timeForTask +
                                  Utils.getPriorityTime(taskModel.startTime ,
                                      taskModel.finishByTime ),
                              style: TextStyle(
                             color: ColorsValue.text2,
                                  fontWeight: FontWeight.normal
                              ),),

                        ],
                      ),
                    ),
              ])),
        ],
      ),
      width: sizeConfig.screenWidth,
      height: ((sizeConfig.screenWidth - 32) * 300) / 343,
      decoration: BoxDecoration(
          color: ColorsValue.taskSmallItem,
          borderRadius: BorderRadius.circular(16)),
    );
  }
}
