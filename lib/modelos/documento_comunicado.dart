class DocumentoComunicado {
  final String id;
  final String tramiteId;
  final String tipo;
  final String nombre;
  final String descripcion;
  final String departamentoId;
  final String nombreDepartamento;
  final bool visibleParaCliente;
  final String fechaRegistro;

  DocumentoComunicado({
    required this.id,
    required this.tramiteId,
    required this.tipo,
    required this.nombre,
    required this.descripcion,
    required this.departamentoId,
    required this.nombreDepartamento,
    required this.visibleParaCliente,
    required this.fechaRegistro,
  });

  factory DocumentoComunicado.desdeJson(Map<String, dynamic> json) {
    return DocumentoComunicado(
      id: json['id'] ?? '',
      tramiteId: json['tramiteId'] ?? '',
      tipo: json['tipo'] ?? '',
      nombre: json['nombre'] ?? '',
      descripcion: json['descripcion'] ?? '',
      departamentoId: json['departamentoId'] ?? '',
      nombreDepartamento: json['nombreDepartamento'] ?? '',
      visibleParaCliente: json['visibleParaCliente'] ?? false,
      fechaRegistro: json['fechaRegistro'] ?? '',
    );
  }
}