class Paseo {
  final String id;
  final String nombreMascota;
  final String nombrePaseador;
  final DateTime fecha;
  final int duracionMinutos;
  final double total;
  String estado; // 'Pendiente', 'En Curso', 'Completado'

  Paseo({
    required this.id,
    required this.nombreMascota,
    required this.nombrePaseador,
    required this.fecha,
    required this.duracionMinutos,
    required this.total,
    this.estado = 'Pendiente',
  });
}