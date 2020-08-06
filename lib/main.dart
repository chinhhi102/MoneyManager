import 'package:dickheadpussyface/screens/wrapper.dart';
import 'package:dickheadpussyface/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Manager',
      debugShowCheckedModeBanner: false,
      home: StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          home: Wrapper(),
        ),
      ),
    );
  }
}
