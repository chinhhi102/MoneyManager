import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/models/payBook_model.dart';
import 'package:money_manager/screens/paybook/GetDetail_Widget.dart';
import 'package:money_manager/screens/paybook/OutDetail_Widget.dart';

class PayBookScreen extends StatefulWidget {
  @override
  _PayBookScreenState createState() => _PayBookScreenState();
}

class _PayBookScreenState extends State<PayBookScreen>
    with SingleTickerProviderStateMixin {
  List<PayBook> _list1 = <PayBook>[
    PayBook(name: "Số 1", numOfTrade: 2, last: 30000, total: 50000),
    PayBook(name: "Số 2", numOfTrade: 1, last: 50000, total: 70000),
  ];
  List<PayBook> _list2 = <PayBook>[
    PayBook(name: "Số 1", numOfTrade: 2, last: 50000, total: 50000),
    PayBook(name: "Số 2", numOfTrade: 1, last: 70000, total: 70000),
  ];

  static const _tabItem = <String>[
    "Cần trả",
    "Cần thu",
  ];

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(
        initialIndex: 0, vsync: this, length: _tabItem.length);
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
        title: Text(
          "Sổ nợ",
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: "Sans",
            letterSpacing: 0.2,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.8),
          ),
        ),
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          labelColor: Colors.black,
          unselectedLabelStyle: TextStyle(
            fontSize: 15.0,
            fontFamily: "Sans",
            letterSpacing: 0.2,
            fontWeight: FontWeight.normal,
            color: Colors.black.withOpacity(0.8),
          ),
          labelStyle: TextStyle(
            fontSize: 15.0,
            fontFamily: "Sans",
            letterSpacing: 0.2,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          unselectedLabelColor: Colors.black54,
          indicatorColor: Colors.black,
          tabs: _tabItem.map<Widget>(
            (String tab) {
              return Container(
                width: MediaQuery.of(context).size.width / 3,
                child: Tab(
                  text: tab,
                ),
              );
            },
          ).toList(),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          GetDetailWidget(),
          OutDetailWidget(),
        ],
      ),
    );
  }

  void choiceAction(String choice) {
    setState(() {});
  }
}
