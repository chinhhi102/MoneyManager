import 'package:connectivity/connectivity.dart';
import 'package:dickheadpussyface/models/constants.dart';
import 'package:dickheadpussyface/models/user_model.dart';
import 'package:dickheadpussyface/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RegisterScreen extends StatefulWidget {
  User _user;

  RegisterScreen(this._user);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _pass = TextEditingController(text: "");

  bool spw = false, srpw = false;

  @override
  Future<void> initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
      initialValue: "",
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
        widget._user.username = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _pass,
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
        widget._user.password = value;
      },
    );
  }

  Widget _buildRepeatPasswordField() {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        decorationColor: Colors.white,
      ),
      obscureText: !srpw,
      decoration: InputDecoration(
        labelText: "Nhập lại mật khẩu",
        fillColor: Colors.white,
        prefixIcon: Icon(
          FontAwesome.keyboard_o,
          color: Colors.white,
          size: 15,
        ),
        suffixIcon: srpw == false
            ? IconButton(
                onPressed: () {
                  setState(() {
                    srpw = true;
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
                    srpw = false;
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
      initialValue: "",
      validator: (String value) {
        if (value.isEmpty) {
          return 'Nhập lại mật khẩu không được bỏ trống!';
        }
        if (value != _pass.text) {
          return 'Mật khẩu không trùng';
        }
        return null;
      },
    );
  }

  Widget _buildFullnameField() {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        decorationColor: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: "Nhập tên người sử dụng",
        fillColor: Colors.white,
        prefixIcon: Icon(
          FontAwesome.bomb,
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
      initialValue: "",
      validator: (String value) {
        if (value.isEmpty) {
          return 'Tên người sử dụng không được bỏ trống!';
        }
        if (value.length < 4) {
          return 'Số kí tự phải lớn hơn 4';
        }
        return null;
      },
      onSaved: (String value) {
        widget._user.fullName = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.0, 0.0, 1.0, 0.8],
                  colors: [color_1, color_2, color_3, color_4, color_5])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                    child: Text(
                  "ĐĂNG KÝ",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'billabong',
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, left: 20.0, right: 20.0),
                child: Container(
                  height: 70,
                  child: _buildUsernameField(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, left: 20.0, right: 20.0),
                child: Container(
                  height: 70,
                  child: _buildPasswordField(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, left: 20.0, right: 20.0),
                child: Container(
                  height: 70,
                  child: _buildRepeatPasswordField(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, left: 20.0, right: 20.0),
                child: Container(
                  height: 70,
                  child: _buildFullnameField(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                    var status = await _auth.registerWithEmailAndPassword(
                        widget._user.username,
                        widget._user.password,
                        widget._user.fullName);
                    if (status == null) {
                      _showDialog("Lỗi", "Đăng kí thất bại");
                    } else {
                      Navigator.pop(context);
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
                        "Đăng ký",
                        style: TextStyle(
                            color: color_4,
                            fontSize: 15,
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
                          "Đã có tài khoản? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            "Đăng nhập",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
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
    );
  }
}
