class TaskModel {

  TaskModel(this.title, this.date, this.type, this.isCheck, this.isNotify, this.header);

  String date;
  String title;
  bool isCheck;
  bool isNotify;
  String type;
  String header;
}