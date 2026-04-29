import 'dart:convert';
import 'package:http/http.dart' as http;

class ServicioCliente {
  static const String urlBase = 'http://localhost:8080/api';

  Future<void> registrarToken({
    required String identificacionCiudadano,
    required String tokenNotificacionMovil,
  }) async {
    final url = Uri.parse('$urlBase/clientes/registrar-token');

    await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'identificacionCiudadano': identificacionCiudadano,
        'tokenNotificacionMovil': tokenNotificacionMovil,
      }),
    );
  }
}
