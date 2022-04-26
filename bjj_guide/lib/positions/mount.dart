import 'package:bjj_guide/Submissions/americana.dart';
import 'package:bjj_guide/Submissions/armbar.dart';
import 'package:flutter/material.dart';

class Mount extends StatefulWidget {
  const Mount({Key? key}) : super(key: key);

  @override
  State<Mount> createState() => _MountState();
}

class _MountState extends State<Mount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mount",
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
                  'assets/images/Mount1.jpg',
                ),
                Image.asset(
                  'assets/images/Mount2.jpg',
                ),
                Image.asset(
                  'assets/images/khabibMount.jpg',
                ),
              ])),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, //.horizontal
              child: Column(children: <Widget>[
                Text(
                  "Mount is generlly the second most desirable position after back controll in Jiu-jitsu. In MMA, it can be the most desirable position because it allows you to posture up and rain down punches with little chance for your opponent to fight back",
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
                  "Goal: Keep your weight low in order to make it uncomfortable for your opponent and prevent them from bucking you off. Submissions opportunities will appear depending on how your opponent defends. Only give up on top mount if you can take the back or move directly in to a submission",
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
                  "Goal: Frame on your opponents hips and attempt to sweep or regain your guard. Resist the urge to extend your arms out to push them off as it leaves you open to an armbar. There are no submissions or means of controll for you here, so get out as soon as possible.",
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
                TextButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Americana())),
                    child: const Text("Americana")),
                TextButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ArmBar())),
                    child: const Text("Armbar")),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
