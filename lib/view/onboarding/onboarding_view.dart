import 'package:dribbble_clone/core/helper/constant.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/view/container/container_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingView extends StatefulWidget {

  static const routeName = 'onboarding-view';

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {

  @override
  void initState() {

    SharedPreferences.getInstance().then((preference) {
      final bool isFirstTime = preference.getBool(Constant.FIRST_TIME_OPEN) ?? false;

      if (isFirstTime) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ContainerView()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Image.asset('assets/images/onboarding_image.png', width: size.width * 0.6, height: size.width * 0.65,)
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: Text('Reminders made simple', style: ThemeTextStyle.rubikM.apply(fontSizeDelta: 6, color: Color(0xFF554E8F))),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque erat in blandit luctus.',
              style: ThemeTextStyle.openSansR.apply(color: Color(0xFF82A0B7), fontSizeDelta: 1),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 25,),
          GestureDetector(
            onTap: () {
              SharedPreferences.getInstance().then((preference) => preference.setBool(Constant.FIRST_TIME_OPEN, true));
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ContainerView()));
            },
            child: Image.asset('assets/images/get_started_button.png', width: size.width * 0.85,)
          )
        ],
      ),
    );
  }
}
