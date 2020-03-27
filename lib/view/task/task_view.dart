import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/model/project_model.dart';
import 'package:dribbble_clone/view/home/widgets/header_view.dart';
import 'package:dribbble_clone/view/task/widgets/list_projects_item.dart';
import 'package:flutter/material.dart';

class TaskView extends StatefulWidget {
  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  List<ProjectModel> _listProject = [
    ProjectModel('Personal', 'ic_personal.png', 24, 0xFFFFEE9B),
    ProjectModel('Work', 'ic_work.png', 3, 0xFFB5FF9B),
    ProjectModel('Meeting', 'ic_meeting.png', 24, 0xFFFF9BCD),
    ProjectModel('Shopping', 'ic_shopping.png', 24, 0xFFFFD09B),
    ProjectModel('Party', 'ic_party.png', 24, 0xFF9BFFF8),
    ProjectModel('Study', 'ic_study.png', 24, 0xFFF59BFF),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FCFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderView(),
          Expanded(
            child: NotificationListener(
              child: GridView.builder(
                padding: EdgeInsets.only(left: 18, right: 18, bottom: 40),
                itemCount: _listProject.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.93),
                itemBuilder: (_, index) => ListProjectsItem(
                  index: index,
                  item: _listProject[index],
                )
              )
            )
          ),
        ],
      ),
    );
  }
}
