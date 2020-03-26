import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/view/home/widgets/list_task_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
            Stack(
              children: <Widget>[
                Positioned(
                  top: 0, left: 0, right: 0, bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/background_toolbar_no_task.png')
                      )
                    ),
                  )
                ),
                Positioned(
                  left: -85, top: -85,
                  child: Image.asset('assets/images/big_ellipse.png')
                ),
                Positioned(
                  right: -15, top: -15,
                  child: Image.asset('assets/images/small_ellipse.png')
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).padding.top + 20,),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Hello Brendal', style: ThemeTextStyle.ubuntuR.apply(color: Colors.white),),
                                SizedBox(height: 3,),
                                Text('Today you have 9 tasks', style: ThemeTextStyle.ubuntuR.apply(color: Colors.white, fontSizeDelta: -4),)
                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          PlaceholderNetworkImage(
                            url: 'https://upload.wikimedia.org/wikipedia/commons/b/bf/Jessica_on_the_CLEO_Thailand_magazine_%28cropped%29.png',
                            size: Size(40, 40),
                            borderRadius: 40/2,
                          )
                        ],
                      ),
                      SizedBox(height: _homeStores.listTask.length == 0 ? 11 : 25,),
                      _homeStores.listTask.length == 0 ?
                      Container() :
                      Parent(
                        style: ParentStyle()..background.color(Colors.white.withOpacity(0.31))..borderRadius(all: 5)
                          ..padding(all: 3),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Spacer(),
                                Icon(Icons.close, size: 17, color: Colors.white,)
                              ],
                            ),
                            SizedBox(height: 2.4,),
                            Padding(
                              padding: EdgeInsets.only(left: 13, right: 17),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Today Reminder', style: ThemeTextStyle.rubikM.apply(fontSizeDelta: 4, color: Colors.white),),
                                        SizedBox(height: 4,),
                                        Text('Meeting with client', style: ThemeTextStyle.openSansR.apply(fontSizeDelta: -5, color: Color(0xFFF3F3F3)),),
                                        SizedBox(height: 4,),
                                        Text('13:00 PM', style: ThemeTextStyle.openSansR.apply(fontSizeDelta: -5, color: Color(0xFFF3F3F3)),),
                                      ],
                                    )
                                  ),
                                  SizedBox(width: 10,),
                                  Transform.rotate(
                                    angle: 0,
                                    child: Image.asset('assets/images/bell.png', width: 52, height: 66,),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 8,)
                          ],
                        ),
                      ),
                      SizedBox(height: _homeStores.listTask.length == 0 ? 0 : 13,)
                    ],
                  ),
                )
              ],
            ),
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
                      itemCount: _homeStores.listTask.length,
                      itemBuilder: (_, index) => ListTaskItem(
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
                      )
                    )
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}