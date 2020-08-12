import 'package:flutter/material.dart';

class SelectCategoryScreen extends StatefulWidget {
  @override
  _SelectCategoryScreenState createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List<String> TabCategory = <String>[
    "ĐI VAY & CHO VAY",
    "KHOẢN CHI",
    "KHOẢN THU",
  ];

  @override
  void initState() {
    _controller = new TabController(
        initialIndex: 0, vsync: this, length: TabCategory.length);
    super.initState();
  }

  @override
  void dispose() {
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
          "Chọn nhóm",
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: "Sans",
            letterSpacing: 0.2,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.8),
          ),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          controller: _controller,
          isScrollable: true,
          labelColor: Colors.green,
          unselectedLabelStyle: TextStyle(
            fontSize: 15.0,
            fontFamily: "Sans",
            letterSpacing: 0.2,
            fontWeight: FontWeight.normal,
            color: Colors.green.withOpacity(0.8),
          ),
          labelStyle: TextStyle(
            fontSize: 15.0,
            fontFamily: "Sans",
            letterSpacing: 0.2,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.green,
          tabs: TabCategory.map<Widget>(
            (String choice) {
              return Tab(
                text: choice,
              );
            },
          ).toList(),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: TabCategory.map<Widget>(
          (String choice) {
            return Text(choice);
          },
        ).toList(),
      ),
    );
  }
}
