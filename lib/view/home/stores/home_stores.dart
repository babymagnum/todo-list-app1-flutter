import 'package:dribbble_clone/model/task_model.dart';
import 'package:mobx/mobx.dart';

part 'home_stores.g.dart';

class HomeStores = HomeStoresBase with _$HomeStores;

abstract class HomeStoresBase with Store {

  @observable
  List<TaskModel> listTask = List();



}