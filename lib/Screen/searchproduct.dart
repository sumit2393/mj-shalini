import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../provider/httpservices.dart';
import './productdetail.dart';

class SearchProduct extends StatefulWidget {
  @override
  _SearchProductState createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  final TextEditingController _searchQuery = TextEditingController();
  int userid;
  List productlist = [];

  @override
  void initState() {
    super.initState();
    getUserid();
  }

  updateSearchQuery(value) {
    print("value for textfield" + value);
    if (value.length != 0) {
      search(value, userid).then((value) {
        print(value.status);
        if (value.status == "success") {
          print("you are in if part");
          print(value.status);
          print(value.data.length);
          setState(() {
            productlist = value.data;
          });
        }
      });
    } else {
      setState(() {
        productlist = [];
      });
    }
  }

  getUserid() async {
    print("userid function called");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userid = preferences.getInt("id");
    print("userid" + userid.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: TextField(
          autofocus: true,
          controller: _searchQuery,
          onChanged: (text) {
            updateSearchQuery(text);
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(end: 16.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
              hintText: "Search products...",
              hintStyle: TextStyle(color: Colors.white)),
        ),
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: productlist.length != 0
              ? ListView.builder(
                  itemCount: productlist.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetail(
                                productdata: productlist[index])));
                      },
                      child: Container(
                          padding: EdgeInsets.all(8),
                          child: Text(productlist[index].name)),
                    );
                  })
              : Center(child: Text("No Products available"))),
    );
  }
}
