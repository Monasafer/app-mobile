import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class outputListComponent extends StatefulWidget {
  @override
  _outputListComponentState createState() => _outputListComponentState();
}

class _outputListComponentState extends State<outputListComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
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
