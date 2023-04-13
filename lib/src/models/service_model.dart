import 'dart:convert';
List<Servicio> servicioFromJson(String str) => List<Servicio>.from(json.decode(str).map((x) => Servicio.fromJson(x)));

class Servicio{
  String name;
  String group;
  String current_system_status;
  List<String> history;
  List<String> parents;

  Servicio(
    {
    required this.name,
    required this.group,
    required this.current_system_status,
    required this.history,
    required this.parents});

  factory Servicio.fromJson(Map<String, dynamic> json){
    return Servicio(
      name: json['name'],
      group: json['group'],
      current_system_status: json['current_system_status'],
      history: json['history'],
      parents: json['parents'],
    );
  }

}
