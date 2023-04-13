import 'package:astranow/src/models/incident_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IncidenciaProvider {
  Future<List<Incidencia>> getIncidencias() async {
    try {
      const url2 = 'http://10.0.2.2:3001/services/dateHistory/';
      final response = await http.get(Uri.parse(url2), headers: {"Accept": "application/json"});
      final decodedData = json.decode(response.body);
      print(decodedData[0]['history']);
      if (200 == response.statusCode) {
        print("No se puede 3");
        List<dynamic> jsonList = decodedData;
        List<Incidencia> incidencias = [];
        jsonList.forEach((json) {
          Incidencia newServ = Incidencia(date: json['date'], history: json['history']);
          incidencias.add(/*Servicio.fromJson(json)*/ newServ);
        });
        print("Hola");
        return incidencias;
      } else
        return [];
    } catch (e) {
      throw (e);
      print("No se puede");
    }
  }
}