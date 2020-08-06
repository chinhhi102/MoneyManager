import 'dart:async';

import 'package:dickheadpussyface/anim/StartLoadingPage.dart';
import 'package:dickheadpussyface/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate_screen.dart';
import 'home/homepage_screen.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WrapperScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return StartLoadingScreen();
  }
}


class WrapperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final user = Provider.of<User>(context);
    print(user);
    // return either Home or Authenticate widget
    if(user == null) {
      return AuthenticateScreen();
    } else {
      return HomePageScreen();
    }
  }
}
