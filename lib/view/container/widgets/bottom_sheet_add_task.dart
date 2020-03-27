import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/model/task_model.dart';
import 'package:dribbble_clone/model/task_type_model.dart';
import 'package:dribbble_clone/view/home/widgets/list_task_type_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../home/stores/home_stores.dart';

class BottomSheetAddTask extends StatefulWidget {

  @override
  _BottomSheetAddTaskState createState() => _BottomSheetAddTaskState();
}

class _BottomSheetAddTaskState extends State<BottomSheetAddTask> {
  var _homeStores = locator<HomeStores>();
  var _titleFocus = FocusNode();
  List<TaskTypeModel> _listType = [
    TaskTypeModel(Color(0xFFFFD506), 'Personal', false),
    TaskTypeModel(Color(0xFF1ED102), 'Work', false),
    TaskTypeModel(Color(0xFFD10263), 'Meeting', false),
    TaskTypeModel(Color(0xFFF29130), 'Shopping', false),
    TaskTypeModel(Color(0xFF9BFFF8), 'Party', false),
    TaskTypeModel(Color(0xFF3044F2), 'Study', false),
  ];

  _changeSelectedItem(selectedIndex, value) {
    for (int index=0; index<_listType.length; index++) {
      if (index == selectedIndex) _listType[index].isSelected = value;
      else _listType[index].isSelected = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset('assets/images/button_close.png', width: 53, height: 53,)
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.elliptical(size.width * 0.5, 40), topRight: Radius.elliptical(size.width * 0.5, 40))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                  child: Text('Add new task', style: ThemeTextStyle.rubikM.apply(fontSizeDelta: -3, color: Color(0xFF404040)),)
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: TextField(
                    onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                    keyboardType: TextInputType.text,
                    focusNode: _titleFocus,
                    textInputAction: TextInputAction.done,
                    style: ThemeTextStyle.rubikR.apply(fontSizeDelta: 4, color: Color(0xFF373737)),
                    decoration: InputDecoration(
                      hintText: 'Try "Workout in gym"',
                      hintStyle: ThemeTextStyle.rubikR.apply(fontSizeDelta: 4, color: Color(0xFF8E8E8E).withAlpha(90)),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 18),
                  width: double.infinity, height: 1, color: Color(0xFFCFCFCF),
                ),
                SizedBox(height: 15,),
                Container(
                  height: 27,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _listType.length,
                    itemBuilder: (_, index) => ListTaskTypeItem(
                      onSelectedItem: (value) => _changeSelectedItem(index, value),
                      isFirst: index == 0,
                      isLast: index == _listType.length - 1,
                      item: _listType[index],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 18),
                  width: double.infinity, height: 1, color: Color(0xFFCFCFCF),
                ),
                SizedBox(height: 35,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 18,),
                    Text('Choose date', style: ThemeTextStyle.rubikR.apply(fontSizeDelta: -3, color: Color(0xFF404040)),),
                    SizedBox(width: 10,),
                    Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xFF404040),)
                  ],
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Text('Today, 19:00 — 21:00', style: ThemeTextStyle.rubikM.apply(fontSizeDelta: -3, color: Color(0xFF404040)),),
                ),
                SizedBox(height: 40,),
                GestureDetector(
                  onTap: () {
                    _homeStores.addTask(TaskModel('Playing game', '27-03-2020 14:00', 'Personal', false, false, ''));
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    child: Center(
                      child: Text('Add task', style: ThemeTextStyle.rubikM.apply(fontSizeDelta: 2, color: Colors.white),),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: [BoxShadow(
                        color: Color(0xFF6894EE), offset: Offset(1, 3), blurRadius: 3
                      )],
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF7EB6FF),
                          Color(0xFF5F87E7),
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp
                      )
                    ),
                  ),
                ),
                SizedBox(height: _titleFocus.hasFocus ? MediaQuery.of(context).viewInsets.bottom + 20 : 20,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
