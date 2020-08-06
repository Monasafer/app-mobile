import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monasafer',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Monasafer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: 450,
            height: 50,
            child: const Center(
              child: Text(
                'Safe 78.000',
                textScaleFactor: 1.8,
                style: TextStyle(color: Colors.black),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: Colors.yellow,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ) // changes position of shadow),
              ],
            ),
          ),
          Container(
            width: 340,
            height: 140,
            margin: EdgeInsets.only(top: 30),
            child: const Center(
              child: Text(
                '78.000',
                textScaleFactor: 3,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: Colors.greenAccent,
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ) // changes position of shadow),
              ],
            ),
          ),
          Container(
            width: 340,
            height: 140,
            margin: EdgeInsets.only(top: 30),
            child: const Center(
              child: Text(
                '48.000',
                textScaleFactor: 3,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: Colors.redAccent,
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ) // changes position of shadow),
              ],
            ),
          ),
          Container(
            width: 340,
            height: 140,
            margin: EdgeInsets.only(top: 30),
            child: const Center(
              child: Text(
                '30.000',
                textScaleFactor: 3,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: Colors.yellow,
              boxShadow: [
                BoxShadow(
                  color: Colors.yellowAccent.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ) // changes position of shadow),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
