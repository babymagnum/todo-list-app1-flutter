import 'package:dribbble_clone/core/helper/text_util.dart';
import 'package:dribbble_clone/model/task_model.dart';
import 'package:dribbble_clone/model/task_response.dart';
import 'package:mobx/mobx.dart';

part 'home_stores.g.dart';

class HomeStores = HomeStoresBase with _$HomeStores;

abstract class HomeStoresBase with Store {

  @observable
  bool isLoading = false;

  // we use ObservableList because, it will not work for add or remove if we use regular List class
  @observable
  ObservableList<TaskModel> listTask = ObservableList<TaskModel>.of([]);

  List<TaskResponse> _listTask = [
    TaskResponse('Go jogging with Christin', '26-03-2020 07:00', 'Personal', false, false),
    TaskResponse('Meeting with client', '26-03-2020 10:00', 'Meeting', false, false),
    TaskResponse('Email client', '26-03-2020 13:00', 'Work', false, false),
    TaskResponse('Morning yoga', '27-03-2020 07:00', 'Personal', false, false),
    TaskResponse('Send project file', '27-03-2020 08:00', 'Work', false, false),
    TaskResponse('Meeting with client', '27-03-2020 10:00', 'Meeting', false, false)
  ];

  @action
  populateListTask() {
    isLoading = true;

    Future.delayed(Duration(milliseconds: 1500), () {

      for (int index=0; index<_listTask.length; index++) {
        TaskResponse item = _listTask[index];
        if (index == 0) {
          listTask.add(TaskModel('', '', '', false, false, 'Today'));
          listTask.add(TaskModel(item.title, item.date, item.type, item.isCheck, item.isNotify, ''));
        } else {
          TaskResponse itemBefore = _listTask[index - 1];

          if (TextUtil.convertDateStringToAnotherFormat(item.date, 'dd-MM-yyyy', 'dd-MM-yyyy HH:mm') !=
            TextUtil.convertDateStringToAnotherFormat(itemBefore.date, 'dd-MM-yyyy', 'dd-MM-yyyy HH:mm')) {
            listTask.add(TaskModel('', '', '', false, false, 'Tomorrow'));
          }

          listTask.add(TaskModel(item.title, item.date, item.type, item.isCheck, item.isNotify, ''));
        }
      }

      isLoading = false;
    });
  }

  @action
  changeCheck(int index, bool value) {
    TaskModel newItem = listTask[index];
    newItem.isCheck = value;
    listTask.removeAt(index);
    listTask.insert(index, newItem);
  }

  @action
  changeNotify(int index, bool value) {
    TaskModel newItem = listTask[index];
    newItem.isNotify = value;
    // here we remove the selected index from list first
    listTask.removeAt(index);
    // then reinsert the new item in selected index
    listTask.insert(index, newItem);
  }

  @action
  addTask(TaskModel taskModel) {
    listTask.add(taskModel);
  }

  @action
  removeTask(int index) {
    listTask.removeAt(index);
  }
}