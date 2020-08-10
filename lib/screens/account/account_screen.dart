import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:money_manager/models/report_model.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  TextStyle _styleAccountCtrl = TextStyle(
    fontSize: 25.0,
    fontFamily: "Sans",
    fontWeight: FontWeight.normal,
    letterSpacing: 0.2,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black, size: 15.0),
        title: Text(
          "Tài khoản",
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: "Sans",
            fontWeight: FontWeight.bold,
            letterSpacing: 0.2,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: 20.0,
                        bottom: 20.0,
                        left: MediaQuery.of(context).size.width / 3),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 100.0,
                          height: 100.0,
                          margin: EdgeInsets.all(10.0),
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      "https://i.imgur.com/BoN9kdC.png"))),
                        ),
                        Text(
                          "Huy nữ tính",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: "DancingScript",
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listReportCtrl.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                left: 10.0,
                                right: 15.0,
                              ),
                              child: Icon(
                                listReportCtrl[index].icon,
                                size: 30.0,
                              ),
                            ),
                            Text(
                              listReportCtrl[index].title,
                              style: _styleAccountCtrl,
                            ),
                          ],
                        ),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                );
              },
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 10.0,
                            left: 10.0,
                            right: 15.0,
                          ),
                          child: Icon(
                            FontAwesome.sign_out,
                            size: 30.0,
                          ),
                        ),
                        Text(
                          "Đăng xuất",
                          style: _styleAccountCtrl,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
