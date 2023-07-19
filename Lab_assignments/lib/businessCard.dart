import 'package:flutter/material.dart';

class businessCard extends StatefulWidget {
  businessCard({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _businessCardState createState() => _businessCardState();
}

class _businessCardState extends State<businessCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Container(
              color: Colors.brown,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 105,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/R.jpg'),
                      radius: 100,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Amany Abdelfattah',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Software Engineer',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2),
                  ),
                  SizedBox(
                      height: 50,
                      width: 200,
                      child: Divider(height: 2.0, color: Colors.amber[200])),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 245, 204, 89),
                      ),
                      title: Text(
                        '+20 1060615283',
                        style: TextStyle(
                            color: Colors.brown, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.mail,
                        color: Color.fromARGB(255, 245, 204, 89),
                      ),
                      title: Text(
                        'aa5182@fayoum.edu.eg',
                        style: TextStyle(
                            color: Colors.brown, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
