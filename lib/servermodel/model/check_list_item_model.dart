class CheckListItemModel {
  final String title;
  final String input;

  CheckListItemModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        input = json["input"];

  Map<String, dynamic> toJson() => {
    'title': title,
    'input': input,
  };
}
