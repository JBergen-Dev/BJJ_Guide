import 'package:bjj_guide/Authentication/signin.dart';
import 'package:bjj_guide/Buttons/history.dart';
import 'package:bjj_guide/models/comment.dart';
import 'package:bjj_guide/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as prefix;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Buttons/positionList.dart';
import 'database_service.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = '/home';
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DatabaseService _db = DatabaseService();
  final TextEditingController _comment = TextEditingController();
  final prefix.FirebaseAuth _auth = prefix.FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              "Brazillian Jiu-Jitsu",
              style: TextStyle(color: Colors.yellow)
            ),
            actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.white,
              onPressed: () {
                logOutBox();
              },
            )
          ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  heroTag: "btn1",
                  child: const Icon(Icons.history_edu_rounded),
                  onPressed: (() => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const HistoryPage())))),
              Container(height: 0, width: 15),
              FloatingActionButton(
                  heroTag: "btn2",
                  child: const Icon(Icons.list_alt_rounded),
                  onPressed: (() => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const PositionList())))),
            ],
          ),
          body: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: <Widget>[
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
                Flex(direction: Axis.vertical, children: <Widget>[
                  StreamBuilder<List<Comment>>(
                      stream: _db.comments,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text("An error has occured!"),
                          );
                        } else {
                          var comments = snapshot.data ?? [];

                          return comments.isNotEmpty
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: comments.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (comments[index].page == "Homepage") {
                                      return ListTile(
                                          title: Card(
                                              child: Row(children: <Widget>[
                                        FutureBuilder(
                                            future: _db
                                                .getUser(comments[index].from),
                                            builder: (
                                              BuildContext context,
                                              AsyncSnapshot<User> snapshot,
                                            ) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return const CircularProgressIndicator();
                                              } else if (snapshot
                                                      .connectionState ==
                                                  ConnectionState.done) {
                                                if (snapshot.hasError) {
                                                  return const Text('Error');
                                                } else if (snapshot.hasData) {
                                                  if (snapshot.data!.belt ==
                                                      "Blue") {
                                                    return Column(children: <
                                                        Widget>[
                                                      Text(snapshot.data!.name,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                      16)),
                                                      Image.asset(
                                                        'assets/belts/blue_belt.png',
                                                        height: itemHeight / 5,
                                                        width: itemWidth / 5,
                                                      )
                                                    ]);
                                                  } else if (snapshot
                                                          .data!.belt ==
                                                      "Purple") {
                                                    return Column(children: <
                                                        Widget>[
                                                      Text(snapshot.data!.name,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                      16)),
                                                      Image.asset(
                                                        'assets/belts/purple_belt.png',
                                                        height: itemHeight / 5,
                                                        width: itemWidth / 5,
                                                      )
                                                    ]);
                                                  } else if (snapshot
                                                          .data!.belt ==
                                                      "Brown") {
                                                    return Column(children: <
                                                        Widget>[
                                                      Text(snapshot.data!.name,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                      16)),
                                                      Image.asset(
                                                        'assets/belts/brown_belt.png',
                                                        height: itemHeight / 5,
                                                        width: itemWidth / 5,
                                                      )
                                                    ]);
                                                  } else if (snapshot
                                                          .data!.belt ==
                                                      "Black") {
                                                    return Column(children: <
                                                        Widget>[
                                                      Text(snapshot.data!.name,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                      16)),
                                                      Image.asset(
                                                        'assets/belts/black_belt.png',
                                                        height: itemHeight / 5,
                                                        width: itemWidth / 5,
                                                      )
                                                    ]);
                                                  } else {
                                                    return Column(children: <
                                                        Widget>[
                                                      Text(snapshot.data!.name,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                      16)),
                                                      Image.asset(
                                                        'assets/belts/white_belt.png',
                                                        height: itemHeight / 5,
                                                        width: itemWidth / 5,
                                                      )
                                                    ]);
                                                  }
                                                } else {
                                                  return const Text(
                                                      'Empty data');
                                                }
                                              } else {
                                                return Text(
                                                    'State: ${snapshot.connectionState}');
                                              }
                                            }),
                                        Flexible(
                                            child: Text(comments[index].comment,
                                                style: const TextStyle(
                                                    fontSize: 16))),
                                      ])));
                                    } else {
                                      return Container(height: 0);
                                    }
                                  })
                              : const Center(
                                  child: Text("No comment have been made yet."),
                                );
                        }
                      })
                ]),
                buildInput(),
                Container(height: 20)
              ]),
        ));
  }
 
  Widget buildInput() {
    return SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              // Edit text
              Flexible(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      autofocus: true,
                      maxLines: 5,
                      controller: _comment,
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Type your comment...',
                      ),
                    )),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                  icon: const Icon(Icons.send, size: 25),
                  onPressed: () => onSendComment(_comment.text),
                ),
              ),
            ],
          ),
        ),
        width: double.infinity,
        height: 100.0);
  }
   Future<void> logOutBox() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure you would like to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                setState(() {
                  _logout(context);
                });
              },
            ),
          ],
        );
      },
    );
  }

  void onSendComment(String content) {
    if (content.trim() != '') {
      _comment.clear();
      content = content.trim();
      _db.addComment(content, getCurrentUser(), "Homepage");
      // listScrollController.animateTo(0.0,
      //duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }
  void _logout(BuildContext context) async {
    await _auth.signOut();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignInPage()));
  }


  String getCurrentUser() {
    if (_auth.currentUser != null) {
      return _auth.currentUser!.uid;
    } else {
      return "";
    }
  }
}
