import 'package:flutter/material.dart';
class ArmTriangle extends StatefulWidget {
  const ArmTriangle({Key? key}) : super(key: key);
 
  @override
  State<ArmTriangle> createState() => _ArmTriangleState();
}

class _ArmTriangleState extends State<ArmTriangle> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arm Triangle",
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
                  'assets/images/armTraingle1.jpg',
                  //height: 247*1.25,
                  //width: 300*1.25,
                ),
                Image.asset(
                  'assets/images/armTraingle2.jpg',
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
                  "A chokehold submission using the practitioner’s forearm and the opponent’s own shoulder. This differs from a regular triangle which uses the practitioner’s legs instead of the forearm, but still uses their opponent’s shoulders to complete the submission. There area number of arm triangle variations including the kata gatame, D’arce and anaconda.",
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