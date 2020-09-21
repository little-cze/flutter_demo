import 'package:flutter/material.dart';

//sliver Demo

class SliverPage extends StatefulWidget {
  @override
  _SliverPageState createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> with TickerProviderStateMixin {
  TabController aController;

  @override
  void initState() {
    // TODO: implement initState
    aController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TabBar(
          controller: aController,
          tabs: <Widget>[
            Text("1"),
            Text("2"),
            Text("3"),
          ],
        ),
      ),
      body: TabBarView(
        controller: aController,
        children: <Widget>[
          APage(),
          Center(
            child: Text("1"),
          ),
          Center(
            child: Text("1"),
          ),
        ],
      ),
    );
  }
}

class APage extends StatefulWidget {
  @override
  _APageState createState() => _APageState();
}

class _APageState extends State<APage> with TickerProviderStateMixin {
  TabController tabController;
  ScrollController scrollController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    scrollController = ScrollController();
    // TODO: implement initState

    scrollController.addListener((){
      print(scrollController.offset);
    });
    super.initState();
  }

  List<Widget> scrollWidget(BuildContext context, bool innerBoxIsScrolled) {
    return [
      SliverAppBar(
        pinned: true,
        title: Text("aa"),
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 100,
          child: Text("ha"),
        ),
      ),
      SliverPersistentHeader(

        delegate: MyHeadDelegate(TabBar(
          controller: tabController,
          tabs: <Widget>[
            Container(child: Text("1"),),
            Container(child: Text("1"),),
            Container(child: Text("1"),),
          ],
        )),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(

      controller: scrollController,
      headerSliverBuilder: scrollWidget,
      body: Column(
        children: <Widget>[

          Container(
            key: UniqueKey(),
            margin: EdgeInsets.only(top: scrollController.offset<228?0:80),
            color: Colors.orange,
            height: 50,
            child: Text("TabBar"),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context,index){
              return Text("$index");
            })
          )
        ],
      ),
    ));
  }
}

class MyHeadDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  MyHeadDelegate(this.child);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => this.child.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}
