import 'package:flutter/material.dart';

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
      body: Center(
        child: Text('Home View'),
      ),
    );
  }
}