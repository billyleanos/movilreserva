import 'dart:convert';
import 'package:app_reservas/utils/utils.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<Map<DateTime, List<Event>>> reservasPorFechas() async {
  final response = await http.get(Uri.parse(
      'http://192.168.0.13:8081/reservas/public/api/reservas-por-fecha'));
  print(response);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    return parseEvents(data);
    // final List<dynamic> body = jsonDecode(response.body);
    // final Map<DateTime, List<Event>> events = {};
  } else {
    throw Exception('fallo al cargar los eventos');
  }
}

Map<DateTime, List<Event>> parseEvents(Map<String, dynamic> data) {
  final events = <DateTime, List<Event>>{};
  data['reservas'].forEach((key, value) {
    final date = DateTime.parse(key);
    final eventList = (value as List).map((e) => Event(e['title'], e['description'])).toList();
    events[date] = eventList;
  });
  return events;
}
}


