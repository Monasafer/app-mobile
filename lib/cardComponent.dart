import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'incomeListComponent.dart';
import 'outputListComponent.dart';

class CardComponent extends StatefulWidget {
  final String mount;
  final Color backgroundColor;
  final Color shadowColor;

  const CardComponent(
      {Key key, this.mount, this.backgroundColor, this.shadowColor})
      : super(key: key);

  @override
  _CardComponentState createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: 340,
      height: 130,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => incomeListComponent()),
          );
        },
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.only(
                topRight: Radius.circular(50), bottomRight: Radius.circular(50))),
        child: Container(
          child: Center(
            child: Text(
              widget.mount,
              textScaleFactor: 3,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
            color: widget.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: widget.shadowColor.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ) // changes position of shadow),
            ],
          ),
        ),
      ),
    );
  }
}