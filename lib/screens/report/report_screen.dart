import 'package:flutter/cupertino.dart';
import 'package:money_manager/models/tabController_model.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen>
    with SingleTickerProviderStateMixin {
  int sotien = 100;

  static const _popItem = <String>[
    "Ngày",
    "Tuần",
    "Tháng",
    "Năm",
//    "Tất cả",
//    "Tùy chỉnh"
  ];

  String selected_popItem = "Tháng";
  int selected_popIndex = 2;

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(
        initialIndex: listTabCtrl[selected_popIndex].length - 1,
        vsync: this,
        length: listTabCtrl[selected_popIndex].length);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black, size: 15.0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.attach_money,
                  size: 30.0,
                  color: Colors.yellow[900],
                ),
                SizedBox(
                  width: 5.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Tổng cộng",
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.normal,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      sotien.toString(),
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Sans",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            initialValue: selected_popItem,
            itemBuilder: (BuildContext context) {
              return _popItem.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Row(
                    children: <Widget>[
                      selected_popItem == choice
                          ? Icon(
                              Icons.check,
                              size: 15.0,
                              color: Colors.green,
                            )
                          : Icon(null),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(choice),
                    ],
                  ),
                );
              }).toList();
            },
          )
        ],
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black54,
          indicatorColor: Colors.black,
          tabs: listTabCtrl[selected_popIndex].map<Widget>(
            (TabCtrl tabCtrl) {
              return Tab(
                text: tabCtrl.title,
              );
            },
          ).toList(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 30.0,
                bottom: 30.0,
                left: 20.0,
                right: 20.0,
              ),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Số dư",
                    style: TextStyle(
                      fontFamily: "Sans",
                      letterSpacing: 0.2,
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Số dư đầu",
                              style: TextStyle(
                                fontFamily: "Sans",
                                letterSpacing: 0.2,
                                fontSize: 16.0,
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              "110,000",
                              style: TextStyle(
                                fontFamily: "Sans",
                                letterSpacing: 0.2,
                                fontSize: 18.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 4),
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Số dư cuối",
                              style: TextStyle(
                                fontFamily: "Sans",
                                letterSpacing: 0.2,
                                fontSize: 16.0,
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              "30,000",
                              style: TextStyle(
                                fontFamily: "Sans",
                                letterSpacing: 0.2,
                                fontSize: 18.0,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 30.0,
                bottom: 30.0,
                left: 20.0,
                right: 20.0,
              ),
              color: Colors.white,
              margin: EdgeInsets.only(top: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Khoản thu & khoản chi",
                    style: TextStyle(
                      fontFamily: "Sans",
                      letterSpacing: 0.2,
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Thu nhập ròng",
                          style: TextStyle(
                            fontFamily: "Sans",
                            letterSpacing: 0.2,
                            fontSize: 15.0,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          "1,675,500",
                          style: TextStyle(
                            fontFamily: "Sans",
                            letterSpacing: 0.2,
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100.0,
                    child: Text("Graph"),
                  ),
                  Container(
                    height: 100.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Sub Graph 1"),
                        Text("Sub Graph 2"),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    margin: EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 0.2,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Nợ",
                                style: TextStyle(
                                  fontFamily: "Sans",
                                  letterSpacing: 0.2,
                                  fontSize: 15.0,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                "0",
                                style: TextStyle(
                                  fontFamily: "Sans",
                                  letterSpacing: 0.2,
                                  fontSize: 18.0,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 5 * 2,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Cho vay",
                                style: TextStyle(
                                  fontFamily: "Sans",
                                  letterSpacing: 0.2,
                                  fontSize: 15.0,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                "0",
                                style: TextStyle(
                                  fontFamily: "Sans",
                                  letterSpacing: 0.2,
                                  fontSize: 18.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    margin: EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 0.2,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Khác",
                                style: TextStyle(
                                  fontFamily: "Sans",
                                  letterSpacing: 0.2,
                                  fontSize: 15.0,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                "0",
                                style: TextStyle(
                                  fontFamily: "Sans",
                                  letterSpacing: 0.2,
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void choiceAction(String choice) {
    setState(() {
      selected_popItem = choice;
      selected_popIndex = _popItem.indexOf(choice);
      _controller.index = listTabCtrl[selected_popIndex].length - 1;
    });
  }
}
