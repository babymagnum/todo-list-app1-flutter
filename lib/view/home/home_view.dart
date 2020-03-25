import 'package:division/division.dart';
import 'package:flutter/material.dart';
import '../../core/theme/theme_text_style.dart';
import '../../core/widgets/placeholder_network_image.dart';

class HomeView extends StatefulWidget {

  static const routeName = 'my-home-page';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                  top: 0, left: 0, right: 0, bottom: 0,
                  child: Container(
                    color: Colors.lightBlueAccent,
                  )
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
                      SizedBox(height: 25,),
                      Parent(
                        style: ParentStyle()..background.color(Colors.white.withOpacity(0.5))..borderRadius(all: 5)
                          ..padding(all: 3),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Spacer(),
                                Icon(Icons.close, size: 17, color: Colors.white,)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}