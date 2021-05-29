
import 'package:flutter/material.dart';
import 'package:task/api/api_provider.dart';
import 'package:task/app/app_model.dart';
import 'package:task/pref/pref_provider.dart';
import 'package:task/store/store_provider_abstarct.dart';

import '../main.dart';

abstract class JobBaseViewModel extends ChangeNotifier {
  String title = 'default';

  ApiProviderAbstract getApi() {
    return getIt<AppModel>().apiProvider;
  }

  PrefProviderAbstract getPref() {
    return getIt<AppModel>().prefProvider;
  }

  StoreProviderAbstract getStore() {
    return getIt<AppModel>().storeProvider;
  }
  void initialise();


}
