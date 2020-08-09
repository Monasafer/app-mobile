import 'package:flutter/material.dart';
import 'package:monasafer/profitComponent.dart';
import 'cardComponent.dart';

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
