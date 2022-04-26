import 'package:bjj_guide/Drop%20Down/history.dart';
import 'package:bjj_guide/Submissions/americana.dart';
import 'package:bjj_guide/Submissions/armTriangle.dart';
import 'package:bjj_guide/Submissions/kimura.dart';
import 'package:flutter/material.dart';
class SideControl extends StatefulWidget {
  const SideControl({Key? key}) : super(key: key);
 
  @override
  State<SideControl> createState() => _SideControlState();
}

class _SideControlState extends State<SideControl> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Side Control",
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
                  'assets/images/sideControl1.jpg',
                  //height: 247*1.25,
                  //width: 300*1.25,
                ),
                Image.asset(
                  'assets/images/sideControl2.jpg',
                  //height: 247,
                  //width: 300,
                ),
              ])),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, //.horizontal
              child: Column(children:<Widget>[
                const Text(
                  "\"Side control is one of those positions that people perceive differently as they progress through Jiu-Jitsu. At first, they see it as the ultimate position of pressure, where you get points and you can hold your opponent indefinitely. Both of these perceptions soon prove to be wrong, though. What students soon find out is that side control is actually a very dynamic position, especially against an experienced opponent. And even though it is part of the Jiu-Jitsu basics, holding on to it requires time on the mats and repetition. Only when you truly get eth dynamic nature of the position and you learn how to with your weight effortlessly, you can use side control to pin someone in place.\" - BJJ World",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  "Top",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 28.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  "Goal: Keep your weight low in order to make it uncomfortable for your opponent and prevent them from bucking you off. Submissions opportunities will appear depending on how your opponent defends. Only give up on top mount if you can take the back or move directly in to a submission",
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
                  "Goal: Frame on your opponents hips and attempt to sweep or regain your guard. Resist the urge to extend your arms out to push them off as it leaves you open to an armbar. There are no submissions or means of controll for you here, so get out as soon as possible.",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  "Transitions",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
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
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Americana())),
                 child: const Text("Americana")),
                 TextButton(onPressed: ()=>
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ArmTriangle())),
                 child: const Text("Arm Triangle")),
              ]),
            ),
          )
        ],
      ),
       );
  }
}