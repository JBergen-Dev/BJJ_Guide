import 'package:bjj_guide/Submissions/armTriangle.dart';
import 'package:flutter/material.dart';

import '../Submissions/kimura.dart';

class HalfGuard extends StatefulWidget {
  const HalfGuard({Key? key}) : super(key: key);

  @override
  State<HalfGuard> createState() => _HalfGuardState();
}

class _HalfGuardState extends State<HalfGuard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Half Guard",
          style: TextStyle(color: Colors.yellow),
        ),
      ),
      body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: <Widget>[
              Image.asset(
                'assets/images/halfGuard1.jpg',
                //height: 247*1.25,
                //width: 300*1.25,
              ),
              Image.asset(
                'assets/images/halfGuard2.jpg',
                //height: 247,
                //width: 300,
              ),
              Image.asset(
                'assets/images/kneeShield.jpg',
                //height: 247,
                //width: 300,
              )
            ])),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical, //.horizontal
                child: Column(children: <Widget>[
                  Text(
                    "As the bottom athlete you have one of your opponent’s legs trapped between both of your own legs. On one hand that means that they are halfway past your guard – which is a disadvantage to you – but on the other hand you can insert themselves deep under your opponent’s center of gravity, which makes sweeping them much easier (if you know what to do). ",
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
                    "Goal: attempt to submit or advance to a better position ",
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
                    "Goal: Prevent your opponent from bearing their weight down on you or passing your guard. Look to sweep or regain closed guard(a safer guard for beginners)",
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
                 TextButton(onPressed: ()=>
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Kimura())),
                 child: const Text("Kimura")),
                 TextButton(onPressed: ()=>
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ArmTriangle())),
                 child: const Text("Arm Triangle")),
                ]),
              ),
            )
          ],
        )
    );
  }
}
