import 'dart:convert';
import 'package:app_reservas/utils/utils.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future login(String correo, String password) async {
    final String apiUrl =
        'http://192.168.0.13:8081/reservas/public/api/login'; // URL de la API

    try {
      // Crear el cuerpo de la solicitud
      final Map<String, dynamic> requestBody = {
        'correo': correo,
        'password': password,
      };
      print('BODY $requestBody');
      // Realizar la solicitud POST
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );
      print('RESPUESTA $response');
      // Comprobar si la respuesta es exitosa
      if (response.statusCode == 200) {
        // Decodificar la respuesta JSON
        final Map<String, dynamic> data = json.decode(response.body);
        // Manejar los datos del login

        print('Login successful: ${data['message']}');

        return data;
      } else {
        // Manejar el error de la respuesta
        final Map<String, dynamic> data = json.decode(response.body);
        print('fallo al goguearse: ${response.statusCode}');
        print('Errordel boddy: ${data}');
        return data;
      }
    } catch (e) {
      // Manejar cualquier error durante la solicitud
      print('Error: $e');
    }
  }
}
