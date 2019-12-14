import 'package:flutter/material.dart';
import 'package:programmerquotes/common.dart' as prefix0;
import 'package:programmerquotes/models/QuetoModel.dart';

import '../data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<QuetoModel> data = Data.data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 12),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 12,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFF7576B),
                      blurRadius: 20.0,
                      // has the effect of softening the shadow
                      spreadRadius:
                          1.0, // has the effect of extending the shadow
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(64),
                      bottomRight: Radius.circular(64)),
                  gradient: new LinearGradient(colors: [
                    Color(0xFFF7576B),
                    Color(0xFFF13980),
                  ])),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Programming Quotes",
                  style: TextStyle(
                      fontSize: 18, color: Colors.white.withAlpha(232)),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                  shrinkWrap: true,
                  children: data.map((word) {
                    return Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 8.0),
                      child: buildItem(word),
                    );
                  }).toList()),
            )
          ],
        ),
      ),
    );
  }

  Widget buildItem(QuetoModel data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color:prefix0.colors[data.hashCode%5] ,
            blurRadius: 5.0, // has the effect of softening the shadow
            spreadRadius: 0.5, // has the effect of extending the shadow
          )
        ],
      ),
      margin: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: prefix0.colors[data.hashCode%5],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  topLeft: Radius.circular(12),
                )),
            height: 136,
            width: 16,
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 12, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("\""+data.en+"\""),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Text("- " + data.author))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
