import 'package:flutter/material.dart';
import '../modelos/tramite.dart';

class TarjetaTramite extends StatelessWidget {
  final Tramite tramite;
  final VoidCallback alPresionar;

  const TarjetaTramite({
    super.key,
    required this.tramite,
    required this.alPresionar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(tramite.titulo),
        subtitle: Text(
          'Código: ${tramite.codigo}\n'
          'Estado: ${tramite.estadoActual}\n'
          'Departamento: ${tramite.nombreDepartamentoActual}',
        ),
        isThreeLine: true,
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: alPresionar,
      ),
    );
  }
}