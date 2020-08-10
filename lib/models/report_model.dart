import 'package:flutter/material.dart';

class ReportCtrl {
  final String title;
  final IconData icon;

  ReportCtrl({this.title, this.icon});
}

List<ReportCtrl> listReportCtrl = <ReportCtrl>[
  ReportCtrl(title: "Ví của tôi", icon: Icons.account_balance_wallet),
  ReportCtrl(title: "Nhóm", icon: Icons.category),
  ReportCtrl(title: "Thông tin ứng dụng", icon: Icons.info),
];
