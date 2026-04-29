import 'dart:convert';

import 'package:http/http.dart' as http;

import '../configuracion/configuracion_api.dart';

class ServicioCliente {
  static const String urlBase = ConfiguracionApi.urlBase;

  Future<void> registrarToken({
    required String identificacionCiudadano,
    required String tokenNotificacionMovil,
  }) async {
    final url = Uri.parse('$urlBase/clientes/registrar-token');

    final respuesta = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'identificacionCiudadano': identificacionCiudadano,
        'tokenNotificacionMovil': tokenNotificacionMovil,
      }),
    );

    if (respuesta.statusCode != 200) {
      throw Exception('No se pudo registrar el token de notificación.');
    }
  }
}
