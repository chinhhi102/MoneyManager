import 'package:money_manager/models/user_model.dart';
import 'package:money_manager/screens/authenticate/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/models/constants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:money_manager/service/auth_service.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _auth = AuthService();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username = "";
  String password = "";

  bool spw = false;

  @override
  Future<void> initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildUsernameField() {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        decorationColor: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: "Nhập tài khoản",
        fillColor: Colors.white,
        prefixIcon: Icon(
          FontAwesome.user_o,
          color: Colors.white,
          size: 15,
        ),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),
        ),
        hintStyle: TextStyle(color: Colors.white, fontFamily: 'Sans'),
        labelStyle: TextStyle(color: Colors.white, fontFamily: 'Sans'),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.white)),
      ),
      initialValue: username,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Tài khoản không được bỏ trống!';
        }
        if (value.length < 4) {
          return 'Số kí tự phải lớn hơn 4';
        }
        return null;
      },
      onSaved: (String value) {
        username = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        decorationColor: Colors.white,
      ),
      obscureText: !spw,
      decoration: InputDecoration(
        labelText: "Nhập mật khẩu",
        fillColor: Colors.white,
        prefixIcon: Icon(
          FontAwesome.key,
          color: Colors.white,
          size: 15,
        ),
        suffixIcon: spw == false
            ? IconButton(
                onPressed: () {
                  setState(() {
                    spw = true;
                  });
                },
                icon: Icon(
                  FontAwesome.eye_slash,
                  color: Colors.white,
                  size: 15,
                ),
              )
            : IconButton(
                onPressed: () {
                  setState(() {
                    spw = false;
                  });
                },
                icon: Icon(
                  FontAwesome.eye,
                  color: Colors.white,
                  size: 15,
                ),
              ),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),
        ),
        hintStyle: TextStyle(color: Colors.white, fontFamily: 'Sans'),
        labelStyle: TextStyle(color: Colors.white, fontFamily: 'Sans'),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.white)),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Mật khẩu không được bỏ trống!';
        }
        if (value.length < 6) {
          return 'Số kí tự phải lớn hơn 6';
        }
        return null;
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Future<bool> _checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog('No internet', "You're not connected to a network");
      return true;
    }
    return false;
  }

  _showDialog(title, text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_2,
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.0, 0.0, 1.0, 0.8],
                  colors: [color_5, color_4, color_3, color_2, color_1])),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Center(
                      child: Text(
                    "ĐĂNG NHẬP",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'billabong',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 10.0, bottom: 5.0),
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () async {
                      bool check = await _checkInternetConnectivity();
                      if (check) {
                        return;
                      }
                      var status = await _auth.googleSignIn();
                      if (status != null) {
                        _showDialog("Thông báo", "Đăng nhập thành công");
                      } else {
                        _showDialog("Thông báo",
                            "Đăng nhập thất bại bại, vui lòng thử lại sau!");
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesome5Brands.google_plus,
                              color: Colors.red,
                            ),
                          ),
                          Expanded(
                            child: Center(
                                child: Text(
                              "Kết nối với Google",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () async {
                      bool check = await _checkInternetConnectivity();
                      if (check) {
                        return;
                      }
                      var status = await _auth.googleSignIn();
                      if (status != null) {
                        _showDialog("Thông báo", "Đăng nhập thành công");
                      } else {
                        _showDialog("Thông báo",
                            "Đăng nhập thất bại bại, vui lòng thử lại sau!");
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesome5Brands.facebook,
                              color: Colors.blue,
                            ),
                          ),
                          Expanded(
                            child: Center(
                                child: Text(
                              "Kết nối với Facebook",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Hoặc",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 100,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                  child: _buildUsernameField(),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                  child: _buildPasswordField(),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () async {
                      bool check = await _checkInternetConnectivity();
                      if (check) {
                        return;
                      }
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      await _formKey.currentState.save();
                      var status = await _auth.signInUsernamePassword(
                          username, password);
                      if (status != null) {
                        _showDialog("Thông báo", "Đăng nhập thành công");
                      } else {
                        _showDialog("Thông báo",
                            "Đăng nhập thất bại bại, vui lòng thử lại sau!");
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          "Đăng nhập",
                          style: TextStyle(
                              color: color_5,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Bạn chưa có tài khoản? ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              "Đăng ký",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterScreen(User.empty()),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
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
