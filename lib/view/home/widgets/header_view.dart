import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:flutter/material.dart';
import '../stores/home_stores.dart';

class HeaderView extends StatelessWidget {

  var _homeStores = locator<HomeStores>();

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
