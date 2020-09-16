import 'package:flutter/material.dart';

///课堂分类
///
class ClassPage extends StatefulWidget {
  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  List listLeft;
  List<Widget> listRight;
  int count;

  @override
  void initState() {
    count = 0;
    listLeft = [
      "创业",
      "融资",
      "商业计划书",
      "财税",
      "创业",
      "融资",
      "商业计划书",
      "财税",
      "创业",
      "融资",
      "商业计划书",
      "财税",
      "创业",
      "融资",
      "商业计划书",
      "财税",
      "创业",
      "融资",
      "商业计划书",
      "财税",
    ];
    List picList = [
      "创业",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600164553162&di=727b3dd4fe1b093d835b958d356fb920&imgtype=0&src=http%3A%2F%2F8155383.s21i.faiusr.com%2F2%2FABUIABACGAAgr9jY0QUomJ7IkAYwgAg4sQY.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600164553161&di=266c6783a62c0aa05cd2f5f1e722d0d3&imgtype=0&src=http%3A%2F%2Fupload.jsw.com.cn%2F2017%2F0626%2F1498460708728.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600164553161&di=266c6783a62c0aa05cd2f5f1e722d0d3&imgtype=0&src=http%3A%2F%2Fupload.jsw.com.cn%2F2017%2F0626%2F1498460708728.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600164553161&di=266c6783a62c0aa05cd2f5f1e722d0d3&imgtype=0&src=http%3A%2F%2Fupload.jsw.com.cn%2F2017%2F0626%2F1498460708728.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600164553161&di=d498274faa599e9d9e753dc65b76e26d&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20170227%2Fa4da1e832fb14e7bbacb151f3406e6d8_th.jpeg"
    ];
    listRight = [
      chuangYeWidget(picList),
      Center(
        child: Text("融资"),
      ),
      Center(
        child: Text("商业计划书"),
      ),
      Center(
        child: Text("财税"),
      ),
      Center(
        child: Text("创业"),
      ),
      Center(
        child: Text("融资"),
      ),
      Center(
        child: Text("商业计划书"),
      ),
      Center(
        child: Text("财税"),
      ),
      Center(
        child: Text("创业"),
      ),
      Center(
        child: Text("融资"),
      ),
      Center(
        child: Text("商业计划书"),
      ),
      Center(
        child: Text("财税"),
      ),
      Center(
        child: Text("创业"),
      ),
      Center(
        child: Text("融资"),
      ),
      Center(
        child: Text("商业计划书"),
      ),
      Center(
        child: Text("财税"),
      ),
      Center(
        child: Text("创业"),
      ),
      Center(
        child: Text("融资"),
      ),
      Center(
        child: Text("商业计划书"),
      ),
      Center(
        child: Text("财税"),
      ),
    ];
    // TODO: implement initState
    super.initState();
  }

  Widget chuangYeWidget(List picList) {
    return ListView.builder(
      itemCount: picList.length,
      itemBuilder: (context, index) {
        return index == 0
            ? Text("创业")
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      picList[index],
                    )),
              );
      },
    );
  }

  Widget leftWidget() {
    return Container(
      width: 100,
      child: ListView.builder(
          itemCount: listLeft.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    count = index;
                  });
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    child: Text(
                      listLeft[index],
                      style: TextStyle(
                          color: index == count ? Colors.orange : Colors.black),
                    )),
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        title: Text(
          "课堂分类",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        actions: <Widget>[
          Icon(
            Icons.search,
            color: Colors.black,
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Row(
        children: <Widget>[
          leftWidget(),
          Expanded(
            child: listRight[count],
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
