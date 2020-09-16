import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'ctabview.dart';

class WorkHomePage extends StatefulWidget {
  @override
  _WorkHomePageState createState() => _WorkHomePageState();
}

class _WorkHomePageState extends State<WorkHomePage>
    with TickerProviderStateMixin {
  List<Tab> tabsList;
  List<Tab> cTabsList;
  List<Widget> viewList;
  List<Widget> cViewList;
  TabController controller;
  TabController tabController;
  ScrollController scrollController;
  SwiperController swiperController;
  List picList;

  @override
  void initState() {
    swiperController = SwiperController();
    tabsList = [
      Tab(text: "首页"),
      Tab(text: "发现"),
      Tab(text: "快讯"),
    ];
    cTabsList = [
      Tab(text: "首页"),
      Tab(text: "发现"),
      Tab(text: "快讯"),
    ];
    cViewList = [
      Container(),
      Center(child: Text("发现")),
      Center(child: Text("快讯")),
    ];
    viewList = [
      Container(),
      Center(child: Text("发现")),
      Center(child: Text("快讯")),
    ];
    controller = TabController(length: tabsList.length, vsync: this);
    tabController = TabController(length: cTabsList.length, vsync: this);
    scrollController = ScrollController();
    picList = ["", "", ""];
    super.initState();
  }

  Widget oneWidget() {
    double wid = MediaQuery.of(context).size.width - 32;
    double hig = wid / 16 * 9;
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
            child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              color: Colors.black12,
              alignment: Alignment.center,
              child: Text("融资速递：勾八牛是真的牛"),
            ),
            Container(
              height: hig,
              child: Swiper(
                loop: true,
                controller: swiperController,
                itemCount: picList.length,
                itemBuilder: (BuildContext context, int index) => Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text("我是图片$index"),
//                child: Image.asset(picList[index]),
                ),
              ),
            ),
          ],
        )),
        SliverPersistentHeader(
          delegate: StickyTabBarDelegate(
            child: TabBar(
              controller: tabController,
              tabs: tabsList,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 5,
              isScrollable: true,
              indicatorColor: Colors.red,
              labelColor: Colors.black,
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(fontSize: 14),
            ),
          ),
          pinned: true,
        ),
//        SliverList(
//          delegate: SliverChildBuilderDelegate(
//              (context,index){
//                return Text("$index");
//              }
//          )
//        ),
        SliverFillRemaining(
            child: TabBarView(
          controller: tabController,
          children: <Widget>[
            HomeTabView(),
            Container(),
            Container(),
          ],
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: <Widget>[
              Expanded(
                child: TabBar(
                  controller: controller,
                  tabs: tabsList,
                  labelPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelColor: Colors.black,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(fontSize: 12),
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            oneWidget(),
            Center(
              child: Text("发现"),
            ),
            Center(
              child: Text("快讯"),
            ),
          ],
        ));
  }
}

class MyDelegateList extends SliverChildDelegate {
  @override
  Widget build(BuildContext context, int index) {
    // TODO: implement build
    return ListView.builder(itemBuilder: (context, index) {
      return Text("$index");
    });
  }

  @override
  bool shouldRebuild(SliverChildDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
