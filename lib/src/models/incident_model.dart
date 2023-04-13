class Incidencia {
  final String date;
  final List<MyHistory> history;

  Incidencia({required this.date, required this.history});

  factory Incidencia.fromJson(Map<String, dynamic> json) {
    final historyList = json['history'] as List<dynamic>;
    final history =
        historyList.map((h) => MyHistory.fromJson(h)).toList();
    return Incidencia(date: json['date'], history: history);
  }
}

class MyHistory {
  final String date;
  final String reason;
  final String systemStatus;
  final String status;
  final String incidentNumber;

  MyHistory({
    required this.date,
    required this.reason,
    required this.systemStatus,
    required this.status,
    required this.incidentNumber,
  });

  factory MyHistory.fromJson(Map<String, dynamic> json) {
    return MyHistory(
      date: json['date'],
      reason: json['reason'],
      systemStatus: json['system_status'],
      status: json['status'],
      incidentNumber: json['incident_number'],
    );
  }
}