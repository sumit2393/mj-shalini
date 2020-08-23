import 'package:flutter/material.dart';
import './Home.dart';

import './Wishlist.dart';
import './Notification.dart';
import './Profile_Screen.dart';
import './searchproduct.dart';

List<dynamic> tabsdata = [
  {
    "icon": "assets/images/home/Home_ICon.png",
    "page": Home(),
    "title": Image.asset(
      "assets/images/home/Home_Page_Logo_Icon.png",
      height: 40,
      width: 60,
      //fit: BoxFit.cover,
    )
  },
  {
    "icon": "assets/images/home/wish_Icon.png",
    "page": Wishlist(),
    "title": Text("Wishlist")
  },
  {
    "icon": "assets/images/home/Offer_ICon.png",
    "page": Wishlist(),
    "title": Text("Wishlist")
  },
  // {"icon":"assets/images/home/Gold_icon.png"},
  // {"icon":"assets/images/home/Cart_ICon.png"}
];

const drawerdata = [
  {"name": "Profile", "moveto": ""},
  {"name": "Collection", "moveto": ""},
  {"name": "Products", "moveto": ""},
  {"name": "About", "moveto": ""},
  {"name": "Contact us", "moveto": ""},
];

class Initial extends StatefulWidget {
  @override
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          centerTitle: true,
          title: tabsdata.elementAt(_selectedIndex)["title"],
          leading: Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
                onTap: () => _scaffoldKey.currentState.openDrawer(),
                child: Image.asset(
                  "assets/images/home/Menu-Icon.png",
                  height: 24,
                  width: 24,
                )),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Notificationlist())),
              child: Image.asset(
                "assets/images/home/Bell_Icon.png",
                height: 14,
                width: 14,
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchProduct())),
                  child: Image.asset(
                    "assets/images/product/Search_Icon.png",
                    height: 16,
                    width: 16,
                  ),
                ))
          ],
        ),
      ),
      drawer: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(45), bottomRight: Radius.circular(45)),
          child: Container(
            width: MediaQuery.of(context).size.width - 80,
            child: Drawer(
                child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 40),
              children: <Widget>[
                buildDrawer(context),
                buildListTile(
                    context, {"name": "Profile", "goto": Profile_Screen()}),
                Divider(),
                // buildListTile(context, {"name": "Collection", "goto": ""}),
                // Divider(),
                // buildListTile(context, {"name": "Products", "goto": ""}),
                // Divider(),
                buildListTile(context, {"name": "About", "goto": ""}),
                Divider(),
                buildListTile(context, {"name": "Contact us", "goto": ""}),
              ],
            )),
          )),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        items: tabsdata
            .map((e) => BottomNavigationBarItem(
                backgroundColor: Color(0xFF670e1e),
                title: Text(""),
                icon: Image.asset(
                  e["icon"],
                  height: 24,
                )))
            .toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: tabsdata.elementAt(_selectedIndex)["page"],
    );
  }

  Container buildDrawer(BuildContext context) {
    return Container(
      height: 150,
      child: DrawerHeader(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
            border: Border(
          bottom: Divider.createBorderSide(context,
              color: Colors.white, width: 0.0),
        )),
        child: Align(
            alignment: Alignment.topLeft,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2.0,
                          offset: -Offset(1, 1),
                          color: Colors.white),
                      BoxShadow(
                          blurRadius: 2.0,
                          offset: Offset(1, 1),
                          color: Colors.grey.shade400)
                    ]),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Theme.of(context).primaryColor,
                ))),
      ),
    );
  }

  ListTile buildListTile(BuildContext context, info) {
    return ListTile(
      title: Text(
        info["name"],
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
      ),
      trailing: Icon(Icons.arrow_forward_ios,
          size: 14, color: Theme.of(context).primaryColor),
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => info["goto"]));
      },
    );
  }
}
