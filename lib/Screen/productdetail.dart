import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../provider/httpservices.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class ProductDetail extends StatefulWidget {
  final productdata;
  ProductDetail({this.productdata});
  ProductDetailState createState() => ProductDetailState();
}

class ProductDetailState extends State<ProductDetail> {
  final scaffoldState = GlobalKey<ScaffoldState>();
  int userid;

  @override
  void initState() {
    super.initState();

    getUserid();
  }

  getUserid() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userid = preferences.getInt("id");
  }

  requestCall() {
    // requestCallback(widget.productdata.id, userid).then((value) => {
    //       if (value["status"] == "success")
    //         {registerToast(value["data"]["message"])}
    //       else
    //         {registerToast("Something went wrong")}
    //     });
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 20),
            child: Stack(overflow: Overflow.visible, children: [
              Container(
                height: 360,
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 90, bottom: 20),
                      child: const Text("Information",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ),
                    const Text("We will connect you in next 24hours",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 35),
                      color: Colors.white,
                      height: 1.5,
                      width: 40.0,
                    ),
                    Contactbutton(label: "CALL NOW"),
                    SizedBox(height: 12),
                    Contactbutton(label: "CHAT WITH WHATSAPP"),
                  ],
                ),
              ),
              Positioned(
                top: -30,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  height: 60,
                  width: 60,
                  child: Icon(Icons.info_outline),
                ),
              ),
            ]),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)));
  }

  addToWishlist(productid, isadded) {
    if (!isadded) {
      addWish(userid, productid).then((value) => {
            print(value),
            if (value["status"] == "success")
              {
                registerToast(value["data"]["message"]),
                setState(() {
                  widget.productdata.addedToWishList = true;
                })
              }
            else
              {registerToast("Something went wrong Please try again")}
          });
    } else {
      print("in else part");
      removeWish(userid.toString(), productid.toString()).then((value) => {
            print(value),
            if (value["status"] == "success")
              {
                setState(() {
                  registerToast(value["data"]["message"]);
                  setState(() {
                    widget.productdata.addedToWishList = false;
                  });
                })
              }
            else
              {registerToast("Something went wrong")}
          });
    }
  }

  registerToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Color(0xFF670e1e),
        textColor: Colors.white);
  }

  zoomImage(data) {
    scaffoldState.currentState.showBottomSheet(
      (BuildContext context) {
        return Center(
            child: Container(
                height: 400,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: PhotoView(
                  backgroundDecoration:
                      BoxDecoration(color: Colors.transparent),
                  imageProvider: CachedNetworkImageProvider(data),
                )));
      },
      backgroundColor: Colors.grey[200],
    );
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldState,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Image.asset(
                  "assets/images/home/Bell_Icon.png",
                  height: 16,
                  width: 16,
                ))
          ],
        ),
      ),
      backgroundColor: Colors.grey[50],
      body: Stack(children: <Widget>[
        ListView(
          padding: EdgeInsets.only(bottom: 60),
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 350,
              child: Stack(children: <Widget>[
                Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.white,
                    child: Padding(
                        padding: EdgeInsets.only(
                            bottom: 70, left: 60, right: 60, top: 20),
                        child: GestureDetector(
                          onTap: () {
                            zoomImage(widget.productdata.image.url);
                          },
                          child: CachedNetworkImage(
                            imageUrl: widget.productdata.image.url,
                          ),
                        ))),
                new Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                        height: 120,
                        margin: EdgeInsets.symmetric(horizontal: 0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.productdata.thumbnails.length,
                            itemBuilder: (context, index) {
                              return jewellerybox(
                                  zoomImage,
                                  widget.productdata.thumbnails[index].url,
                                  screenWidth);
                            }))),
                Positioned(
                    top: 16,
                    right: 16,
                    child: GestureDetector(
                      onTap: () {
                        addToWishlist(widget.productdata.id,
                            widget.productdata.addedToWishList);
                      },
                      child: Icon(Icons.favorite,
                          size: 16,
                          color: widget.productdata.addedToWishList
                              ? Colors.red
                              : Colors.grey[500]),
                    ))
              ]),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 35),
                child: Text(
                  widget.productdata.name.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text("\u20B9" + widget.productdata.price.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Text("\u20B9" + widget.productdata.tagPrice.toString(),
                    style: TextStyle(color: Colors.grey[400], fontSize: 12)),
              ]),
              SizedBox(
                width: 20,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Final price plus",
                    style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                SizedBox(
                  height: 8,
                ),
                Text("",
                    style: TextStyle(color: Colors.grey[400], fontSize: 12)),
              ]),
            ]),
            Container(
                margin: EdgeInsets.only(top: 35, bottom: 14),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(children: [
                        Text(
                          "COLLECTION",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "",
                          style: TextStyle(fontSize: 8, color: Colors.black),
                        )
                      ]),
                      Column(children: [
                        Text(
                          "DESIGN CODE",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(widget.productdata.designCode.toString(),
                            style: TextStyle(fontSize: 8, color: Colors.black))
                      ]),
                      Column(children: [
                        Text(
                          "TYPE",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text("",
                            style: TextStyle(fontSize: 8, color: Colors.black))
                      ])
                    ])),
            new SizedBox(height: 2, child: Container(color: Colors.white)),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 22),
                child: Text(
                  "",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 10),
                )),
            Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 0), // changes position of shadow
                  )
                ]),
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: Row(
                  children: <Widget>[
                    quantity({
                      "title": "MATERIALS",
                      "value": "",
                      "image": "assets/images/product/material.png"
                    }),
                    quantity({
                      "title": "DIAMOND",
                      "value":
                          " | " + widget.productdata.carat.toString() + "ct",
                      "image": "assets/images/product/diamond.png"
                    }),
                    quantity({
                      "title": "PRODUCT WEIGHT",
                      "value": "",
                      "image": "assets/images/product/weighht.png"
                    }),
                  ],
                )),
            Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ]),
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                padding: EdgeInsets.all(12),
                child: Column(children: <Widget>[
                  rateWidget({
                    "title": "DIAMOND SET",
                    "amount": widget.productdata.diamondSet.toString()
                  }),
                  rateWidget({
                    "title": "ARTICLE - NECKLACE",
                    "amount": widget.productdata.articleNecklace.toString()
                  }),
                  rateWidget({
                    "title": "GROSS WEIGHT",
                    "amount": widget.productdata.grossWeight.toString()
                  }),
                  rateWidget({
                    "title": "NET WEIGHT",
                    "amount": widget.productdata.netWeight.toString()
                  }),
                  rateWidget({
                    "title": "DIAMOND PIECES",
                    "amount": widget.productdata.diamondPieces.toString()
                  }),
                  rateWidget({
                    "title": "COLORSTONE WEIGHT",
                    "amount": widget.productdata.colorStoneWeight.toString()
                  }),
                  rateWidget({
                    "title": "COLORSTONE PIECES",
                    "amount": widget.productdata.colorStonePieces.toString()
                  }),
                  rateWidget({
                    "title": "POLKI WEIGHT",
                    "amount": widget.productdata.polkiWeight.toString()
                  }),
                  rateWidget({
                    "title": "POLKI PIECES",
                    "amount": widget.productdata.polkiPieces.toString()
                  }),
                  rateWidget({
                    "title": "TAG PRICE",
                    "amount": widget.productdata.tagPrice.toString()
                  }),
                ]))
          ],
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                requestCall();
              },
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  color: Theme.of(context).primaryColor,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                      children: [
                        WidgetSpan(
                            child: Padding(
                                padding: EdgeInsets.only(right: 8, bottom: 2),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                  size: 14,
                                ))),
                        TextSpan(text: 'REQUEST A CALL BACK'),
                      ],
                    ),
                  )),
            ))
        // request(context),
      ]),
    );
  }
}

