import 'package:flutter/material.dart';
class Americana extends StatefulWidget {
  const Americana({Key? key}) : super(key: key);
 
  @override
  State<Americana> createState() => _AmericanaState();
}

class _AmericanaState extends State<Americana> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Americana",
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
                  'assets/images/americanaSidef.jpg',
                  //height: 247*1.25,
                  //width: 300*1.25,
                ),
                Image.asset(
                  'assets/images/americanaMount.jpg',
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
                  " The Americana is a shoulder joint lock performed by bending the elbow and arm while keeping the rest of the opponent’s shoulder and body still. It generally requires the opponent’s back to be on the mat, so is usually performed by the top player in side control or mount. It’s also known as the figure four arm lock because of the arrangement of the top player’s two arms which wrap around and isolate one of the bottom player’s.",
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