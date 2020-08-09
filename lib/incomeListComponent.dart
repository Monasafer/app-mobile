import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class incomeListComponent extends StatefulWidget {
  @override
  _incomeListComponentState createState() => _incomeListComponentState();
}

class _incomeListComponentState extends State<incomeListComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Income"),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
