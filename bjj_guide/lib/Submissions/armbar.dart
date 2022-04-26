import 'package:flutter/material.dart';
class ArmBar extends StatefulWidget {
  const ArmBar({Key? key}) : super(key: key);
 
  @override
  State<ArmBar> createState() => _ArmBarState();
}

class _ArmBarState extends State<ArmBar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ArmBar",
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
                  'assets/images/armbarCharlieOlives.jpg', 
                  //height: 247*1.25,
                  //width: 300*1.25,
                ),
                Image.asset(
                  'assets/images/armbarMightyMouse.jpg',
                  //height: 247,
                  //width: 300,
                ),
                Image.asset(
                  'assets/images/armbarRonda.jpg',
                  //height: 247,
                  //width: 300,
                ),
                 Image.asset(
                  'assets/images/fedorArm.jpg',
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
                  "An iconic grappling submission which hyperextends the opponent’s elbow. Arm bars are very versatile and can be initiated from a variety of positions in jiu jitsu including mount and closed guard.",
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