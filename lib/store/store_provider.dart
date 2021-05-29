import 'dart:async';

import 'package:task/api/api_provider.dart';
import 'package:task/api/endpoint.dart';
import 'package:task/api/error/error_model.dart';
import 'package:task/api/error/error_type.dart';
import 'package:task/app/app_model.dart';
import 'package:task/main.dart';
import 'package:task/pref/pref_provider.dart';
import 'package:task/servermodel/response/task_list_response.dart';
import 'package:task/store/store_provider_abstarct.dart';

class StoreProvider extends StoreProviderAbstract {
  StoreProvider();

  ApiProviderAbstract getApi() {
    return getIt<AppModel>().apiProvider;
  }

  PrefProviderAbstract getPref() {
    return getIt<AppModel>().prefProvider;
  }

  @override
  Future<TaskListResponse> getTasks({bool loadFromCache = false, bool loadCacheWhenNotData = true}) async {
    try {
      bool shouldLoadCache = false;
       TaskListResponse result=TaskListResponse.createEmpty();

      if (loadFromCache) {
        result = await _getTaskListCache();
      }
      if (result.isEmpty) {
        result = await getApi()
            .getTasks()
            .then((TaskListResponse contents) {
          if (contents.isSuccessFull&&contents.result != null && contents.result.length > 0) {

            getPref()
                .writeModelInJson(contents, EndPoint.task, Duration(days: 7));
          } else {
            ErrorModel errorModel = contents.error;
            if ((errorModel.type == ErrorType.Internet_Connection ||
                    errorModel.type == ErrorType.Timeout)) {
              shouldLoadCache = true;
            }
          }
          return contents;
        });

        if (shouldLoadCache && loadCacheWhenNotData) {
            TaskListResponse cacheResult = await _getTaskListCache();
            if (!cacheResult.isEmpty) result = cacheResult;
        }
      }
      var completer = new Completer<TaskListResponse>();
      completer.complete(result);
      return completer.future;
    } catch (e) {
      var completer = new Completer<TaskListResponse>();
      completer.complete(TaskListResponse.withError(
          ErrorModel(e.toString(), ErrorType.Exception)));
      return completer.future;
    }
  }

  Future<TaskListResponse> _getTaskListCache() async {
    return await getPref()
        .getModelString(EndPoint.task, true)
        .then((Map<String, dynamic> postJson) {
      if (postJson.isNotEmpty) {
        return TaskListResponse.fromJson(postJson);
      } else {
        return TaskListResponse.createEmpty();
      }
    });
  }

}
