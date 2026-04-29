import 'package:flutter/material.dart';
import '../modelos/tramite.dart';
import '../widgets/tarjeta_tramite.dart';
import 'pantalla_detalle_tramite.dart';

class PantallaListaTramites extends StatelessWidget {
  final String identificacionCiudadano;
  final List<Tramite> tramites;

  const PantallaListaTramites({
    super.key,
    required this.identificacionCiudadano,
    required this.tramites,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis trámites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              'Identificación: $identificacionCiudadano',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text('Trámites encontrados: ${tramites.length}'),
            const SizedBox(height: 12),
            ...tramites.map(
              (tramite) => TarjetaTramite(
                tramite: tramite,
                alPresionar: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PantallaDetalleTramite(
                        tramite: tramite,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}