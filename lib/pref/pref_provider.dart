import 'dart:async';
import 'dart:convert';

import 'package:task/store/base_store_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PrefProviderAbstract {

  Future<bool> writeModelInJson(dynamic body, String url, Duration duration) ;

  Future<Map<String,dynamic>> getModelString(String url,bool removeModelByTime) ;
}

class PrefProvider implements PrefProviderAbstract {


  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  PrefProvider();


  Future<bool> writeModelInJson(dynamic body, String url, Duration duration) async {
    SharedPreferences pref = await _prefs;
    if (duration == null)
      return false;
    else {
      BaseStoreModel local = BaseStoreModel(model: body, time: DateTime.now().add(duration));
      final json = jsonEncode(local.toJson());
      if (body != null && json.isNotEmpty) {
        return await pref.setString(url, json);
      }
      return false;
    }
  }

  Future<Map<String,dynamic>> getModelString(String url,bool removeModelByTime) async {

    SharedPreferences pref = await _prefs;
    final jsonString = pref.getString(url);
    if (jsonString != null) {
      final jsonModel = jsonDecode(jsonString);
      final model = BaseStoreModel.fromJson(jsonModel);
      if(removeModelByTime) {
        if (DateTime.now().isBefore(model.time))
          return BaseStoreModel
              .fromJson(jsonModel)
              .model;
      }else
        return BaseStoreModel
            .fromJson(jsonModel)
            .model;
    }
    return Map();
  }
}
