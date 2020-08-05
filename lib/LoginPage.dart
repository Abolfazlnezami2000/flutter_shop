import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'LoginResponselModel.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usernameController = TextEditingController();
  var passworldController = TextEditingController();
  var passworld;
  var username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ورود",
            style: TextStyle(
                fontFamily: "Vazir", fontSize: 20, color: Colors.black45)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: Builder(
        builder: (context) => ListView(
          children: <Widget>[
            Align(
              child: Image.network(
                  "https://img.icons8.com/bubbles/2x/shop--v2.png"),
              alignment: Alignment.center,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 70, right: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            hintText: "نام کاربری",
                            icon: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Icon(
                                Icons.perm_identity,
                                color: Colors.grey[500],
                              ),
                            )),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Vazir",
                          fontSize: 20,
                        ),
                        controller: username,
                      ),
                      elevation: 20,
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: Colors.grey[200],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            hintText: "رمز عبور",
                            icon: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.grey[500],
                              ),
                            )),
                        obscureText: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Vazir",
                          fontSize: 20,
                        ),
                        controller: passworld,
                      ),
                      elevation: 20,
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: Colors.grey[200],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: Material(
                        elevation: 20,
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.red[900],
                        child: InkWell(
                          onTap: () {
//                            sendLoginRequest(
//                                username: usernameController.text,
//                                password: passworldController.text,
//                                context: context);
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => Store()));
//                            if (username.toString()=="1234") {
//                              Navigator.of(context).pushReplacement(MaterialPageRoute(
//                                  builder: (context) => Store()));
//                              showMySnackBar(context, "Login is successful");
//                            } else {
//                              showMySnackBar(context, "Error");
//                            }
                          },
                          child: Container(
                            height: 80,
                            child: Center(
                              child: Text(
                                "ورود",
                                style: TextStyle(
                                    fontFamily: "Vazir",
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//  Widget LoginUI() {
//    return Stack(
//    );
//  }
  void sendLoginRequest(
      {@required String username,
      @required String password,
      @required BuildContext context}) async {
    var url = "http://welearnacademy.ir/flutter/api/?type=login";
    var body = Map<String, dynamic>();
    body['username'] = username;
    body['passworld'] = password;
    Response response = await post(url, body: body);
    if (response.statusCode == 200) {
      //login good
      var loginJson = json.decode(utf8.decode(response.bodyBytes));
      var model =
          LoginResponselModel(loginJson['result'], loginJson['message']);
      if (model.result == "0") {
        showMySnackBar(context, model.message);
      } else if (model.result == "1") {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 300),
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> seconAnimation) {
                return Store();
              },
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> seconAnimation,
                  Widget child) {
                return ScaleTransition(
                  child: child,
                  scale: Tween<double>(begin: 0, end: 1).animate(
                      CurvedAnimation(
                          parent: animation, curve: Curves.fastOutSlowIn)),
                );
              }),
        );
      }
      showMySnackBar(context, model.message);
    } else {
      //error
      showMySnackBar(context, "Error");
    }
  }

  void showMySnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(fontFamily: "Vazir", fontSize: 15),
      ),
    ));
  }
}
