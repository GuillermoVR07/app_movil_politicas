import 'seguimiento_tramite.dart';

class Tramite {
  final String id;
  final String codigo;
  final String titulo;
  final String descripcion;
  final String identificacionCiudadano;
  final String procesoId;
  final String estadoActual;
  final String departamentoActualId;
  final String nombreDepartamentoActual;
  final String fechaCreacion;
  final String fechaUltimaActualizacion;
  final List<SeguimientoTramite> seguimientos;

  Tramite({
    required this.id,
    required this.codigo,
    required this.titulo,
    required this.descripcion,
    required this.identificacionCiudadano,
    required this.procesoId,
    required this.estadoActual,
    required this.departamentoActualId,
    required this.nombreDepartamentoActual,
    required this.fechaCreacion,
    required this.fechaUltimaActualizacion,
    required this.seguimientos,
  });

  factory Tramite.desdeJson(Map<String, dynamic> json) {
    final listaSeguimientos = json['seguimientos'] as List<dynamic>? ?? [];

    return Tramite(
      id: json['id'] ?? '',
      codigo: json['codigo'] ?? '',
      titulo: json['titulo'] ?? '',
      descripcion: json['descripcion'] ?? '',
      identificacionCiudadano: json['identificacionCiudadano'] ?? '',
      procesoId: json['procesoId'] ?? '',
      estadoActual: json['estadoActual'] ?? '',
      departamentoActualId: json['departamentoActualId'] ?? '',
      nombreDepartamentoActual: json['nombreDepartamentoActual'] ?? '',
      fechaCreacion: json['fechaCreacion'] ?? '',
      fechaUltimaActualizacion: json['fechaUltimaActualizacion'] ?? '',
      seguimientos: listaSeguimientos
          .map((item) => SeguimientoTramite.desdeJson(item))
          .where((item) => item.visibleParaCliente)
          .toList(),
    );
  }
}