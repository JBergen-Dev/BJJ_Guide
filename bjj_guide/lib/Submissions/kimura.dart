import 'package:flutter/material.dart';
class Kimura extends StatefulWidget {
  const Kimura({Key? key}) : super(key: key);
 
  @override
  State<Kimura> createState() => _KimuraState();
}

class _KimuraState extends State<Kimura> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kimura",
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
                  'assets/images/kimura1.jpg',
                  //height: 247*1.25,
                  //width: 300*1.25,
                ),
                Image.asset(
                  'assets/images/kimura2.jpg',
                  //height: 247,
                  //width: 300,
                ),
                Image.asset(
                  'assets/images/kimura3.jpg',
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
                  "A shoulder joint lock which uses both of the practitioner’s arms to rotate the opponent’s arm towards their back, also known as a double wrist lock. The kimura is named after Masahiko Kimura, a judoka who defeated Hélio Gracie with this technique.",
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