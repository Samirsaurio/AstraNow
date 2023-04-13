import 'package:astranow/src/models/service_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServicioProvider {
  Future<List<Servicio>> getServicios() async {
    try {
      const url1 = 'http://10.0.2.2:3001/services/';
      final response = await http
          .get(Uri.parse(url1), headers: {"Accept": "application/json"});
      final decodedData = json.decode(response.body);
      print(decodedData[0]['name']);
      if (200 == response.statusCode) {
        print("No se puede 3");
        List<dynamic> jsonList = decodedData;
        List<Servicio> servicios = [];
        jsonList.forEach((json) {
          Servicio newServ = Servicio(name: json['name'], group: json['group'], current_system_status: json['current_system_status'], history: [], parents: []);
          servicios.add(/*Servicio.fromJson(json)*/ newServ);
        });
        print("Hola");
        return servicios;
      } else
        return [];
    } catch (e) {
      throw (e);
      print("No se puede");
    }
  }
}
