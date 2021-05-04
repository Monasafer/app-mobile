import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfitComponent extends StatefulWidget {
  @override
  _ProfitComponentState createState() => _ProfitComponentState();
}

class _ProfitComponentState extends State<ProfitComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 45,
      child: const Center(
        child: Text(
          'Safe 78.000',
          textScaleFactor: 1.6,
          style: TextStyle(color: Colors.black),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50)),
        color: Colors.amberAccent,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ) // changes position of shadow),
        ],
      ),
    );
  }
}
