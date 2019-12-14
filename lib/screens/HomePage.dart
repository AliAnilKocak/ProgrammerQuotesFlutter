import 'package:flutter/material.dart';
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 12,
              decoration: BoxDecoration(
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
                  "Programming Quetos",
                  style: TextStyle(
                      fontSize: 18, color: Colors.white.withAlpha(232)),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                  shrinkWrap: true,
                  children: data.map((word) {
                    return buildItem(word);
                  }).toList()),
            )
          ],
        ),
      ),
    );
  }

  Widget buildItem(QuetoModel word) {
    return Text(word.author);
  }
}
