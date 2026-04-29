import 'package:flutter/material.dart';

import '../modelos/tramite.dart';
import '../servicios/servicio_cliente.dart';
import '../servicios/servicio_notificacion.dart';
import '../servicios/servicio_tramite.dart';
import 'pantalla_lista_tramites.dart';

class PantallaConsulta extends StatefulWidget {
  const PantallaConsulta({super.key});

  @override
  State<PantallaConsulta> createState() => _PantallaConsultaState();
}

class _PantallaConsultaState extends State<PantallaConsulta> {
  final TextEditingController controladorIdentificacion =
      TextEditingController();

  final ServicioTramite servicioTramite = ServicioTramite();
  final ServicioCliente servicioCliente = ServicioCliente();

  bool cargando = false;
  String mensaje = '';

  Future<void> consultarTramites() async {
    final identificacion = controladorIdentificacion.text.trim();

    if (identificacion.isEmpty) {
      setState(() {
        mensaje = 'Debe ingresar su identificación de ciudadano.';
      });
      return;
    }

    setState(() {
      cargando = true;
      mensaje = '';
    });

    await registrarTokenSinBloquearConsulta(identificacion);

    try {
      final List<Tramite> tramites = await servicioTramite
          .buscarTramitesPorCiudadano(identificacion);

      if (!mounted) return;

      if (tramites.isEmpty) {
        setState(() {
          mensaje =
              'No se encontraron trámites asociados a esta identificación.';
          cargando = false;
        });
        return;
      }

      setState(() {
        cargando = false;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PantallaListaTramites(
            identificacionCiudadano: identificacion,
            tramites: tramites,
          ),
        ),
      );
    } catch (error) {
      if (!mounted) return;

      setState(() {
        cargando = false;
        mensaje =
            'No se pudo consultar el trámite. Verifique que el backend esté activo y que la identificación sea correcta.';
      });
    }
  }

  Future<void> registrarTokenSinBloquearConsulta(String identificacion) async {
    try {
      final String? token = ServicioNotificacion.obtenerToken();

      if (token == null || token.isEmpty) {
        debugPrint('No hay token FCM disponible todavía.');
        return;
      }

      await servicioCliente.registrarToken(
        identificacionCiudadano: identificacion,
        tokenNotificacionMovil: token,
      );

      debugPrint('Token registrado correctamente para $identificacion.');
    } catch (error) {
      debugPrint(
        'No se pudo registrar el token, pero se continuará con la consulta: $error',
      );
    }
  }

  @override
  void dispose() {
    controladorIdentificacion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('APP_MOVIL_POLITICAS')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.assignment, size: 80),
            const SizedBox(height: 16),
            const Text(
              'Consulta de trámites',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Ingrese su identificación de ciudadano para consultar sus trámites.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controladorIdentificacion,
              decoration: const InputDecoration(
                labelText: 'Identificación de ciudadano',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: cargando ? null : consultarTramites,
                child: cargando
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Consultar trámites'),
              ),
            ),
            const SizedBox(height: 16),
            if (mensaje.isNotEmpty) Text(mensaje, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
