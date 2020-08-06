import 'package:dickheadpussyface/models/tabController_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TradeScreen extends StatefulWidget {
  @override
  _TradeScreenState createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen>
    with SingleTickerProviderStateMixin {
  int sotien = 100;
  int numOfNotify = 100;

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
            IconButton(
              onPressed: showNotify,
              icon: new Stack(
                children: <Widget>[
                  Icon(Icons.notifications),
                  numOfNotify == 0
                      ? Icon(null)
                      : Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: new Icon(Icons.brightness_1,
                              size: 8.0, color: Colors.redAccent),
                        ),
                ],
              ),
            )
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
      body: TabBarView(
        controller: _controller,
        children: listTabCtrl[selected_popIndex].map<Widget>(
          (TabCtrl tabCtrl) {
            return SingleChildScrollView(
              child: Container(
                color: Colors.blueGrey[50],
//                height: MediaQuery.of(context).size.height + 50.0,
                padding: EdgeInsets.only(bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(
                          top: 25.0, bottom: 25.0, left: 10.0, right: 10.0),
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Tiền vào",
                                style: TextStyle(
                                  fontFamily: "Sans",
                                  letterSpacing: 0.5,
                                  fontSize: 16.0,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                              Text(
                                "110,000",
                                style: TextStyle(
                                  fontFamily: "Sans",
                                  letterSpacing: 0.2,
                                  fontSize: 16.0,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Tiền ra",
                                style: TextStyle(
                                  fontFamily: "Sans",
                                  letterSpacing: 0.5,
                                  fontSize: 16.0,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                              Text(
                                "30,000",
                                style: TextStyle(
                                  fontFamily: "Sans",
                                  letterSpacing: 0.2,
                                  fontSize: 16.0,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: 30.0,
                              ),
                              Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 0.2,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: 30.0,
                              ),
                              Text(
                                "80,000",
                                style: TextStyle(
                                  fontFamily: "Sans",
                                  letterSpacing: 0.2,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: _popItem.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 5.0,
                          ),
                          margin: EdgeInsets.only(bottom: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                width: 0.5,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          child: new Column(
                            children: <Widget>[
                              ClipRRect(
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 55.0,
                                            height: 55.0,
//                                                color: Colors.green,
                                            child: ClipOval(
                                              child: Material(
                                                color: Colors.green,
                                                // button color
                                                child: InkWell(
                                                  splashColor: Colors.red,
                                                  // inkwell color
                                                  child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: Icon(Icons
                                                          .account_balance)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                width: 200.0,
                                                child: Text(
                                                  "Thu nợ",
                                                  style: TextStyle(
                                                    color: Colors.blue[900],
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(3.0),
                                                width: 200.0,
                                                child: Text(
                                                  "4 giao dịch",
                                                  style: TextStyle(
                                                    color: Colors.blue[300],
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Text("VNĐ",style: TextStyle(
                                        fontFamily: "Sans",
                                        letterSpacing: 0.2,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 3 * 2,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 0.2,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: _popItem.length,
                                itemBuilder: (BuildContext context, int index) {
//                                  return Text("Hello");
                                  return ClipRRect(
                                    child: Container(
                                      margin: EdgeInsets.all(10.0),
                                      padding: EdgeInsets.only(
                                          left: 15.0, bottom: 10.0),
//                                        color: Colors.blue,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                width: 55.0,
                                                height: 55.0,
//                                                color: Colors.green,
                                                child: Text(
                                                  "05",
                                                  style: TextStyle(
                                                    fontSize: 40.0,
                                                    fontFamily: "Sans",
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(3.0),
                                                    width: 200.0,
                                                    child: Text(
                                                      "Tháng 8 năm 2020, hôm nay",
                                                      style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(3.0),
                                                    width: 200.0,
                                                    child: Text(
                                                      "Đây là cmt, Đây là cmt, Đây là cmt, Đây là cmt, Đây là cmt, Đây là cmt, Đây là cmt",
                                                      style: TextStyle(
                                                        color: Colors
                                                            .blueGrey[100],
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                "100,000",
                                                style: TextStyle(
                                                  fontFamily: "Sans",
                                                  letterSpacing: 0.2,
                                                  fontSize: 16.0,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              SizedBox(height: 3.0,),
                                              Text("Đã trả", style: TextStyle(
                                                fontFamily: "Sans",
                                                letterSpacing: 0.2,
                                                color: Colors.blueGrey
                                              ),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ).toList(),
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

  void showNotify() {
    print("Show notify");
  }
}
