
import 'package:flutter/material.dart';
import 'HomePage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPageReference(),);
  }
}

class LoginPageReference extends StatefulWidget {
  @override
  _LoginPageReferenceState createState() => _LoginPageReferenceState();
}

class _LoginPageReferenceState extends State<LoginPageReference> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:cuerpo(context)),
    );
  }
}
Widget cuerpo(BuildContext context){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage("https://wallpaperaccess.com/full/1584568.jpg"),
      fit: BoxFit.cover,)
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 200),
          SignIn(),
          SizedBox(height:5),
          CampoID(),
          CampoPass(),
          EntryButton(context),
        ],
      ),
    ),
  );
}
Widget SignIn(){
  return Text(
    "SIGN IN",
    style: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 2.0,
    ),
  );
}
Widget CampoID(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
    child: TextField(
      decoration: InputDecoration(
        hintText: "User ID",
        fillColor: Colors.grey[100],
        filled: true,
      ),
    ),
  );
}
Widget CampoPass(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        fillColor: Colors.grey[100],
        filled: true,
      ),
    ),
  );
}



Widget EntryButton(BuildContext context){
  return FlatButton(
    color: Colors.brown[600],
      onPressed:(){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> HomePage()));
      },
      child: Text("INGRESAR",
      style: TextStyle(
        letterSpacing: 2.0,
        color: Colors.white
      ),));
}



