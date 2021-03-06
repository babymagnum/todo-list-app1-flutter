import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/view/home/home_view.dart';
import 'package:dribbble_clone/view/container/widgets/bottom_sheet_add_task.dart';
import 'package:dribbble_clone/view/task/task_view.dart';
import 'package:flutter/material.dart';
import '../home/stores/home_stores.dart';

class ContainerView extends StatefulWidget {

  static const routeName = 'container-view';

  @override
  _ContainerViewState createState() => _ContainerViewState();
}

class _ContainerViewState extends State<ContainerView> {

  var _selectedIndex = 0;
  List<Widget> _listScreen = [HomeView(), TaskView()];

  _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  _openBottomSheetAddTask() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Color(0xFF212020).withOpacity(0.24),
      backgroundColor: Colors.transparent,
      builder: (context) => BottomSheetAddTask()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0, top: 0, right: 0, bottom: 59,
            child: IndexedStack(
              index: _selectedIndex,
              children: _listScreen,
            ),
          ),
          Positioned(
            left: 0, bottom: 0, right: 0,
            child: Container(
              padding: EdgeInsets.only(bottom: 9, top: 9),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _onItemTapped(0),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/ic_home.png', width: 23, height: 23, color: Color(_selectedIndex == 0 ? 0xFF5F87E7 : 0xFFBEBEBE),),
                          SizedBox(height: 6,),
                          Text('Home', style: ThemeTextStyle.rubikM.apply(
                            color: _selectedIndex == 0 ? Color(0xFF5F87E7) : Color(0xFF9F9F9F), fontSizeDelta: -6
                          ),)
                        ],
                      ),
                    )
                  ),
                  Expanded(
                    child: Container()
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _onItemTapped(1),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/ic_task.png', width: 23, height: 23, color: Color(_selectedIndex == 1 ? 0xFF5F87E7 : 0xFFBEBEBE)),
                          SizedBox(height: 6,),
                          Text('Task', style: ThemeTextStyle.rubikM.apply(
                            color: _selectedIndex == 1 ? Color(0xFF5F87E7) : Color(0xFF9F9F9F), fontSizeDelta: -6
                          ),)
                        ],
                      ),
                    )
                  )
                ],
              ),
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () => _openBottomSheetAddTask(),
              child: Padding(
                padding: EdgeInsets.only(bottom: 13),
                child: Image.asset('assets/images/button_add.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
