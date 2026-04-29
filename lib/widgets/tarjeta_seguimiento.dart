import 'package:flutter/material.dart';
import '../modelos/seguimiento_tramite.dart';

class TarjetaSeguimiento extends StatelessWidget {
  final SeguimientoTramite seguimiento;

  const TarjetaSeguimiento({
    super.key,
    required this.seguimiento,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.timeline),
        title: Text(seguimiento.nombreDepartamento),
        subtitle: Text(
          'Estado: ${seguimiento.estado}\n'
          'Observación: ${seguimiento.observacion}\n'
          'Fecha: ${seguimiento.fechaRegistro}',
        ),
        isThreeLine: true,
      ),
    );
  }
}