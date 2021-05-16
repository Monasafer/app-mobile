import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:monasafer/Classes/GastosRest.dart';
import 'package:monasafer/cardComponent.dart';
import 'package:monasafer/profitComponent.dart';
import 'package:http/http.dart' as http;

class OutputList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Monasafer',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: OutputListReference(),
    );
  }
}

class OutputListReference extends StatefulWidget {
  @override
  _OutputListReferenceState createState() => _OutputListReferenceState();
}

class _OutputListReferenceState extends State<OutputListReference> {
  Future<List<GastosRest>> _listadoGastos; //Listado de gastos
  Future<List<GastosRest>> _getDatosG() async {
    final response = await http.get(Uri.parse("https://monasafer-bff-core.herokuapp.com/expend"));
    List<GastosRest> gastos =[];
    if(response.statusCode==200){    //Verificar que la peticion devolvio informacion valida
      String body = utf8.decode(response.bodyBytes);
      final jsonGastos = jsonDecode(body);
      for (var item in jsonGastos){
        gastos.add(
            GastosRest(item["expen_descr"],item["expen_value"],item["expen_user_id"],)
        );
      }
      return gastos;
    } else {
      throw Exception("Error: DataBase Connection");
    }
  }
  @override
  void initState() {
    super.initState();
    _listadoGastos = _getDatosG();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: Text(
          "GASTOS",
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _listadoGastos,
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return ListView(
              children: _listgastos(snapshot.data),
            );
          }else{
            return Center(child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.brown,
              ),
            ));
          }
        },
      ),
    );
  }

  List<Widget> _listgastos(List<GastosRest>data) {
    List<Widget> gastos = [];
    for (var gasto in data) {
      gastos.add(Card(
          child: Column(
            children: [
              Text("Tipo de gasto: " + gasto.descripcion),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8.0),
                child: Text(gasto.value.toString(),
                ),
              ),
            ],
          )));
    }
    return gastos;
  }
}

/*builder: (context,snapshot){
if(snapshot.hasData){
return ListView(
children: _listgastos(snapshot.data),
);
}else if(snapshot.error){
return Center(
child: CircularProgressIndicator(),);
}
return Center(
child: CircularProgressIndicator(),);
},*/
