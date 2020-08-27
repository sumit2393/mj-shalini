import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _date = "Date Of Birth";
  String _anniversary = "Anniversary";
  String email, name, number, dob, anniversary_date;
  bool _secureText = true;

  TextEditingController _dobController = new TextEditingController();
  TextEditingController _anniversaryController = new TextEditingController();

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  void initState() {
    super.initState();
    email = "";
    name = "";
    dob = "";
    number = "";
    anniversary_date = "";
  }

  save() async {
    Map<dynamic, dynamic> rawBody = {
      "name": name,
      "email": email,
      "dob": dob,
      "phone": number,
      "anniversary_date": anniversary_date,
    };
    final response =
        await http.post("http://portal.mbj.in/api/auth/sign-up", body: rawBody);
    var data = jsonDecode(response.body);
    print(data.toString());
    if (data["status"] == 'success') {
      String message = data['data']['message'];

//      setState(() {
//        Navigator.pop(context);
//      });
//      registerToast(message);

      showDialog(
          context: context,
          builder: (context) {
            return Container(
              height: 100,
              child: SimpleDialog(
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      "Ok",
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext ctx) => Login()));
                    },
                  )
                ],
                title: Text(message),
              ),
            );
          });
    } else {
      List<dynamic> errors = data["errors"];
      errors.forEach((element) {
        registerToast(element["errorMessage"]);
      });
    }
  }

  registerToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenheight,
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.3), BlendMode.colorBurn)),
          ),
          child: SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 130),
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.person_outline,
                      color: Color(0xFF670e1e),
                      size: 50,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))
                    ]),
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: TextField(
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    cursorColor: Colors.white,
                    autofocus: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      filled: true,
                      fillColor: Color.fromRGBO(140, 0, 0, 0.2),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    onChanged: (input) {
                      setState(() {
                        name = input;
                      });
                    },
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: TextField(
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    cursorColor: Colors.white,
                    autofocus: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      filled: true,
                      fillColor: Color.fromRGBO(140, 0, 0, 0.2),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                    onChanged: (input) {
                      setState(() {
                        email = input;
                      });
                    },
                  ),
                ),
                Container(
                  height: 70,
                  margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      filled: true,
                      fillColor: Color.fromRGBO(140, 0, 0, 0.2),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: 'Number',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                    ),
                    onChanged: (input) {
                      setState(() {
                        number = input;
                      });
                    },
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: TextField(
                    controller: _dobController,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      filled: true,
                      fillColor: Color.fromRGBO(140, 0, 0, 0.2),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: 'Date Of Birth',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      DatePicker.showDatePicker(
                        context,
                        theme: DatePickerTheme(
                          containerHeight: 250.0,
                        ),
                        showTitleActions: true,
                        minTime: DateTime(1950, 1, 1),
                        maxTime: DateTime(2050, 12, 31),
                        onConfirm: (date) {
                          print('confirm $date');
                          var date1 = date.toString();
                          var date2 = date1.split(" ");
                          print(date2);
                          setState(() {
                            dob = date2[0].toString();
                            _dobController.text = date2[0].toString();
                          });
                          _date = '${date.year} - ${date.month} - ${date.day}';
                        },
                      );
                    },
                    onChanged: (input) {
                      setState(() {
                        dob = input;
                      });
                    },
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: TextField(
                    controller: _anniversaryController,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      filled: true,
                      fillColor: Color.fromRGBO(140, 0, 0, 0.2),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: 'Date Of Anniversary',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      DatePicker.showDatePicker(
                        context,
                        theme: DatePickerTheme(
                          containerHeight: 250.0,
                        ),
                        showTitleActions: true,
                        minTime: DateTime(1950, 1, 1),
                        maxTime: DateTime(2050, 12, 31),
                        onConfirm: (date) {
                          print('confirm $date');
                          var ann_date1 = date.toString();
                          var date2 = ann_date1.split(" ");
                          print(date2);

                          _date = '${date.year} - ${date.month} - ${date.day}';
                          setState(() {
                            anniversary_date = date2[0].toString();
                            _anniversaryController.text = date2[0].toString();
                          });
                        },
                      );
                    },
                    keyboardType: null,
                    onChanged: (input) {
                      setState(() {
                        anniversary_date = input;
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50, left: 20.0, right: 0.0),
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.white)),
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () {
                        save();
                      },
                      child: const Text('Submit',
                          style: TextStyle(
                              fontSize: 20, color: Color(0xFF670e1e))),
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
