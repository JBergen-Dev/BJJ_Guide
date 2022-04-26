import 'package:bjj_guide/Buttons/history.dart';
import 'package:bjj_guide/models/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Buttons/positionList.dart';
import 'database_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;
    final DatabaseService _db = DatabaseService();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Brazilian Jiu-Jitsu",
            style: TextStyle(color: Colors.yellow),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
                heroTag: "btn1",
                child: const Icon(Icons.history_edu_rounded),
                onPressed: (() => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HistoryPage())))),
            Container(height: 0, width: 15),
            FloatingActionButton(
                heroTag: "btn2",
                child: const Icon(Icons.list_alt_rounded),
                onPressed: (() => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PositionList())))),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            const Text(
              "What is it?",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            const Text(
              "Brazilian Jiu-Jitsu (BJJ) is a martial art, sport, self-defense system, and a vehicle for self-improvement. Given this, each practitioner takes part in BJJ for a certain combination of these four things. Global awareness for BJJ is due in large part to the raising popularity of the UFC. However, BJJ is just one of the many forms of training that mixed martial arts fighters need. In its pure form, BJJ does not involve any sort of striking (punches, kicks, etc.). It is submission grappling only. That means your essentially wrestling, but unlike the sport of wrestling, you’re focus is submissions (techniques that force your opponent to tap out). Unlike boxing and other striking martial arts, you can train BJJ 100% because you’re not hitting or purposefully injuring your opponent. If anything hurts, you’re training partner can just tap or say “tap”.",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            const Text(
              "Purpose of this guide:",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            const Text(
              "There’s an untold number of techniques and variations in BJJ. Nothing can substitute hours on the mats, with live sparring and a qualified instructor (ideally purple belt or higher). This app is simply designed to familiarize beginners with the basic positions, moves, and terminology of BJJ. The learning curve as a white belt can very intimidating, which is why a reference guide can be very useful to beginners. While the focus of this app is pure Jiu-Jitsu, I will briefly mention the practicality of certain moves in MMA or self-defense situations. This is because some moves may work well in on gym mats with good training partners, but could get you hurt or even killed in a street fight as your attacker likely hasn’t agreed to any rules. In general, you should never play guard (be on the bottom) in a real fight, especially on concrete.",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            const Text(
              "Comments",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
           StreamBuilder<List<Comment>>(
        stream: _db.comments,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var comments = snapshot.data ?? [];
            return ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: comments.length,
              itemBuilder: (BuildContext context, int index) =>
                   Text(comments[index].comment),
                  reverse: true,
            );
          } else {
            return const Text("no comments yet.");
          }
        },
      ),
            Container(height: 55)
          ]),
        ));
  }
}
