import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp2/page/news.dart';
//星际学院

class StartPage extends StatelessWidget {
  List swiperList = [
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2671288219,3967743315&fm=26&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2671288219,3967743315&fm=26&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2671288219,3967743315&fm=26&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2671288219,3967743315&fm=26&gp=0.jpg",
  ];
  List<IconModel> iconList = [
    IconModel(icon: Icons.apps, title: "全部课程"),
    IconModel(icon: Icons.person, title: "找投资人"),
    IconModel(icon: Icons.hearing, title: "创业百科"),
    IconModel(icon: Icons.book, title: "有声书"),
    IconModel(icon: Icons.format_align_justify, title: "会员专区"),
    IconModel(icon: Icons.card_giftcard, title: "领取礼物"),
    IconModel(icon: Icons.shop, title: "我的商品"),
    IconModel(icon: Icons.share, title: "分销中心"),
  ];
  List textList = [
    "创业融资",
    "财权财税",
    "认知升级",
    "市场运营",
    "战略创新",
    "组织管理",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        searchWidget(),
        swiperWidget(context),
        SizedBox(
          height: 10,
        ),
        iconTextWidget(),
        titleWidget(),
        classWidget()
      ],
    );
  }

  Widget textWidget(String text) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.orange,
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  Widget classWidget() {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 2),
        itemCount: textList.length,
        itemBuilder: (context, index) =>
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: textWidget(textList[index])));
  }

  Widget titleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "全部课程",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            "更多",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget iconTextWidget() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: iconList.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Icon(iconList[index].icon),
              Text(iconList[index].title)
            ],
          );
        });
  }

  Widget swiperWidget(context) {
    double wid = MediaQuery.of(context).size.width;
    double hig = wid / 16 * 9;
    return Container(
      width: wid,
      height: hig,
      child: Swiper(
        pagination: SwiperPagination(alignment: Alignment.bottomCenter),
        itemBuilder: (context, index) => InkWell(
          onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsPage())),
          child: Image.network(
            swiperList[index],
            fit: BoxFit.cover,
          ),
        ),
        itemCount: swiperList.length,
      ),
    );
  }

  Widget searchWidget() => Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), border: Border.all()),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.grey))),
              padding: EdgeInsets.only(right: 8),
              margin: EdgeInsets.only(right: 8),
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: "搜索你需要的课程！"),
              ),
            )
          ],
        ),
      );
}

class IconModel {
  final IconData icon;
  final String title;

  IconModel({this.icon, this.title});
}
