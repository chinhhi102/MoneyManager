import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/models/user_model.dart';
import 'package:money_manager/screens/trade/select_category_screen.dart';

class NewTradeScreen extends StatefulWidget {
  @override
  _NewTradeScreenState createState() => _NewTradeScreenState();
}

class _NewTradeScreenState extends State<NewTradeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  var dateField = TextEditingController(text: "Hôm nay");
  bool checkboxValue = true;

  var formatDay = <String>[
    "",
    "Thứ hai, ",
    "Thứ ba, ",
    "Thứ tư, ",
    "Thứ năm, ",
    "Thứ sáu, ",
    "Thứ bảy, ",
    "Chủ nhật, "
  ];

  List<User> _listUser = <User>[
    User.newUser("Chinh 1", "1", "1"),
    User.newUser("Chinh 2", "1", "1"),
    User.newUser("Chinh 3", "1", "1"),
  ];

  @override
  Future<void> initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildNumOfMoneyField() {
    return TextFormField(
      cursorColor: Colors.grey.withOpacity(0.6),
      style: TextStyle(
        color: Colors.green,
        fontSize: 30.0,
        fontFamily: "Sans",
        fontWeight: FontWeight.normal,
        letterSpacing: 0.2,
      ),
      initialValue: '0',
      decoration: InputDecoration(
        hintText: 'Nhập số tiền giao dịch',
        suffixText: " ₫",
        suffixStyle: TextStyle(
          fontSize: 30.0,
          color: Colors.green,
        ),
        icon: Container(
          margin: EdgeInsets.only(
            right: 10.0,
          ),
          child: Icon(
            FontAwesome.money,
            size: 40.0,
          ),
        ),
        fillColor: Colors.grey.withOpacity(0.6),
      ),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int _cost = int.tryParse(value);
        if (_cost == null || _cost <= 0) {
          return 'Chi phí sản phẩm không hợp lệ';
        }
        return null;
      },
      onSaved: (String value) {
        int _cost = int.tryParse(value);
        print(_cost);
      },
    );
  }

  Widget _buildChoiceCategoryField() {
    return TextFormField(
      cursorColor: Colors.grey.withOpacity(0.6),
      style: TextStyle(
        color: Colors.black,
        fontSize: 25.0,
        fontFamily: "Sans",
        fontWeight: FontWeight.bold,
        letterSpacing: 0.2,
      ),
      decoration: InputDecoration(
        hintText: 'Chọn nhóm',
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(0.6),
          fontSize: 25.0,
          fontFamily: "Sans",
          fontWeight: FontWeight.normal,
          letterSpacing: 0.2,
        ),
        icon: Container(
          margin: EdgeInsets.only(
            right: 10.0,
          ),
          child: Icon(
            FontAwesome.question_circle,
            size: 40.0,
          ),
        ),
        fillColor: Colors.grey.withOpacity(0.6),
      ),
      enabled: false,
      validator: (String value) {},
      onSaved: (String value) {},
    );
  }

  Widget _buildCommentField() {
    return TextFormField(
      cursorColor: Colors.grey.withOpacity(0.6),
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontFamily: "Sans",
        fontWeight: FontWeight.normal,
        letterSpacing: 0.2,
      ),
      decoration: InputDecoration(
        hintText: 'Thêm ghi chú',
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(0.6),
          fontSize: 20.0,
          fontFamily: "Sans",
          fontWeight: FontWeight.normal,
          letterSpacing: 0.2,
        ),
        icon: Container(
          margin: EdgeInsets.only(
            right: 10.0,
          ),
          child: Icon(
            FontAwesome.commenting,
            size: 30.0,
          ),
        ),
        fillColor: Colors.grey.withOpacity(0.6),
      ),
      validator: (String value) {},
      onSaved: (String value) {},
    );
  }

  Widget _buildDateTradeField() {
    return TextFormField(
      controller: dateField,
      cursorColor: Colors.grey.withOpacity(0.6),
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontFamily: "Sans",
        fontWeight: FontWeight.normal,
        letterSpacing: 0.2,
      ),
      decoration: InputDecoration(
        hintText: 'Ngày giao dịch',
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(0.6),
          fontSize: 20.0,
          fontFamily: "Sans",
          fontWeight: FontWeight.normal,
          letterSpacing: 0.2,
        ),
        icon: Container(
          margin: EdgeInsets.only(
            right: 10.0,
          ),
          child: Icon(
            FontAwesome.calendar,
            size: 25.0,
          ),
        ),
        fillColor: Colors.grey.withOpacity(0.6),
      ),
      enabled: false,
      validator: (String value) {},
      onSaved: (String value) {},
    );
  }

  Widget _buildWithFriend() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(
                right: 20.0,
              ),
              child: Icon(
                Icons.group,
                size: 35.0,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              height: 50.0,
              padding: EdgeInsets.only(bottom: 10.0),
              child: ListView.builder(
                itemCount: _listUser.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 5.0),
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          width: 25.0,
                          height: 25.0,
                          margin: EdgeInsets.only(right: 3.0),
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      "https://i.imgur.com/BoN9kdC.png"))),
                        ),
                        new Text(
                          "John Doe",
                          textScaleFactor: 1.5,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.0,
                            fontFamily: "Sans",
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.2,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 0.4,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _builCheckBoxConf() {
    return CheckboxListTile(
      value: checkboxValue,
      onChanged: (val) {
        setState(() {
          checkboxValue = !checkboxValue;
        });
      },
      title: new Text(
        'Chia đều tiền cho mọi người',
        style: TextStyle(
          color: Colors.black.withOpacity(0.6),
          fontSize: 20.0,
          fontFamily: "Sans",
          fontWeight: FontWeight.normal,
          letterSpacing: 0.2,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.green,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateField.text = formatDay[selectedDate.weekday] +
            DateFormat("dd/MM/yyyy").format(selectedDate).toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Thêm giao dịch"),
            InkWell(
              onTap: () {
                print("Save");
              },
              child: Text(
                "LƯU",
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Sans",
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.2,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.only(
                      left: 0, right: 0, top: 10.0, bottom: 10.0),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      _buildNumOfMoneyField(),
                      SizedBox(
                        height: 20.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectCategoryScreen()),
                          );
                        },
                        child: _buildChoiceCategoryField(),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildCommentField(),
                      SizedBox(
                        height: 20.0,
                      ),
                      InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: _buildDateTradeField(),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.only(
                      left: 0, right: 0, top: 10.0, bottom: 10.0),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            print("Chọn bạn");
                          },
                          child: _buildWithFriend()),
                      SizedBox(
                        height: 20.0,
                      ),
                      _builCheckBoxConf(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
