import 'package:flutter/material.dart';
import 'package:money_manager/models/payBook_model.dart';

class GetDetailWidget extends StatelessWidget {
  List<PayBook> _list1 = <PayBook>[
    PayBook(name: "Số 1", numOfTrade: 2, last: 30000, total: 50000),
    PayBook(name: "Số 2", numOfTrade: 1, last: 50000, total: 70000),
  ];
  List<PayBook> _list2 = <PayBook>[
    PayBook(name: "Số 1", numOfTrade: 2, last: 50000, total: 50000),
    PayBook(name: "Số 2", numOfTrade: 1, last: 70000, total: 70000),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(
            5.0,
          ),
          child: Column(
            children: <Widget>[
              Container(
//                      color: Colors.blue,
                padding: EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                ),
                alignment: Alignment(0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "CHƯA ĐƯỢC TRẢ ",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: "Sans",
                        letterSpacing: 0.2,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "50,000",
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Sans",
                          letterSpacing: 0.2,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: _list1.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.white,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new NetworkImage(
                                              "https://i.imgur.com/BoN9kdC.png"))),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      _list1[index].name,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: "Sans",
                                        letterSpacing: 0.2,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${_list1[index].numOfTrade.toString()} giao dịch",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: "Sans",
                                        letterSpacing: 0.2,
                                        color: Colors.black.withOpacity(0.6),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "còn ${_list1[index].last}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: "Sans",
                                    letterSpacing: 0.2,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  "trong tổng số ${_list1[index].total}",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: "Sans",
                                    letterSpacing: 0.2,
                                    color: Colors.black.withOpacity(0.6),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(
            5.0,
          ),
          child: Column(
            children: <Widget>[
              Container(
//                      color: Colors.blue,
                padding: EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                ),
                alignment: Alignment(0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "ĐÃ TRẢ ",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: "Sans",
                        letterSpacing: 0.2,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "120,000",
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Sans",
                          letterSpacing: 0.2,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: _list2.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.white,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new NetworkImage(
                                              "https://i.imgur.com/BoN9kdC.png"))),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      _list2[index].name,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: "Sans",
                                        letterSpacing: 0.2,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${_list2[index].numOfTrade.toString()} giao dịch",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: "Sans",
                                        letterSpacing: 0.2,
                                        color: Colors.black.withOpacity(0.6),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "${_list2[index].total.toString()}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: "Sans",
                                    letterSpacing: 0.2,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Text(
                                  "đã trả hết",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: "Sans",
                                    letterSpacing: 0.2,
                                    color: Colors.black.withOpacity(0.6),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
