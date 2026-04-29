import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modelos/documento_comunicado.dart';

class ServicioDocumentoComunicado {
  static const String urlBase = 'http://10.0.2.2:8080/api';

  Future<List<DocumentoComunicado>> listarVisiblesParaCliente(
    String tramiteId,
  ) async {
    final url = Uri.parse(
      '$urlBase/documentos-comunicados/tramite/$tramiteId/visibles-cliente',
    );

    final respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      final List<dynamic> datos = jsonDecode(utf8.decode(respuesta.bodyBytes));
      return datos.map((item) => DocumentoComunicado.desdeJson(item)).toList();
    }

    throw Exception('No se pudieron consultar los documentos o comunicados.');
  }
}