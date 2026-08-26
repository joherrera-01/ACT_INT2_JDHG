class Paseador {
  final String id;
  final String nombre;
  final double precioPorHora;
  final String telefono;
  final String experiencia;
  final double calificacion;
  final String fotoUrl;
  final List<String> especialidades;
  bool esFavorito;

  Paseador({
    required this.id,
    required this.nombre,
    required this.precioPorHora,
    required this.telefono,
    required this.experiencia,
    required this.calificacion,
    required this.fotoUrl,
    required this.especialidades,
    this.esFavorito = false,
  });
}