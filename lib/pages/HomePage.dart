import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:monasafer/Classes/GastosRest.dart';
import 'package:monasafer/cardComponent.dart';
import 'package:monasafer/profitComponent.dart';
import 'package:http/http.dart' as http;
import 'package:monasafer/CardGastos.dart';

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
      body: Center(
        child: Column(
          children: [
            ProfitComponent(),

            CardComponent(
                mount: "70.001",
                backgroundColor: Colors.greenAccent,
                shadowColor: Colors.green),
            CardGastos(),
            CardComponent(
                mount: "30.001",
                backgroundColor: Colors.yellow,
                shadowColor: Colors.yellowAccent),
          ],
        ),
      ),
    );
  }

  /*List<Widget> _listgastos(List<GastosRest>data){
    List<Widget> gastos = [];
    for(var gasto in data){
      gastos.add(
        Text(gasto.value.toString())
      );
    }
    return gastos;
  }*/

  List<Widget> _listgastos(List<GastosRest>data) {
    List<Widget> gastos = [];
    int count = 0;
    for (var gasto1 in data) {
      count = count + gasto1.value;
    }
    gastos.add(Text(count.toString()));
    /*for (var gasto2 in data) {
      gastos.add(Text(gasto2.value.toString()));
    }*/
      return gastos;
    }
  }   //ESTO SUMA TODITO Y LO METE EN GASTOS





/*FutureBuilder(
future: _listadoGastos,
builder: (context,snapshot){
if(snapshot.hasData){
return ListView(
children: _listgastos(snapshot.data),
);
}else if(snapshot.error){
print(snapshot.error);
return Text("Error");
}
return Center(
child: CircularProgressIndicator(),);
},
),*/


