import 'package:flutter/material.dart';

class BirthDayCard extends StatefulWidget {
  BirthDayCard({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _BirthDayCardState createState() => _BirthDayCardState();
}

class _BirthDayCardState extends State<BirthDayCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color(0xFFD7766A),
        ),
        body: Container(
          color: Color(0xB56B4E5A),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 500,
                  child: Image(
                      image: AssetImage('assets/images/happybirthday.png')),
                ),
                Container(
                    child: Text(
                  'Happy Birthday !!',
                  style: TextStyle(fontSize: 18, color: Color(0xFF370C0E)),
                )),
              ],
            ),
          ),
        ));
  }
}
