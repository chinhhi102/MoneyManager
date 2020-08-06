import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TabCtrl{
  final String title;
  TabCtrl({this.title});
}

List<TabCtrl> tabDay = <TabCtrl>[
  TabCtrl(title: DateFormat('dd/MM').format(DateTime.now().subtract(new Duration(days: 6))).toString()),
  TabCtrl(title: DateFormat('dd/MM').format(DateTime.now().subtract(new Duration(days: 5))).toString()),
  TabCtrl(title: DateFormat('dd/MM').format(DateTime.now().subtract(new Duration(days: 4))).toString()),
  TabCtrl(title: DateFormat('dd/MM').format(DateTime.now().subtract(new Duration(days: 3))).toString()),
  TabCtrl(title: DateFormat('dd/MM').format(DateTime.now().subtract(new Duration(days: 2))).toString()),
  TabCtrl(title: "Hôm qua"),
  TabCtrl(title: "Hôm nay"),
];

List<TabCtrl> tabWeek = <TabCtrl>[
  TabCtrl(title: DateFormat('dd/MM').format(DateTime.now().subtract(new Duration(days: 7 * 6)).subtract(new Duration(days: DateTime.now().weekday))).toString() + " – " + DateFormat('dd/MM').format(DateTime.now().subtract(new Duration(days: 7 * 6)).subtract(new Duration(days: DateTime.now().weekday)).add(new Duration(days: 6))).toString()),
  TabCtrl(title: DateFormat('dd/MM').format(DateTime.now().subtract(new Duration(days: 7 * 5)).subtract(new Duration(days: DateTime.now().weekday))).toString() + " – " + DateFormat('dd/MM').format(DateTime.now().subtract(new Duration(days: 7 * 5)).subtract(new Duration(days: DateTime.now().weekday)).add(new Duration(days: 6))).toString()),
  TabCtrl(title: DateFormat('dd/MM').format(DateTime.now().subtract(new Duration(days: 7 * 4)).subtract(new Duration(days: DateTime.now().weekday))).toString() + " – " + DateFormat('dd/MM').format(DateTime.now().subtract(new Duration(days: 7 * 4)).subtract(new Duration(days: DateTime.now().weekday)).add(new Duration(days: 6))).toString()),
  TabCtrl(title: DateFormat('dd/MM').format(DateTime.now().subtract(new Duration(days: 7 * 3)).subtract(new Duration(days: DateTime.now().weekday))).toString() + " – " + DateFormat('dd/MM').format(DateTime.now().subtract(new Duration(days: 7 * 3)).subtract(new Duration(days: DateTime.now().weekday)).add(new Duration(days: 6))).toString()),
  TabCtrl(title: DateFormat('dd/MM').format(DateTime.now().subtract(new Duration(days: 7 * 2)).subtract(new Duration(days: DateTime.now().weekday))).toString() + " – " + DateFormat('dd/MM').format(DateTime.now().subtract(new Duration(days: 7 * 2)).subtract(new Duration(days: DateTime.now().weekday)).add(new Duration(days: 6))).toString()),
  TabCtrl(title: "Tuần trước"),
  TabCtrl(title: "Tuần này"),
];

List<TabCtrl> tabMonth = <TabCtrl>[
  TabCtrl(title: "Tháng " + ((DateTime.now().month - 6 + 12) % 12 == 0 ? 12 : (DateTime.now().month - 6 + 12) % 12).toString()),
  TabCtrl(title: "Tháng " + ((DateTime.now().month - 5 + 12) % 12 == 0 ? 12 : (DateTime.now().month - 5 + 12) % 12).toString()),
  TabCtrl(title: "Tháng " + ((DateTime.now().month - 4 + 12) % 12 == 0 ? 12 : (DateTime.now().month - 4 + 12) % 12).toString()),
  TabCtrl(title: "Tháng " + ((DateTime.now().month - 3 + 12) % 12 == 0 ? 12 : (DateTime.now().month - 3 + 12) % 12).toString()),
  TabCtrl(title: "Tháng " + ((DateTime.now().month - 2 + 12) % 12 == 0 ? 12 : (DateTime.now().month - 2 + 12) % 12).toString()),
  TabCtrl(title: "Tháng trước"),
  TabCtrl(title: "Tháng này"),
];

List<TabCtrl> tabYear = <TabCtrl>[
  TabCtrl(title: "Năm " + (DateTime.now().year - 6).toString()),
  TabCtrl(title: "Năm " + (DateTime.now().year - 5).toString()),
  TabCtrl(title: "Năm " + (DateTime.now().year - 4).toString()),
  TabCtrl(title: "Năm " + (DateTime.now().year - 3).toString()),
  TabCtrl(title: "Năm " + (DateTime.now().year - 2).toString()),
  TabCtrl(title: "Năm trước"),
  TabCtrl(title: "Năm này"),
];

//List<TabCtrl> tabTatCa = <TabCtrl>[
//  TabCtrl(title: "Tất cả giao dịch"),
//];
//
//List<TabCtrl> tabTuyChon = <TabCtrl>[
//  TabCtrl(title: "Tùy chọn"),
//];

List<List<TabCtrl>> listTabCtrl = <List<TabCtrl>>[
  tabDay,
  tabWeek,
  tabMonth,
  tabYear,
//  tabTatCa,
//  tabTuyChon
];