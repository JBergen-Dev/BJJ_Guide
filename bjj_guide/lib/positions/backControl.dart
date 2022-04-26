import 'package:bjj_guide/Submissions/rearNakedChoke.dart';
import 'package:flutter/material.dart';

class BackControl extends StatefulWidget {
  const BackControl({Key? key}) : super(key: key);

  @override
  State<BackControl> createState() => _BackControlState();
}

class _BackControlState extends State<BackControl> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Back Control",
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
                    'assets/images/backMount.jpg',
                    //height: 247*1.25,
                    //width: 300*1.25,
                  ),
                  Image.asset(
                    'assets/images/khabibBackControl.jpg',
                    //height: 247,
                    //width: 300,
                  ),
                ])),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical, //.horizontal
                child: Column(children: <Widget>[
                  Text(
                    "Back controll is one of the few positions that all BJJ practitioners strive for. It is 100% advantageous to the person on the back, unless the defender is significantly more skilled. In self-defense and MMA the person with back controll can also strike their opponent without them being able to strike back.",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Defending",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 28.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Goal: Get the hell out of there!",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Attacking",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 28.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Goal: Maintain your leg hooks and seatbelt grip to secure the position. You want your opponent to wear you like a human backpack, then aim to submit them. Only move to another position if you're losing this one. Back control is the holy grail of Jiu-Jitsu, so do your best to keep it",
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
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RearNakedChoke())),
                 child: const Text("Rear Naked Choke")),
                ]),
              ),
            )
          ],
        ));
  }
}
