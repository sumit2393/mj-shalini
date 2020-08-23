import 'package:flutter/material.dart';

class Notificationlist extends StatelessWidget {
  final notificationlist = [
    {
      "image": "assets/images/dummybangles.jpeg",
      "title": "New Launch Product",
      "subtitle":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    },
    {
      "image": "assets/images/dummybrace.jpg",
      "title": "Message",
      "subtitle":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    },
    {
      "image": "assets/images/dummybangles.jpeg",
      "title": "Message",
      "subtitle":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notifications"),
        ),
        body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 18),
            itemCount: notificationlist.length,
            itemBuilder: (context, index) {
              return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(top: 16),
                  child: ListTile(
                    trailing: Icon(
                      Icons.more_horiz,
                      color: Theme.of(context).primaryColor,
                    ),
                    contentPadding: EdgeInsets.all(20),
                    leading: Container(
                      height: 58,
                      width: 58,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  notificationlist[index]["image"]))),
                    ),
                    title: Text(
                      notificationlist[index]["title"],
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        notificationlist[index]["subtitle"],
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ));
            }));
  }
}
