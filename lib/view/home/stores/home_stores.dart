import 'package:dribbble_clone/model/task_model.dart';
import 'package:mobx/mobx.dart';

part 'home_stores.g.dart';

class HomeStores = HomeStoresBase with _$HomeStores;

abstract class HomeStoresBase with Store {

  @observable
  bool isLoading = false;

  @observable
  List<TaskModel> listTask = List();

  @action
  populateListTask() {
    isLoading = true;

    Future.delayed(Duration(milliseconds: 1500), () {
      listTask.add(TaskModel('Go jogging with Christin', '26-03-2020 07:00', 'Personal', false, false));
      listTask.add(TaskModel('Meeting with client', '26-03-2020 10:00', 'Meeting', false, false));
      listTask.add(TaskModel('Email client', '26-03-2020 13:00', 'Work', false, false));
      listTask.add(TaskModel('Morning yoga', '27-03-2020 07:00', 'Personal', false, false));
      listTask.add(TaskModel('Send project file', '27-03-2020 08:00', 'Work', false, false));
      listTask.add(TaskModel('Meeting with client', '27-03-2020 10:00', 'Meeting', false, false));

      isLoading = false;
    });
  }

  @action
  changeCheck(int index, bool value) {
    listTask[index].isCheck = value;
  }

  @action
  changeNotify(int index, bool value) {
    listTask[index].isNotify = value;
  }
}