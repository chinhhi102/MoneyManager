import 'dart:async';

import 'package:money_manager/models/choice_model.dart';
import 'package:money_manager/screens/account/account_screen.dart';
import 'package:money_manager/screens/paybook/pay_book_screen.dart';
import 'package:money_manager/screens/report/report_screen.dart';
import 'package:money_manager/screens/trade/new_trade_screen.dart';
import 'package:money_manager/screens/trade/trade_screen.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    TradeScreen(),
    PayBookScreen(),
    Text(
      'Index 2: Add Trade',
      style: optionStyle,
    ),
    ReportScreen(),
    AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
//    _CateQuery = _database.reference().child("Categories").orderByChild("name");
//    _onCateAddedSubscription = _CateQuery.onChildAdded.listen(onEntryAdded);
  }

  void _onItemTapped(int index) {
    setState(() {
      if(index == 2) return;
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: choices.map<BottomNavigationBarItem>(
          (Choice choice) {
            return choice.title == "Thêm"
                ? BottomNavigationBarItem(
                    title: Text(""),
                    icon: ClipOval(
                      child: Material(
                        color: Colors.green, // button color
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewTradeScreen(),
                              ),
                            );
                          },
                          splashColor: Colors.red, // inkwell color
                          child: SizedBox(
                              width: 50, height: 50, child: Icon(Icons.add)),
                        ),
                      ),
                    ),
                    backgroundColor: Colors.green,
                  )
                : BottomNavigationBarItem(
                    title: Text(choice.title),
                    icon: Icon(
                      choice.icon,
                    ),
                    backgroundColor: Colors.blueAccent,
                  );
          },
        ).toList(),
      ),
    );
  }
}
