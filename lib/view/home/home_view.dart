import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/view/home/widgets/header_view.dart';
import 'package:dribbble_clone/view/home/widgets/list_task_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../core/theme/theme_text_style.dart';
import '../../core/widgets/placeholder_network_image.dart';
import 'stores/home_stores.dart';

class HomeView extends StatefulWidget {

  static const routeName = 'my-home-page';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  var _homeStores = locator<HomeStores>();

  @override
  void initState() {

    Future.delayed(Duration.zero, () {
      // comment below code if want to see empty task view //
      _homeStores.populateListTask();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: Color(0xFFF9FCFF),
        body: Column(
          children: <Widget>[
            HeaderView(),
            Expanded(
              child: Stack(
                children: <Widget>[
                  _homeStores.isLoading ?
                  Align(
                    child: SizedBox(
                      width: 50, height: 50,
                      child: CircularProgressIndicator(),
                    ),
                    alignment: Alignment.topCenter,
                  ) :
                  _homeStores.listTask.length == 0 ?
                  Align(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/image_no_task.png', width: size.width * 0.28, height: size.width * 0.4, fit: BoxFit.fill,),
                        SizedBox(height: 40,),
                        Text('No tasks', style: ThemeTextStyle.rubikM.apply(color: Color(0xFF554E8F), fontSizeDelta: 6),),
                        SizedBox(height: 10,),
                        Text('You have no task to do.', style: ThemeTextStyle.openSansR.apply(color: Color(0xFF82A0B7), fontSizeDelta: 1),)
                      ],
                    ),
                    alignment: Alignment.center,
                  ) :
                  NotificationListener(
                    child: ListView.builder(
                      itemCount: _homeStores.listTask.length + 1,
                      itemBuilder: (_, index) {
                        if (index == _homeStores.listTask.length) {
                          return SizedBox(height: 35);
                        } else {
                          if (_homeStores.listTask[index].header != '') {
                            return Padding(
                              padding: EdgeInsets.only(left: 18, top: index == 0 ? 0 : 18, bottom: 8.5),
                              child: Text(_homeStores.listTask[index].header, style: ThemeTextStyle.rubikM.apply(fontSizeDelta: -3, color: Color(0xFF8B87B3)),),
                            );
                          } else {
                            return Slidable(
                              closeOnScroll: false,
                              actionExtentRatio: 0.17,
                              secondaryActions: <Widget>[
                                Align(
                                  child: Parent(
                                    gesture: Gestures()..onTap(() {}),
                                    style: ParentStyle()..height(35)..width(35)..borderRadius(all: 35/2)..background.color(Color(0xFFFFCFCF))
                                      ..ripple(true)..margin(right: 33),
                                    child: Center(
                                      child: Image.asset('assets/images/ic_trash.png'),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                )
                              ],
                              child: ListTaskItem(
                                isFirst: index == 0,
                                onNotifyChanged: (value) {
                                  _homeStores.changeNotify(index, value);
                                  setState(() {});
                                },
                                onCheckChanged: (value) {
                                  _homeStores.changeCheck(index, value);
                                  setState(() {});
                                },
                                isLast: index == _homeStores.listTask.length - 1,
                                item: _homeStores.listTask[index],
                                itemBefore: index == 0 ? null : _homeStores.listTask[index - 1],
                              ),
                              actionPane: SlidableDrawerActionPane()
                            );
                          }
                        }
                      }
                    )
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}