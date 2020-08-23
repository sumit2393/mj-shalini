import 'package:flutter/material.dart';
import 'package:flutter_app_mbj/SharedWidgets/Productlist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/httpservices.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  int userid;
  bool loading = false;
  int totalitem;
  List wishlist = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      loading = true;
    });
    getUserid();
  }

  getUserid() async {
    print("userid function called");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userid = preferences.getInt("id");
    print("userid" + userid.toString());
    fetchWishlist(userid).then((value) => {
          setState(() {
            loading = false;
            wishlist = value.data.wishlist;
            totalitem = value.data.totalWishlistItem;
          }),
          print("value of wishlist"),
          print(value)
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      !loading
          ? totalitem == 0
              ? Center(child: Text("Wishlist is Empty"))
              : ProductList(wishlist, userid)
          : Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                backgroundColor: Theme.of(context).primaryColor,
              ),
            )
    ]));
  }
}
