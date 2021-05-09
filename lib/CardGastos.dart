import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/OutputList.dart';
import 'incomeListComponent.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class CardGastos extends StatefulWidget {
  final String mount;
  final Color backgroundColor;
  final Color shadowColor;

  const CardGastos(
      {Key key, this.mount, this.backgroundColor, this.shadowColor})
      : super(key: key);

  @override
  _CardComponentState createState() => _CardComponentState();
}

class _CardComponentState extends State<CardGastos> {
  Future _gastototal; //Listado de gastos
  Future _getDatosG() async {
    final response = await http.get(Uri.parse("https://monasafer-bff-core.herokuapp.com/expend"));
    if(response.statusCode==200){    //Verificar que la peticion devolvio informacion valida
      String body = utf8.decode(response.bodyBytes);
      final jsonGastos = jsonDecode(body);
      int total= 0;
      for (var item in jsonGastos){
        total = total + item["expen_value"];
      }
      return total;
    } else {
      throw Exception("Error: DataBase Connection");
    }
  }
  @override
  void initState() {
    super.initState();
    _gastototal = _getDatosG();
    print(_gastototal);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _gastototal,
      builder: (context,snapshot){
        if (snapshot.connectionState==ConnectionState.done){
          return Container(
            margin: EdgeInsets.only(top: 30),
            width: 340,
            height: 130,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OutputList()),
                );
              },
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.only(
                      topRight: Radius.circular(50), bottomRight: Radius.circular(50))),
              child: Container(
                child: Center(
                  child: Text(
                    snapshot.data.toString(),
                    textScaleFactor: 3,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ) // changes position of shadow),
                  ],
                ),
              ),
            ),
          );;
        }else{
          return Center(child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              backgroundColor: Colors.brown,
            ),
          ));
        }
        }
    );
  }
}


//snapshot.data.toString()