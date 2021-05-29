import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:rive/rive.dart';
import 'package:task/pages/single/task_viewmodel.dart';
import 'package:task/pages/tasklist/task_list_view.dart';
import 'package:task/presentation/colors_value.dart';
import 'package:task/presentation/texts_value.dart';
import 'package:task/servermodel/model/task_model.dart';
import 'package:task/widget/check_list_widget.dart';
import 'package:task/widget/infromation_task_widget.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => TaskListView()));
    });

    return Scaffold(
      body: Center(
          child: RiveAnimation.asset('assets/tulu.riv')),
    );
  }
}
