import 'package:flutter/material.dart';
class Triangle extends StatefulWidget {
  const Triangle({Key? key}) : super(key: key);
 
  @override
  State<Triangle> createState() => _TriangleState();
}

class _TriangleState extends State<Triangle> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Triangle",
        style: TextStyle(
          color: Colors.yellow
        ),),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: <Widget>[
                Image.asset(
                  'assets/images/triangle1.jpg',
                  //height: 247*1.25,
                  //width: 300*1.25,
                ),
                Image.asset(
                  'assets/images/triangle.jpg',
                  //height: 247,
                  //width: 300,
                ),
                Image.asset(
                  'assets/images/triangle3.jpg',
                  //height: 247,
                  //width: 300,
                )
              ])),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, //.horizontal
              child: Column(children: const <Widget>[
                Text(
                  "the quintessential bjj submission which uses the practitioner’s legs and the opponent’s own arm to choke the opponent. The triangle is a very common submission in BJJ due to the variety of positions and guards it can be launched from. It favors people with long legs but it can be done by any body type with some creative angle changes.",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
       );
  }
}