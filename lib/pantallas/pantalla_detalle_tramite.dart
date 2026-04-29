import 'package:flutter/material.dart';
import '../modelos/documento_comunicado.dart';
import '../modelos/tramite.dart';
import '../servicios/servicio_documento_comunicado.dart';
import '../widgets/tarjeta_documento_comunicado.dart';
import '../widgets/tarjeta_seguimiento.dart';

class PantallaDetalleTramite extends StatefulWidget {
  final Tramite tramite;

  const PantallaDetalleTramite({
    super.key,
    required this.tramite,
  });

  @override
  State<PantallaDetalleTramite> createState() => _PantallaDetalleTramiteState();
}

class _PantallaDetalleTramiteState extends State<PantallaDetalleTramite> {
  final ServicioDocumentoComunicado servicioDocumentoComunicado =
      ServicioDocumentoComunicado();

  List<DocumentoComunicado> documentosComunicados = [];
  bool cargandoDocumentos = false;
  String mensajeDocumentos = '';

  @override
  void initState() {
    super.initState();
    cargarDocumentosComunicados();
  }

  Future<void> cargarDocumentosComunicados() async {
    setState(() {
      cargandoDocumentos = true;
      mensajeDocumentos = '';
    });

    try {
      final documentos = await servicioDocumentoComunicado
          .listarVisiblesParaCliente(widget.tramite.id);

      setState(() {
        documentosComunicados = documentos;
        cargandoDocumentos = false;
      });
    } catch (error) {
      setState(() {
        cargandoDocumentos = false;
        mensajeDocumentos = 'No se pudieron cargar documentos o comunicados.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tramite = widget.tramite;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del trámite'),
      ),
      body: RefreshIndicator(
        onRefresh: cargarDocumentosComunicados,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tramite.titulo,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Código: ${tramite.codigo}'),
                    Text('Estado actual: ${tramite.estadoActual}'),
                    Text('Departamento actual: ${tramite.nombreDepartamentoActual}'),
                    Text('Descripción: ${tramite.descripcion}'),
                    Text('Fecha creación: ${tramite.fechaCreacion}'),
                    Text(
                      'Última actualización: ${tramite.fechaUltimaActualizacion}',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Seguimiento por departamento',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            if (tramite.seguimientos.isEmpty)
              const Card(
                child: ListTile(
                  title: Text('No hay seguimiento visible para cliente.'),
                ),
              ),
            ...tramite.seguimientos.map(
              (seguimiento) => TarjetaSeguimiento(
                seguimiento: seguimiento,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Documentos y comunicados visibles',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            if (cargandoDocumentos)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (mensajeDocumentos.isNotEmpty)
              Card(
                child: ListTile(
                  title: Text(mensajeDocumentos),
                ),
              ),
            if (!cargandoDocumentos &&
                mensajeDocumentos.isEmpty &&
                documentosComunicados.isEmpty)
              const Card(
                child: ListTile(
                  title: Text('No hay documentos o comunicados visibles.'),
                ),
              ),
            ...documentosComunicados.map(
              (documentoComunicado) => TarjetaDocumentoComunicado(
                documentoComunicado: documentoComunicado,
              ),
            ),
          ],
        ),
      ),
    );
  }
}