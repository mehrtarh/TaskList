import 'package:flutter/cupertino.dart';
import 'package:task/api/api_provider.dart';
import 'package:task/pref/pref_provider.dart';
import 'package:task/store/store_provider.dart';
import 'package:task/store/store_provider_abstarct.dart';

abstract class AppModel extends ChangeNotifier {

  ApiProviderAbstract get apiProvider;
  PrefProviderAbstract get prefProvider;
  StoreProviderAbstract get storeProvider;
}

class AppModelImplementation extends AppModel {
 late ApiProviderAbstract _apiProvider;
 late PrefProviderAbstract _prefProvider;
 late StoreProviderAbstract _storeProvider;

  AppModelImplementation() {
    _prefProvider = PrefProvider();
    _apiProvider = ApiProviderI();
    _storeProvider = StoreProvider();

  }

  @override
  ApiProviderAbstract get apiProvider => _apiProvider;

  @override
  PrefProviderAbstract get prefProvider => _prefProvider;

  @override
  StoreProviderAbstract get storeProvider => _storeProvider;



}
