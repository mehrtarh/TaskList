import 'package:task/servermodel/model/check_list_item_model.dart';

class CheckListModel {
  final String name;
  final List<CheckListItemModel> items;

  CheckListModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        items = json["items"] != null
            ? (json['items'] as List)
            .map((contentItem) => CheckListItemModel.fromJson(contentItem))
            .toList()
            : [];

  Map<String, dynamic> toJson() => {
    'name': name,
    'items':items != null ? items.map((e) => e.toJson()).toList() : null,
  };
}
