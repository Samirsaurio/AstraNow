import 'package:astranow/src/models/incident_model.dart';
import 'package:astranow/src/models/service_model.dart';
import 'package:astranow/src/providers/incident_provider.dart';
import 'package:astranow/src/providers/service_provider.dart';
import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

class IncidentsPage extends StatefulWidget {
  IncidentsPage({Key? key}) : super(key: key);

  @override
  State<IncidentsPage> createState() => _IncidentsPageState();
}

class _IncidentsPageState extends State<IncidentsPage> {
  List<Incidencia> _srvs = [];
  //IO.Socket socket = IO.io('http://10.0.2.2:3001');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Incidencias pasadas')),
      body: _body(),
      backgroundColor: Colors.white,
    );
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.only(left: 25.0),
      child: _ListCategories(),
    );
  }

  Widget _ListCategories() {
    return ListView(
      children: [
        _cardTile('12 de Abril, 2023', 'Sin incidencias reportadas'),
        _cardTile('11 de Abril, 2023', 'Sin incidencias reportadas'),
        _cardTile('10 de Abril, 2023', 'Sin incidencias reportadas'),
        _cardTile('09 de Abril, 2023', 'Hubo un error blablabla'),
      ],
    );
  }

  Widget _cardTile(String _date, String _incidentDesc) {
    return ListTile(
      title: Text(
        _date,
        style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter'),
      ),
      subtitle: Text(_incidentDesc,
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Inter')),
      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
    );
  }

  Widget _listTempCategories() {
    return FutureBuilder(
      future: IncidenciaProvider().getIncidencias().then((srvs) => _srvs = srvs),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          print('Se pudo por ahora' + _srvs.toString());
          return ListView.builder(
            itemCount: null == _srvs ? 0 : _srvs.length,
            itemBuilder: (context, index) {
              Incidencia incidencia = _srvs[index];
              print('Si se pudo');
              return ListTile(title: Text(incidencia.date));
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
      initialData: [],
    );
  }
}
