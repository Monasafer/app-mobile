import 'package:flutter/material.dart';
import 'package:monasafer/profitComponent.dart';
import 'cardComponent.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Monasafer',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'MONASAFER'),
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
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ProfitComponent(),
          CardComponent(
                mount: "70.001",
                backgroundColor: Colors.greenAccent,
                shadowColor: Colors.green),
          CardComponent(
              mount: "50.001",
              backgroundColor: Colors.redAccent,
              shadowColor: Colors.red),
          CardComponent(
              mount: "30.001",
              backgroundColor: Colors.yellow,
              shadowColor: Colors.yellowAccent)
        ],
      ),
    );
  }
}
