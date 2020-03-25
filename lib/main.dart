import 'package:dribbble_clone/core/helper/constant.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/helper/router.dart';
import 'package:dribbble_clone/view/container/container_view.dart';
import 'package:dribbble_clone/view/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

final globalNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {

  // Don't forget to change BASE_API to Constant.API_PRODUCTION when building apk / when testing live server //
  static const BASE_API = Constant.API_PRODUCTION;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  SharedPreferences _preferences;

  @override
  void initState() {

    _initPreference();

    super.initState();
  }

  _initPreference() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // this code to make apps to only allows portrait mode //
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    bool isFirstTimeOpen = _preferences?.getBool(Constant.FIRST_TIME_OPEN) ?? false;

    return MaterialApp(
      title: 'Todo List App',
      navigatorKey: globalNavigatorKey,
      initialRoute: isFirstTimeOpen ? ContainerView.routeName : OnboardingView.routeName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
