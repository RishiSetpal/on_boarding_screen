import 'package:flutter/material.dart';
import 'package:on_boarding_screen/screens/splash/components/body.dart';
import 'package:on_boarding_screen/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    //you have to call it on starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
