import 'package:flutter/material.dart';

class BasketballPointsCounter extends StatefulWidget {
  BasketballPointsCounter({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _BasketballPointsCounterState createState() =>
      _BasketballPointsCounterState();
}

class _BasketballPointsCounterState extends State<BasketballPointsCounter> {
  int teamAPoints = 0, teamBPoints = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 450,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'TEAM-A',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$teamAPoints',
                            style: const TextStyle(
                              fontSize: 150,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                ++teamAPoints;
                              });
                            },
                            child: Text('+1 POINT',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                shadowColor: Colors.black26,
                                onPrimary: Colors.black,
                                minimumSize: Size(150, 40)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                teamAPoints += 2;
                              });
                            },
                            child: Text('+2 POINTS',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                shadowColor: Colors.black26,
                                onPrimary: Colors.black,
                                minimumSize: Size(150, 40)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                teamAPoints += 3;
                              });
                            },
                            child: Text('+3 POINTS',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                shadowColor: Colors.black26,
                                onPrimary: Colors.black,
                                minimumSize: Size(150, 40)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 450,
                      child: VerticalDivider(
                        thickness: 5,
                        indent: 10,
                      ),
                    ),
                    Container(
                      height: 450,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'TEAM-B',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$teamBPoints',
                            style: const TextStyle(
                              fontSize: 150,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                ++teamBPoints;
                              });
                            },
                            child: Text('+1 POINT',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                shadowColor: Colors.black26,
                                onPrimary: Colors.black,
                                minimumSize: Size(150, 40)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                teamBPoints += 2;
                              });
                            },
                            child: Text('+2 POINTS',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                shadowColor: Colors.black26,
                                onPrimary: Colors.black,
                                minimumSize: Size(150, 40)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                teamBPoints += 3;
                              });
                            },
                            child: Text('+3 POINTS',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                shadowColor: Colors.black26,
                                onPrimary: Colors.black,
                                minimumSize: Size(150, 40)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      teamAPoints = 0;
                      teamBPoints = 0;
                    });
                  },
                  child: Text(
                    'RESET',
                    style: TextStyle(fontSize: 32),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      shadowColor: Colors.black26,
                      onPrimary: Colors.black,
                      minimumSize: Size(150, 50)),
                )
              ],
            ),
          ),
        ));
  }
}
