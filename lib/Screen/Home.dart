import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './product.dart';
import './productdetail.dart';
import '../provider/httpservices.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = false;
  int _currentPageIndex = 0;
  int userid;
  List carousellist = [];
  List newtrends = [];
  List maicategories = [];
  List categorieslist = [];

  // var carousellist = [
  //   {"image": "assets/images/Homepage/1.png", "name": "Necklace"},
  //   {"image": "assets/images/Homepage/1.png", "name": "Earrings"},
  //   {"image": "assets/images/Homepage/1.png", "name": "Bangles"},
  // ];

  // var categorieslist = [
  //   {"image": "assets/images/Homepage/6.png", "name": "Necklace"},
  //   {"image": "assets/images/dummybrace.jpg", "name": "Earrings"},
  //   {"image": "assets/images/dummybangles.jpeg", "name": "Bangles"},
  //   {"image": "assets/images/dummybrace.jpg", "name": "Rings"},
  // ];

  @override
  void initState() {
    super.initState();
    getUserid();
    setState(() {
      loading = true;
    });
    fetchMainCategories().then((value) => {maicategories = value.data});
    fetchBanners().then((value) => {
          setState(() {
            loading = false;
          }),
          carousellist = value.upcomingDesigns,
          newtrends = value.newTrends,
        });
  }

  getUserid() async {
    print("userid function called");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userid = preferences.getInt("id");
    print("userid" + userid.toString());
    fetchFeaturedProducts(userid).then((value) async => {
          print("featured products"),
          print(value.productlist),
          setState(() {
            categorieslist = value.productlist;
            categorieslist.map((e) => print("dsds" + e));
          }),
          value.productlist.map((e) => print("ewe" + e.name))
        });
  }

  makeCall(productid) {
    requestCallback(userid, productid).then((value) {
      if (value["status"] == "success") {
        registerToast(value["data"]["message"]);
      } else {
        registerToast("Something went wrong");
      }
    });
  }

  registerToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Color(0xFF670e1e),
        textColor: Colors.white);
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          !loading
              ? ListView(children: <Widget>[
                  Stack(children: <Widget>[
                    CarouselSlider.builder(
                        itemCount: carousellist.length,
                        itemBuilder: (BuildContext context, int itemIndex) =>
                            Container(
                                child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          carousellist[itemIndex].image_path))),
                            )),
                        options: CarouselOptions(
                          viewportFraction: 1.0,
                          // aspectRatio: 1.0,
                          height: 200,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentPageIndex = index;
                            });
                          },
                        )),
                    new Positioned(
                        left: 12,
                        bottom: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: carousellist.map((url) {
                            int index = carousellist.indexOf(url);
                            return Container(
                              width: _currentPageIndex == index ? 8.0 : 5.0,
                              height: _currentPageIndex == index ? 8.0 : 5.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 5.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xffebab40)),
                                color: _currentPageIndex == index
                                    ? Colors.transparent
                                    : Color(0xffebab40),
                              ),
                            );
                          }).toList(),
                        ))
                  ]),
                  Padding(
                      padding: EdgeInsets.only(top: 18, bottom: 4),
                      child: Text(
                        "CATEGORIES",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      )),
                  SizedBox(
                      // width: double.infinity,
                      height: 150,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: maicategories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                width: screenWidth / 3,
                                margin: EdgeInsets.only(top: 16),
                                child: Column(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProduclList(
                                                        mdata: maicategories[
                                                            index])));
                                      },
                                      child: CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Color(0xFFd7d3c8),
                                          child: Container(
                                              height: 60,
                                              width: 60,
                                              child: CachedNetworkImage(
                                                imageUrl: maicategories[index]
                                                    .imageUrl,
                                              ))
                                          // Image.network(
                                          //   maicategories[index].imageUrl,
                                          //   height: 60,
                                          //   width: 60,
                                          // ),
                                          ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(top: 8),
                                        child: Text(maicategories[index].name))
                                  ],
                                ));
                          })),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(right: 5),
                                height: 250,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/images/Homepage/4.png")))),
                          ),
                          Expanded(
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                Container(
                                    height: 100,
                                    // width: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/images/Homepage/2.png")))),
                                new SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    height: 145,
                                    //width: 300,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/images/Homepage/3.png")))),
                              ]))
                        ],
                      )),
                  GridView.builder(
                      itemCount: categorieslist.length,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 6,
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height - 200),
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                          color: Theme.of(context).primaryColor,
                          child: Column(children: <Widget>[
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductDetail(
                                        productdata: categorieslist[index])));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              categorieslist[index]
                                                  .image
                                                  .url)))),
                            )),
                            Padding(
                                padding: EdgeInsets.only(top: 12, bottom: 2),
                                child: Text(
                                  categorieslist[index].name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )),
                            ButtonTheme(
                                minWidth: 100.0,
                                height: 30.0,
                                buttonColor: Theme.of(context).primaryColor,
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(color: Colors.white)),
                                    child: Text(
                                      "REQUEST A CALLBACK",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 7),
                                    ),
                                    onPressed: () {
                                      makeCall(categorieslist[index].id);
                                    }))
                          ]),
                        );
                      }),
                  Container(
                      margin: EdgeInsets.only(
                          left: 12, right: 12, bottom: 35, top: 5),
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/images/Homepage/5.png")))),
                  Text(
                    "MBJ COFFEE BREAK",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 40),
                      color: Colors.white,
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: newtrends.length,
                          itemBuilder: (context, index) {
                            return Row(
                                textDirection: (index % 2 == 0)
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                newtrends[index].image_path))),
                                  )),
                                  Expanded(
                                      child: Container(
                                    color: Colors.white,
                                    margin: EdgeInsets.only(left: 15, top: 20),
                                    height: 150,
                                    child: Stack(
                                      overflow: Overflow.visible,
                                      children: <Widget>[
                                        Positioned(
                                          left: (index % 2 == 0) ? -30 : null,
                                          right: (index % 2 != 0) ? -30 : null,
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 3),
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              child: Text(
                                                "DEEKSHITA JAIN",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                        ),
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment: index % 2 == 0
                                                ? CrossAxisAlignment.start
                                                : CrossAxisAlignment.end,
                                            children: <Widget>[
                                              SizedBox(height: 18),
                                              Text("\u201D",
                                                  style: TextStyle(
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                              Text(
                                                "The House of MBJ Bride",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: Text(
                                                    newtrends[index].caption,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  )),
                                              RaisedButton(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 40),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                onPressed: () {
                                                  print("view more");
                                                },
                                                child: Text(
                                                  "READ MORE",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              )
                                            ])
                                      ],
                                    ),
                                  ))
                                ]);
                          }))
                ])
              : Center(
                  child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  backgroundColor: Theme.of(context).primaryColor,
                ))
        ]));
  }
}
