import 'package:flutter/material.dart';
import 'package:flutterapp2/page/home.dart';
import 'package:flutterapp2/page/start.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "demo",
      theme: ThemeData.light(),
      home: Nav(),
    );
  }
}
class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> with TickerProviderStateMixin {
  TabController controller;
  List<Tab> picList;
  List<Widget>viewList;
  @override
  void initState() {
    picList = [
      Tab(text: "Bang!",icon: Icon(Icons.message),),
      Tab(text: "星际学院",icon: Icon(Icons.radio_button_checked),),
      Tab(text: "创投",icon: Icon(Icons.lightbulb_outline),),
      Tab(text: "我的",icon: Icon(Icons.perm_identity),),
    ];
    viewList = [
      WorkHomePage(),
      StartPage(),
      StartPage(),
      StartPage(),
    ];
    controller = TabController(length:picList.length,vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: viewList,
      ),
      bottomNavigationBar: TabBar(
        labelColor: Colors.orange,
        unselectedLabelColor: Colors.black,
        controller: controller,
        tabs: picList
      )
    );
  }
}
