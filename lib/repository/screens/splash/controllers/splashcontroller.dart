import 'package:flutter/material.dart';
import 'package:mynotes_app/domain/constants/appprefs.dart';
import 'package:mynotes_app/repository/screens/home/homescreen.dart';
import 'package:mynotes_app/repository/screens/signin/signinscreen.dart';

class SplashController {
  static checklogin(BuildContext context) async {
    bool islogin = await AppPrefs().getBool();
    if (islogin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
    }
  }
}
