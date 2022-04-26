import 'package:flutter/material.dart';
class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);
 
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("History",
        style: TextStyle(
          color: Colors.yellow
        ),),

      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0, 0.0),
                child: Image.asset(
                  'assets/images/gracieFamilyTree.jpg',
                  //height: 250.0,
                  //width: itemWidth*1.25,
                )),
            const Padding(
              padding: EdgeInsets.all(4.0),
            ),
             Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical, //.horizontal
                child: Column(
              
                  children:const <Widget>[
                    Text(
                "The Gracie Family",
                style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
                    Text( 
                  "In 1916, the Italian-Argentine Queirolo Brothers staged circus shows in Brazil and presented Mitsuyo Maeda, " +
                  "a Japanese judoka and prize fighter. Gastão Gracie of Rio de Janeiro was responsible for helping Maeda establish " +
                  "a Japanese community in Brazil. In 1917, Carlos Gracie(pictured back middle left), the eldest son of Gastão Gracie, watched " + 
                  "a demonstration by Mitsuyo Maeda at the Da Paz Theatre and decided to learn judo. Mitsuyo Maeda " +
                  "thus accepted to teach Gastão's son Carlos as a thank you to Gastão for helping him get settled. " +
                  "In 1921, however, following financial hardship and his own father Pedro's demise, " +
                  "Gastão Gracie returned to Rio de Janeiro with his family. Maeda's teachings were then passed on " +
                  "through local Rio de Janeiro coaches to Carlos and brothers Oswaldo, Gastão Jr., George, and Hélio(pictured back middle right). " +
                  "Hélio successfully learned the art of Jiu Jitsu by watching his older brothers train, but due to his fragile condition, Hélio learned to use leverage " +
                  "and specific body movements to successfully submit his opponents instead of using pure strength." +
                  "Therefore, Hélio Gracie is considered the man responsible for developing Brazilian jiu-jitsu into what it is today.",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
          ]),
            ),
             )],
        ));
  }
}
