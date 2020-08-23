import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mbj/Screen/SignUp.dart';
import 'package:flutter_app_mbj/Screen/login.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
//import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: new Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage("assets/images/curve.jpg"),
                        fit: BoxFit.cover
                    ),
                  ),
                  height: 350
              ),
              Padding(
                padding: EdgeInsets.all(60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  ],
                ),
              ),
               Expanded(
                child: Container(
                  decoration: BoxDecoration(

                    image: DecorationImage(
                      image: ExactAssetImage("assets/images/background_maroon.png"),
                      fit: BoxFit.cover
                    ),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(80), topRight: Radius.circular(80))
                  ),
                  child: SingleChildScrollView(

                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 60,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10)
                                )]
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            "LUXURY DESIGNS",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 120, right: 120),
                              child: Divider(
                                color: Colors.white,
                                thickness: 3,
                              )),
                          SizedBox(
                            height: 70,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 50, right: 50),
                            child: ButtonTheme(
                                minWidth: 300.0,
                                height: 50.0,
                                buttonColor: Theme.of(context).primaryColor,
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.phone,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "Login with Phone",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => Login()));
                                    })),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 50, right: 50),
                            child: ButtonTheme(
                                height: 50.0,
                                buttonColor: Theme.of(context).primaryColor,
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.person,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Signup",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => Signup()));
                                    })),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],



            ),
          ),



        );
  }
}