class Contactbutton extends StatelessWidget {
  final String label;
  const Contactbutton({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: 220,
        child: RaisedButton(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            label,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ));
  }
}

Widget rateWidget(data) {
  print(data);
  return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[50])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            data["title"],
            style: TextStyle(
                fontSize: 10, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          Text(
            data["amount"].toString(),
            style: TextStyle(
                fontSize: 10, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ],
      ));
}

Widget request(context) {
  return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          context.requestCall();
        },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 18),
            color: Theme.of(context).primaryColor,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                children: [
                  WidgetSpan(
                      child: Padding(
                          padding: EdgeInsets.only(right: 8, bottom: 2),
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 14,
                          ))),
                  TextSpan(text: 'REQUEST A CALL BACK'),
                ],
              ),
            )),
      ));
}

Widget jewellerybox(zoom, url, screenWidth) {
  return GestureDetector(
    onTap: () {
      zoom(url);
    },
    child: Container(
        width: screenWidth / 3,
        height: screenWidth / 3,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ]),
        child: CachedNetworkImage(
          imageUrl: url,
          height: screenWidth / 3,
          //width: 100,
        )),
  );
}

Widget quantity(data) {
  return Expanded(
      child: Column(children: <Widget>[
    Image.asset(
      data["image"],
      height: 18,
    ),
    Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          data["title"].toString(),
          style: TextStyle(
              color: Colors.black, fontSize: 10, fontWeight: FontWeight.w600),
        )),
    Text(data["value"].toString(),
        style: TextStyle(color: Colors.black, fontSize: 8))
  ]));
}

Widget wishlist(context) {
  return Positioned(
      top: 16,
      right: 16,
      child: Image.asset(
        "assets/images/product/Bell_Icon.png",
        height: 12,
      ));
}
