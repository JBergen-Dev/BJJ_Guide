import 'package:bjj_guide/Submissions/armbar.dart';
import 'package:bjj_guide/Submissions/kimura.dart';
import 'package:bjj_guide/Submissions/triangle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClosedGuard extends StatefulWidget {
  const ClosedGuard({Key? key}) : super(key: key);

  @override
  State<ClosedGuard> createState() => _ClosedGuardState();
}

class _ClosedGuardState extends State<ClosedGuard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Closed Guard",
            style: TextStyle(color: Colors.yellow),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: <Widget>[
                  Image.asset(
                    'assets/images/closedGuardHeadGrip.jpg',
                    //height: 250.0,
                    //width: itemWidth*1.25,
                  ),
                  Image.asset(
                    'assets/images/ClosedGuardNoGrip.jpg',
                    // height: 250.0,
                    //width: itemWidth*1.25,
                  )
                ])),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical, //.horizontal
                child: Column(children: <Widget>[
                  const Text(
                    "Top",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 28.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "Goal: Depending on your opponent's skill level, siting in closed guard can be very dangerous. As a top player, there are no practical submissions available to you. You should be constantly trying to break your opponents guard in order to pass or disengage for a standup.",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "Bottom",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 28.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "Goal: A basic closed guard is the style of guard most often taught to beginners, and it is still effective at the highest levels of competition. It locks your opponent between your legs, offering great control, preventing the opponent from improving position and providing you an opportunity to attack with sweeps and submissions. A ‘relaxed’ position in the Closed Guard can be used for resting in BJJ or submission grappling, but it can get you very hurt in an MMA or self-defense scenario. If you use the Closed Guard to defend against strikes you MUST keep your opponent’s head down, close to you, or he will have the distance and leverage to land some very damaging blows. If you simply can’t break his posture then immediately switch to a form of Open Guard that keeps him away, out of striking distance.",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "Submissions",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Kimura())),
                      child: const Text("Kimura")),
                  TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Triangle())),
                      child: const Text("Triangle")),
                  TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ArmBar())),
                      child: const Text("Arm Bar")),
                ]),
              ),
            )
          ],
        ));
  }
}
