import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class savingListComponent extends StatefulWidget {
  @override
  _savingListComponentState createState() => _savingListComponentState();
}

class _savingListComponentState extends State<savingListComponent> {
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
