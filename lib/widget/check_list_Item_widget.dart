import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/presentation/colors_value.dart';
import 'package:task/servermodel/model/check_list_model.dart';
import 'package:task/utils/size_config.dart';
import 'package:task/widget/checklistinput/check_list_input_item_view.dart';
import 'package:task/widget/line_widget.dart';

class CheckListItemWidget extends StatelessWidget{
  final ExpandableController expandedControl = ExpandableController();
  final CheckListModel checkListModel;


  CheckListItemWidget({required this.checkListModel}) ;
  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
   return ExpandableNotifier(
       controller: expandedControl,
       child: ExpandablePanel(
           theme: const ExpandableThemeData(
             headerAlignment: ExpandablePanelHeaderAlignment.center,
             tapBodyToExpand: true,
             tapBodyToCollapse: true,
             hasIcon: false,
           ),
           header: _getHeaderExpanded(sizeConfig, checkListModel),
           collapsed: _collapsed(sizeConfig),
           expanded: _getExpanded(context,sizeConfig, checkListModel)));
  }

  Widget _collapsed(SizeConfig sizeConfig) {
    return Container();
  }

  Widget _getExpanded(BuildContext context,SizeConfig sizeConfig, CheckListModel model) {

    List<Widget> listOfWidget=[];
    model.items.forEach((element) {
      listOfWidget.add(

       CheckListInputItemView(checkListItemModel: element,)
      );
      listOfWidget.add(LineWidget());

    });

    return Container(
        margin: EdgeInsets.only(left: 12, right: 12),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listOfWidget,)
        // child:  ListView.builder(
        //     itemCount: model.items?.length,
        //     physics: NeverScrollableScrollPhysics(),
        //     itemBuilder: (context,index){
        //
        //
        //       return Padding(padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
        //           child: Text(model.items[index].title??'',
        //               style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 14,
        //                   color: ColorsValue.text1
        //               ))
        //
        //
        //
        //       );}
        //
        // )
    );
  }


  Widget _getHeaderExpanded(SizeConfig sizeConfig, CheckListModel model) {
    return
      Padding(padding: EdgeInsets.all(8),child:
      Row( mainAxisAlignment: MainAxisAlignment.center,children: [



        Text(model.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: ColorsValue.text1
            )),

        ExpandableIcon(
          theme: const ExpandableThemeData(
            expandIcon: Icons.keyboard_arrow_down_rounded,
            collapseIcon: Icons.keyboard_arrow_up_rounded,
            iconColor: ColorsValue.text1,
            iconSize: 24,
            iconPadding: EdgeInsets.only(left: 8),
            hasIcon: false,
          ),
        ),

      ]


      ));
  }
}