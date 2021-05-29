import 'package:task/base/base_viewmodel.dart';
import 'package:task/servermodel/model/check_list_item_model.dart';
import 'package:task/servermodel/model/check_list_model.dart';
import 'package:task/servermodel/model/task_model.dart';
import 'package:task/servermodel/response/task_list_response.dart';
import 'package:task/utils/utils.dart';


class CheckListInputItemVieModel extends JobBaseViewModel{

final CheckListItemModel checkListItemModel;
bool checked=false;

CheckListInputItemVieModel(this.checkListItemModel);



  @override
  void initialise() {

  }

  void updateChecked(bool checked) {
    this.checked=checked;
    notifyListeners();
  }





}
