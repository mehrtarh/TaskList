import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task/app/app_model.dart';
import 'package:task/pages/splash/splash_view.dart';
import 'package:task/pages/tasklist/task_list_view.dart';
import 'package:task/presentation/colors_value.dart';
import 'package:task/presentation/fonts_value.dart';
import 'package:overlay_support/overlay_support.dart';



GetIt getIt = GetIt.instance;

void main() {
  runApp(MyApp());
  getIt.registerSingleton<AppModel>(AppModelImplementation(),
      signalsReady: true);
}
// =>

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    return OverlaySupport(child: MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          child: child??Container(),
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
        );
      },
      title: 'Technical Test',

      theme: ThemeData(
        fontFamily: FontsValue.fontFamily,
        primaryColor: ColorsValue.primaryColor,
      ),
      // home: MyHomePage(),
      home: SplashView(),
    ));
  }
}
