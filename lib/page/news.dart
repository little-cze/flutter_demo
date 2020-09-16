import 'package:flutter/material.dart';

import 'class_page.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            Icon(
              Icons.more_horiz,
              color: Colors.black,
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            titleWidget("title"),
            timeWidget("今天01：15"),
            GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ClassPage())),
                child: picWidget(context)),
            messageWidget("ahahh")
          ],
        ),
        bottomNavigationBar: bottomWidget());
  }

  Widget messageWidget(text) => Container(
        padding: EdgeInsets.all(16),
        child: Text(
          text,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      );

  Widget picWidget(context) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 16 * 9,
        child: Image.network(
          "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2671288219,3967743315&fm=26&gp=0.jpg",
          fit: BoxFit.cover,
        ),
      );

  Widget titleWidget(String title) => Container(
        margin: EdgeInsets.only(top: 5, left: 16, bottom: 8),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      );

  Widget timeWidget(String time) => Container(
        margin: EdgeInsets.only(top: 5, left: 16, bottom: 8),
        child: Text(
          time,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      );

  Widget bottomWidget() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration:
            BoxDecoration(border: Border(top: BorderSide(color: Colors.grey))),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: "我要参与"),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.message),
                  Icon(Icons.camera_rear),
                  Icon(Icons.share)
                ],
              ),
            )
          ],
        ));
  }
}
