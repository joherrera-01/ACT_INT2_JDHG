import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/paseos_provider.dart';

class MisPaseosScreen extends StatefulWidget {
  const MisPaseosScreen({super.key});

  @override
  State<MisPaseosScreen> createState() => _MisPaseosScreenState();
}

class _MisPaseosScreenState extends State<MisPaseosScreen> {
  // Función para confirmar y cancelar la reserva
  void _confirmarEliminacion(int index) {
    final paseo = PaseosDatosBase.misPaseos[index];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Cancelar Reserva',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          content: Text(
            '¿Estás seguro de que deseas cancelar la reserva del paseo para ${paseo.nombreMascota} con ${paseo.paseador.nombre}?',
            style: GoogleFonts.poppins(fontSize: 14),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'No, conservar',
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                setState(() {
                  PaseosDatosBase.misPaseos.removeAt(index);
                });
                Navigator.of(context).pop();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Reserva cancelada correctamente 🐾'),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              },
              child: Text(
                'Sí, cancelar',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final paseos = PaseosDatosBase.misPaseos;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Paseos Reservados',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: paseos.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.pets_outlined,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Aún no tienes paseos programados',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: paseos.length,
              itemBuilder: (context, index) {
                final paseo = paseos[index];
                final fechaFormateada =
                    '${paseo.fechaHora.day}/${paseo.fechaHora.month}/${paseo.fechaHora.year} ${paseo.fechaHora.hour.toString().padLeft(2, '0')}:${paseo.fechaHora.minute.toString().padLeft(2, '0')}';

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.deepOrange.shade100,
                        child: Image.network(
                          paseo.paseador.fotoUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Text(
                                paseo.paseador.nombre[0],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    title: Text(
                      'Paseador: ${paseo.paseador.nombre}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text('Mascota: ${paseo.nombreMascota}'),
                        Text('Fecha: $fechaFormateada'),
                        Text(
                          'Duración: ${paseo.duracionHoras} hr(s) • Total: \$${paseo.costoTotal.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.deepOrange.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // BOTÓN PARA CANCELAR / ELIMINAR LA RESERVA
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.redAccent,
                      ),
                      tooltip: 'Cancelar Reserva',
                      onPressed: () => _confirmarEliminacion(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}