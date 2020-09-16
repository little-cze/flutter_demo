import 'package:flutter/material.dart';

import 'model.dart';

class HomeListWidget extends StatelessWidget {
  final HomeModel data;

  const HomeListWidget({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(data.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Text(data.time,style: TextStyle(fontSize: 12,color: Colors.grey),),
                    Spacer(),
                    Icon(Icons.remove_red_eye,color: Colors.grey,),
                    SizedBox(width: 2,),
                    Text(data.eye,style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12
                    ),)
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8)
            ),
            width: 80,
            height: 80,
          )
        ],
      ),
    );
  }
}
