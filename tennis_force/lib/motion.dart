import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;
import 'dart:math';

class MyAp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAp> {
  List<double>? accelerometer= [0,0,0];

  List<double>? gyroscope=[0,0,0];
  List<double>?forces;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];
  double _force = 0.0,maxforce=0;
  bool startflag=false,stopflag=false;

  @override
  void initState() {
    _streamSubscriptions.add(userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      if(event!=null)
      {
        double x=double.parse((event.x).toStringAsFixed(4)),y=double.parse((event.y).toStringAsFixed(4)),z=double.parse((event.z).toStringAsFixed(4));
        setState(()
        {
          double f = 0.03 * sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2));
          accelerometer = <double>[x, y,z];
          if(f!=0) {
            f=double.parse(f!.toStringAsFixed(4));
            if(startflag)
            {
              maxforce=max(maxforce,f);
            }
            else if(stopflag)
              {
                  _force=maxforce;
                  stopflag=false;
                  maxforce=0;
              }
          }
        });
      }
    }));
  _streamSubscriptions.add(gyroscopeEvents.listen((event) {
    if(event!=null)
      {
        double x=double.parse((event.x).toStringAsFixed(4)),y=double.parse((event.y).toStringAsFixed(4)),z=double.parse((event.z).toStringAsFixed(4));
        setState(() {
          gyroscope = <double>[x,y,z];
        });
      }

  }));
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    // theme:
    //     ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 26, 134, 5)),
    home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 193, 238, 195),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 146, 214, 148),
        title: const Text('Motion Sensors for tennis'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'images/tennis.jpg',
                width: 350,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Accelerometer',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 5,
              child: Container(
                  color: const Color.fromARGB(255, 220, 241, 220),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Accelerometer of x= ${accelerometer![0]}',
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Text(
                        'Accelerometer of y= ${accelerometer![1]} ',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Text(
                        'Accelerometer of z= ${accelerometer![2]}',
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            const Text(
              'Gyroscope',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              child: Container(
                  color: const Color.fromARGB(255, 220, 241, 220),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        'Gyroscope of x= ${gyroscope![0]}',
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(3),
                      ),
                      Text(
                        'Gyroscope of y= ${gyroscope![1]}',
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(3),
                      ),
                      Text(
                        'Gyroscope of z= ${gyroscope![2]}',
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            Text(
              'Force= $_force ',
              style: const TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 146, 214, 148),
                    foregroundColor: Colors.black,
                      fixedSize: const Size(100, 50),
                  ),

                  onPressed: (){
                    setState(() {
                      stopflag = false;
                      startflag = true;
                    });
                  },
                  child: const Text("start",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                ),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 146, 214, 148),
                    foregroundColor: Colors.black,
                    fixedSize: const Size(100, 50),
                  ),
                    onPressed: (){
                      setState(() {
                        stopflag = true;
                        startflag = false;
                      });
                    },
                    child: const Text("stop",style:
                    TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24),),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
}
