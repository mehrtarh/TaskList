import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/enums/status_type.dart';
import 'package:task/presentation/colors_value.dart';
import 'package:task/servermodel/model/task_model.dart';
import 'package:task/utils/size_config.dart';
import 'package:task/utils/utils.dart';

class SmallTaskWidget extends StatelessWidget {
  final TaskModel taskModel;

  const SmallTaskWidget({ required this.taskModel}) ;

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorsValue.dateBackground,
                            borderRadius: BorderRadius.circular(16)),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          Utils.getTimeFromDate(taskModel.startTime) +
                              ' - ' +
                              Utils.getTimeFromDate(taskModel.finishByTime),
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
          Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(taskModel.taskName,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      color: ColorsValue.text1,
                      fontWeight: FontWeight.bold))),
          Container(
            margin: EdgeInsets.only(top: 16,bottom: 16),
            height: 2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [ColorsValue.line100, ColorsValue.line0]))),

    Padding(
    padding: EdgeInsets.only(left: 16, right: 16,),child:  Row(
              children: [

                Icon(CommunityMaterialIcons.format_list_bulleted_type,size: 18,color: ColorsValue.text2,),
                SizedBox(width: 8,),
        Text(taskModel.taskType,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                color: ColorsValue.text2,
                fontWeight: FontWeight.bold)),
              ])),

          Padding(
              padding: EdgeInsets.only(left: 16, right: 16,top: 8,bottom: 8),child:

         Row(
crossAxisAlignment: CrossAxisAlignment.start,
              children: [

             Icon(Icons.location_on_outlined,size: 18,color: ColorsValue.text2,),
                SizedBox(width: 8,),
              Expanded(
                  child:  Text(taskModel.taskLocation,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14,
                        color: ColorsValue.text2,
                        fontWeight: FontWeight.bold))),

             Container(
               padding: EdgeInsets.all(8),
                 decoration: BoxDecoration(shape: BoxShape.circle,color: ColorsValue.dateBackground),
                 child: Icon(CommunityMaterialIcons.subdirectory_arrow_right,size: 18,color: ColorsValue.accepted,)),]))
        ],
      ),
      width: sizeConfig.screenWidth,
      height: ((sizeConfig.screenWidth-32) * 213) / 343,
      decoration: BoxDecoration(
          color: ColorsValue.taskSmallItem,
          borderRadius: BorderRadius.circular(16)),
    );
  }
}
