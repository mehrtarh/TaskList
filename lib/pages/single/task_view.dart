import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:task/pages/single/task_viewmodel.dart';
import 'package:task/presentation/colors_value.dart';
import 'package:task/presentation/texts_value.dart';
import 'package:task/servermodel/model/task_model.dart';
import 'package:task/widget/check_list_widget.dart';
import 'package:task/widget/infromation_task_widget.dart';
import 'package:provider/provider.dart';

class TaskView extends StatelessWidget{

  final TaskModel taskModel;

  const TaskView({ required this.taskModel}) ;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskViewModel>(
        create: (context) {
          TaskViewModel viewModel = TaskViewModel(taskModel);
          viewModel.initialise();
          return viewModel;
        },
        child: Scaffold(
          backgroundColor: ColorsValue.backGround,
          appBar: _getAppBar(context),
          body: _getBody(),
        ));
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded,color: ColorsValue.text1,),
    onPressed: () {
    Navigator.pop(context);
    }),
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(22))),
        centerTitle: true,
        title: Text(
          TextsValue.taskInformation,
          style: TextStyle(
              color: ColorsValue.mainTitle,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ));
  }

  Widget _getBody() {
    return Padding(padding: EdgeInsets.all(16),child:

      Consumer<TaskViewModel>(builder: (context, model, child) {
      return AnimationLimiter(
          child: SingleChildScrollView(  child:
      Column(children:
          AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 500),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 100.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),


          children: [

            Padding(
            padding: EdgeInsets.only(top: 16),
      child: TaskInformationWidget(taskModel: model.taskModel,)),

        Padding(
            padding: EdgeInsets.only(top: 16),
            child:CheckListWidget(taskModel:model.taskModel,))
      ]))));
    }));
  }




}
