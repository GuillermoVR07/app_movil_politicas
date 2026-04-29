class SeguimientoTramite {
  final String departamentoId;
  final String nombreDepartamento;
  final String estado;
  final String observacion;
  final String fechaRegistro;
  final bool visibleParaCliente;

  SeguimientoTramite({
    required this.departamentoId,
    required this.nombreDepartamento,
    required this.estado,
    required this.observacion,
    required this.fechaRegistro,
    required this.visibleParaCliente,
  });

  factory SeguimientoTramite.desdeJson(Map<String, dynamic> json) {
    return SeguimientoTramite(
      departamentoId: json['departamentoId'] ?? '',
      nombreDepartamento: json['nombreDepartamento'] ?? '',
      estado: json['estado'] ?? '',
      observacion: json['observacion'] ?? '',
      fechaRegistro: json['fechaRegistro'] ?? '',
      visibleParaCliente: json['visibleParaCliente'] ?? false,
    );
  }
}