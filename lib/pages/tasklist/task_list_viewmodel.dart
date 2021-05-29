import 'package:task/base/base_viewmodel.dart';
import 'package:task/servermodel/model/check_list_model.dart';
import 'package:task/servermodel/model/task_model.dart';
import 'package:task/servermodel/response/task_list_response.dart';
import 'package:task/utils/utils.dart';


class TaskListViewModel extends JobBaseViewModel{




  List<TaskModel> contents = [];

 final int pageSize=10;
  int pageNumber = 0;
  bool finalPage = false;
  bool loadingContents = false;


  @override
  void initialise() {
    getContents();
  }


  void getContents()
  {
    pageNumber++;
    loadingContents=true;
    notifyListeners();
    getStore().getTasks().then(_checkContents);
  }



  TaskListResponse _checkContents(TaskListResponse postsResponse)
  {
    if(postsResponse.isSuccessFull )
      {
        if(postsResponse.result==null || postsResponse.result.length<pageSize)
          finalPage=true;
        
        if(postsResponse.result!=null && postsResponse.result.length>0)
          contents.addAll(postsResponse.result);


      }else {
      finalPage=true;
      Utils.manageError(postsResponse);
    }

    loadingContents=false;

    notifyListeners();
    
    return postsResponse;

  }












}
