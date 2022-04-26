import 'package:flutter/material.dart';
class RearNakedChoke extends StatefulWidget {
  const RearNakedChoke({Key? key}) : super(key: key);
 
  @override
  State<RearNakedChoke> createState() => _RearNakedChokeState();
}

class _RearNakedChokeState extends State<RearNakedChoke> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rear Naked Choke",
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
                  'assets/images/RNC1.jpg',
                  //height: 247*1.25,
                  //width: 300*1.25,
                ),
                Image.asset(
                  'assets/images/RNC4.jpg',
                  //height: 247,
                  //width: 300,
                ),
                Image.asset(
                  'assets/images/RNC3.jpg',
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
                  "An iconic choke which a practitioner completes from back control when behind their opponent. The practitioner sinks one of their forearms under their opponent’s chin and grabs their other arm to complete the choke. Also known as the rear naked strangle or mata leão (lion killer in Portuguese).",
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