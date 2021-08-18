import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Container(
          padding: EdgeInsets.all(8),
          height: 120,
          color: Colors.lightBlue.shade100,
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/chopper.jpg'),
                radius: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'NGuyễn Phạm Trung Quân',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    Container(
                        child: Image.asset(
                      'images/sex.png',
                      width: 30,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Nam',
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        child: Image.asset(
                      'images/age.png',
                      width: 30,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Text('20',
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                  ])
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'TIN TỨC',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView(
            children: [
              
            ],
          ),
        )
      ],
    ));
  }
}
