import 'package:flutter/material.dart';

class StartLoadingScreen extends StatefulWidget {
  @override
  _StartLoadingScreenState createState() => _StartLoadingScreenState();
}

class _StartLoadingScreenState extends State<StartLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/images/logo.png',
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Money Manager",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}
