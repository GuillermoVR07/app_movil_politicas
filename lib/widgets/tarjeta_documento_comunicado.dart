import 'package:flutter/material.dart';
import '../modelos/documento_comunicado.dart';

class TarjetaDocumentoComunicado extends StatelessWidget {
  final DocumentoComunicado documentoComunicado;

  const TarjetaDocumentoComunicado({
    super.key,
    required this.documentoComunicado,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.description),
        title: Text(documentoComunicado.nombre),
        subtitle: Text(
          'Tipo: ${documentoComunicado.tipo}\n'
          'Departamento: ${documentoComunicado.nombreDepartamento}\n'
          'Descripción: ${documentoComunicado.descripcion}\n'
          'Fecha: ${documentoComunicado.fechaRegistro}',
        ),
        isThreeLine: true,
      ),
    );
  }
}