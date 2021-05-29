import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/enums/input_type.dart';
import 'package:task/presentation/colors_value.dart';
import 'package:task/servermodel/model/check_list_item_model.dart';
import 'package:provider/provider.dart';

import 'check_list_input_item_viewmodel.dart';

class CheckListInputItemView extends StatelessWidget {
  final CheckListItemModel checkListItemModel;

  const CheckListInputItemView({ required this.checkListItemModel});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CheckListInputItemVieModel>(
        create: (context) {
      CheckListInputItemVieModel viewModel =
          CheckListInputItemVieModel(checkListItemModel);
      viewModel.initialise();
      return viewModel;
    }, child: Consumer<CheckListInputItemVieModel>(
      builder: (context, model, child) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(model.checkListItemModel.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: ColorsValue.text1)))),
              Row(children: [
                Checkbox(
                    value: model.checked,
                    activeColor: ColorsValue.text1,
                    onChanged: (checked) {
                      model.updateChecked(checked??false);
                    }),
                Icon(
                  model.checkListItemModel.input.checkInputType.icon,
                  color: ColorsValue.text3,
                ),
              ]),
            ]);
      },
    ));
  }
}
