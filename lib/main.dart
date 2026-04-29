import 'package:flutter/material.dart';

import 'pantallas/pantalla_consulta.dart';
import 'servicios/servicio_notificacion.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServicioNotificacion.inicializar();

  runApp(const AplicacionPoliticas());
}

class AplicacionPoliticas extends StatelessWidget {
  const AplicacionPoliticas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP_MOVIL_POLITICAS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const PantallaConsulta(),
    );
  }
}
