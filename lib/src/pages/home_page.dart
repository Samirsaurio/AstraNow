import 'package:astranow/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final User? user = Auth().currentUser; //BORRAME SI FALLA

  Future<void> signOut() async { //BORRAME SI FALLA
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hola amigos')),
      body: _body(),
      backgroundColor: Color(int.parse('#09274D'.replaceAll('#', '0xff'))),

    );
  }


  Widget _body()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text('Categorias',
            style: TextStyle(
              color: Color(int.parse('#BCE8FF'.replaceAll('#', '0xff'))),
              fontSize: 40,
              fontFamily: 'Inter'),
          ),
          margin: EdgeInsets.only(left: 20.0),
        ),
        Expanded(
          child: _ListCategories(),
        ),
        _signOutButton(),

      ],
    );
  }

  Widget _ListCategories(){
    return ListView(
      children: [
        _cardTile('HHRR', 'Sldhdhdd'),
        _cardTile('HHRR', 'Sldhdhdd'),
      ],
    );
  }

  Widget _signOutButton(){
    return ElevatedButton(child: Text('Sign out'), onPressed: signOut,);
  }
}



 Widget _cardTile(String _serviceName, String _serviceDesc) //La tarjeta sin la imagen y su información
  {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(bottom: 10.0, right: 20.0, left: 20.0, top: 10.0), //el margin
      elevation: 5.0, //sombrita
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)), //Bordes redondeados
      child: Container(
        height: 80, //altura
        alignment: Alignment.centerRight, //para centrar los elementos
        color: Color(int.parse('#055681'.replaceAll('#', '0xff'))), //backgroundcolor card
        child: ListTile(
          //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 0.0), //Padding
          leading: Icon(Icons.supervised_user_circle, size: 50,color: Color(int.parse('#669ac5'.replaceAll('#', '0xff'))),),
          title: Text(_serviceName, style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Color(int.parse('#80bed9'.replaceAll('#', '0xff')))),),
          subtitle: Text(_serviceDesc, style: TextStyle(fontSize: 10.0, color: Color(int.parse('#80bed9'.replaceAll('#', '0xff'))))),
          trailing: Icon(Icons.arrow_forward_ios, color: Color(int.parse('#6299c5'.replaceAll('#', '0xff'))),),
        ),
      ),
    );
  }