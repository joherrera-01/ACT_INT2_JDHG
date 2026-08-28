import 'paseador_model.dart';

class Paseo {
  final String id;
  final Paseador paseador;
  final String nombreMascota;
  final DateTime fechaHora;
  final int duracionHoras;
  final double costoTotal;

  Paseo({
    required this.id,
    required this.paseador,
    required this.nombreMascota,
    required this.fechaHora,
    required this.duracionHoras,
    required this.costoTotal,
  });
}