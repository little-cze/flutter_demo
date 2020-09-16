import 'package:flutter/material.dart';

import 'home_widget.dart';
import 'model.dart';

class HomeTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<HomeModel> dataList = [
      HomeModel(title: "腾讯", time: "54分钟前", eye: "234", pic: ""),
      HomeModel(title: "312zhiho", time: "54分钟前", eye: "234", pic: ""),
      HomeModel(title: "312zhiho", time: "54分钟前", eye: "234", pic: ""),
      HomeModel(title: "312zhiho", time: "54分钟前", eye: "234", pic: ""),
      HomeModel(title: "312zhiho", time: "54分钟前", eye: "234", pic: ""),
    ];
    return ListView(

      children: dataList.map((e) => HomeListWidget(data: e,)).toList(),
    );
  }
}
