import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:task/pages/single/task_view.dart';
import 'package:task/pages/tasklist/task_list_viewmodel.dart';
import 'package:task/presentation/colors_value.dart';
import 'package:task/presentation/texts_value.dart';
import 'package:task/servermodel/model/task_model.dart';
import 'package:task/widget/loading_widget.dart';
import 'package:task/widget/no_data_widget.dart';
import 'package:task/widget/small_task_widget.dart';

class TaskListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskListViewModel>(
        create: (context) {
          TaskListViewModel viewModel = TaskListViewModel();
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
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(22))),
        centerTitle: true,
        title: Text(
          TextsValue.taskListTitle,
          style: TextStyle(
              color: ColorsValue.mainTitle,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ));
  }

  Widget _getBody() {
    return Consumer<TaskListViewModel>(builder: (context, model, child) {
      return Stack(children: [
        NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!model.finalPage &&
                  !model.loadingContents &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                model.getContents();
              }
              return false;
            },
            child: Container(
                child: Stack(alignment: Alignment.topCenter, children: [
              (model.contents.length > 0
                  ? ListView.builder(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: model.contents.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _getTaskIItem(
                            context, model.contents[index], model, index);
                      })
                  : model.loadingContents
                      ? Container()
                      : NoDataWidget()),
              model.loadingContents ? LoadingWidget() : Container()
            ])))
      ]);
    });
  }

  Widget _getTaskIItem(BuildContext context, TaskModel model,
      TaskListViewModel homeViewModel, int index) {
    return AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
            horizontalOffset: 200.0,
            child: FadeInAnimation(
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(_createRoute(model));
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => TaskView(
                      //               taskModel: model,
                      //             )));
                    },
                    child: Padding(
                        padding: EdgeInsets.only(top: 16),
                        child:  SmallTaskWidget(
                              taskModel: model,
                            ))))));
  }

  Route _createRoute(TaskModel model) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => TaskView(
        taskModel: model,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
