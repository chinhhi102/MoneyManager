import 'package:flutter/material.dart';

class Choice{
  final String title;
  final IconData icon;
  final String imageUrl;
  final String subtitle;
  const Choice({this.title, this.icon, this.imageUrl, this.subtitle});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Sổ giao dịch', icon: Icons.content_paste, imageUrl: 'assets/images/home.png', subtitle: 'Trang chủ ứng dụng'),
  Choice(title: 'Sổ nợ', icon: Icons.account_balance_wallet, imageUrl: 'assets/images/payment.png', subtitle: 'Thông tin các loại sản phẩm'),
  Choice(title: 'Thêm', icon: Icons.add, imageUrl: 'assets/images/payment.png', subtitle: 'Thông tin các loại sản phẩm'),
  Choice(title: 'Báo cáo', icon: Icons.pie_chart, imageUrl: 'assets/images/report.png', subtitle: 'Thông tin hàng còn lại trong kho'),
  Choice(title: 'Tài khoản', icon: Icons.person, imageUrl: 'assets/images/report.png', subtitle: 'Thống kê báo cáo danh mục sản phẩm'),
];