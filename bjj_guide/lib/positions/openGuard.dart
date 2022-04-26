import 'package:flutter/material.dart';
class OpenGuard extends StatefulWidget {
  const OpenGuard({Key? key}) : super(key: key);
 
  @override
  State<OpenGuard> createState() => _OpenGuardState();
}

class _OpenGuardState extends State<OpenGuard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Open Guard",
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
                  'assets/images/open1.jpg',
                  //height: 247*1.25,
                  //width: 300*1.25,
                ),
                Image.asset(
                  'assets/images/open2.jpg',
                  //height: 247,
                  //width: 300,
                ),
                Image.asset(
                  'assets/images/open3.jpg',
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
                  "Open guard is a broad term that refers to a variety of guard styles where the bottom players legs are not attached to their opponent. This most commonly occurs at the beggining of a match or when the top player willingly disengages for a reset. The advantage here goes to the more skilled athlete as open guard is often a 50/50 battle.",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Top",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 28.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Goal: Pass your opponents guard. You cannnot submit your opponent until you have a hold on them, but you want to avoid going in to their guard.",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Bottom",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 28.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Goal: Focus on sweeps for traditional Jiu-Jitsu. For MMA, self-defense, and certain BJJ rule-sets, you may also attack with leg locks",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Submissions",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "These exist but not are not recommended for most white belts due to safety concerns.",
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