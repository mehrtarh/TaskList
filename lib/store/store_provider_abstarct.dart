import 'dart:async';

import 'package:task/api/api_provider.dart';
import 'package:task/pref/pref_provider.dart';
import 'package:task/servermodel/response/task_list_response.dart';

abstract class StoreProviderAbstract {
  ApiProviderAbstract getApi();

  PrefProviderAbstract getPref();

  Future<TaskListResponse> getTasks({bool loadFromCache = false, bool loadCacheWhenNotData = true});


}
