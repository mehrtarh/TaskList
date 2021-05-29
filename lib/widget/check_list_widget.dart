import 'package:community_material_icon/community_material_icon.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/enums/status_type.dart';
import 'package:task/pages/single/task_viewmodel.dart';
import 'package:task/pages/tasklist/task_list_viewmodel.dart';
import 'package:task/presentation/colors_value.dart';
import 'package:task/presentation/texts_value.dart';
import 'package:task/servermodel/model/check_list_model.dart';
import 'package:task/servermodel/model/task_model.dart';
import 'package:task/utils/size_config.dart';
import 'package:task/utils/utils.dart';

import 'check_list_Item_widget.dart';

class CheckListWidget extends StatelessWidget {
  final TaskModel taskModel;


   CheckListWidget({required this.taskModel}) ;

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
              decoration: BoxDecoration(
                  color: taskModel.taskStatus.statusType.color,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              padding: EdgeInsets.all(16),
              child: Text(TextsValue.checkList,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 22,
                      color: ColorsValue.text4,
                      fontWeight: FontWeight.bold))),


          _getCheckList(sizeConfig,taskModel)
        ],
      ),
      width: sizeConfig.screenWidth,
    
      decoration: BoxDecoration(
          color: ColorsValue.taskSmallItem,
          borderRadius: BorderRadius.circular(16)),
    );
  }

  Widget _getCheckList(SizeConfig sizeConfig,TaskModel model)
  {
    List<Widget> listOfWidget=[];
    model.checkList.forEach((element) {
      listOfWidget.add(
          CheckListItemWidget(checkListModel:element,)
      );
    });
return Padding(padding: EdgeInsets.only(top: 16,bottom: 16),child: Column(children:
  listOfWidget,));

  }


}
