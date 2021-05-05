import 'package:flutter/material.dart';
import 'package:monasafer/cardComponent.dart';
import 'package:monasafer/profitComponent.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Monasafer',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePageReference(),
    );
  }
}

class HomePageReference extends StatefulWidget {
  @override
  _HomePageReferenceState createState() => _HomePageReferenceState();
}

class _HomePageReferenceState extends State<HomePageReference> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: Text(
          "MONASAFER",
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

