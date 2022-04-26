import 'package:bjj_guide/Drop%20Down/history.dart';
import 'package:flutter/material.dart';

import '../positions/backControl.dart';
import '../positions/closedGuard.dart';
import '../positions/halfGuard.dart';
import '../positions/mount.dart';
import '../positions/openGuard.dart';
import '../positions/other.dart';
import '../positions/sideControl.dart';

class PositionList extends StatefulWidget {
  const PositionList({Key? key}) : super(key: key);
  @override
  State<PositionList> createState() => _PositionListState();
}

class _PositionListState extends State<PositionList> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Fundamental Positions",
            style: TextStyle(color: Colors.yellow),
          ),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
                title: const Text("Closed Guard"),
                onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ClosedGuard())))),
            ListTile(
                title: const Text("Half Guard"),
                onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HalfGuard())))),
            ListTile(
                title: const Text("Side Control"),
                onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SideControl())))),
            ListTile(
                title: const Text("Mount"),
                onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Mount())))),
            ListTile(
                title: const Text("Back Control"),
                onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BackControl())))),
            ListTile(
                title: const Text("Open Guard"),
                onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OpenGuard())))),
            ListTile(
                title: const Text("Other"),
                onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Other())))),
          ],
        ));
  }
}
