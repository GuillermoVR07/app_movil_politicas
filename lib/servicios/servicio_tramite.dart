import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modelos/tramite.dart';

class ServicioTramite {
  static const String urlBase = 'http://10.0.2.2:8080/api';

  Future<List<Tramite>> buscarTramitesPorCiudadano(
    String identificacionCiudadano,
  ) async {
    final url = Uri.parse(
      '$urlBase/tramites/ciudadano/$identificacionCiudadano',
    );

    final respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      final List<dynamic> datos = jsonDecode(utf8.decode(respuesta.bodyBytes));
      return datos.map((item) => Tramite.desdeJson(item)).toList();
    }

    throw Exception('No se pudieron consultar los trámites del ciudadano.');
  }
}