//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../provider/httpservices.dart';

class ProductList extends StatefulWidget {
  final productlist;

  final userid;

  ProductList(this.productlist, this.userid);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool isloading = false;

  requestCall(productid) {
    requestCallback(productid, widget.userid).then((value)  {
          if (value["status"] == "success")
            {registerToast(value["data"]["message"]);}
          else
            {registerToast("Something went wrong");}
        });
  }

  removeFromWishlist(pid, index) {
    setState(() {
      isloading = true;
    });
    removeWish(widget.userid.toString(), pid.toString()).then((value)  {
          print(value);
          if (value["status"] == "success")
            {
              setState(() {
                isloading = false;
                widget.productlist.removeAt(index);
              });
            }
          else
            {registerToast("Something went wrong");}
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

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      !isloading
          ? GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: widget.productlist.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 18,
                crossAxisSpacing: 16,
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height - 200),
              ),
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 7,
                          blurRadius: 7,
                          offset: Offset(0, 0), // changes position of shadow
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Stack(children: <Widget>[
                      Column(children: <Widget>[
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(widget
                                            .productlist[index]
                                            .product
                                            .image
                                            .url))))),
                        // Text(widget.productlist[index].product.name),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 7),
                            child: Text(
                              widget.productlist[index].product.name,
                              style: TextStyle(fontSize: 12),
                            )),
                        Text(
                            "\u20B9" +
                                widget.productlist[index].product.tagPrice
                                    .toString(),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            )),

                        ButtonTheme(
                            minWidth: 200.0,
                            height: 28.0,
                            buttonColor: Theme.of(context).primaryColor,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Text(
                                  "REQUEST A CALLBACK",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                                onPressed: () {
                                  requestCall(
                                      widget.productlist[index].product.id);
                                }))
                      ]),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                            onTap: () {
                              removeFromWishlist(
                                  widget.productlist[index].product.id, index);
                            },
                            child: Icon(Icons.close, color: Colors.grey)),
                      ),
                    ]));
              })
          : Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                backgroundColor: Theme.of(context).primaryColor,
              ),
            )
    ]);
  }
}
