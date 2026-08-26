import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/paseos_provider.dart';

class MisPaseosScreen extends StatefulWidget {
  const MisPaseosScreen({super.key});

  @override
  State<MisPaseosScreen> createState() => _MisPaseosScreenState();
}

class _MisPaseosScreenState extends State<MisPaseosScreen> {
  @override
  Widget build(BuildContext context) {
    final paseos = PaseosDatosBase.misPaseos;

    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de Paseos', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: paseos.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history, size: 80, color: Colors.grey.shade400),
                  const SizedBox(height: 15),
                  Text('Aún no has contratado ningún paseo.', style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey.shade600)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: paseos.length,
              itemBuilder: (context, index) {
                final paseo = paseos[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.directions_walk, color: Colors.white),
                    ),
                    title: Text('Paseador: ${paseo.nombrePaseador}', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                    subtitle: Text('Duración: ${paseo.duracionMinutos} min • Total: \$${paseo.total.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () {
                        // SETSTATE: Eliminar elemento de la lista
                        setState(() {
                          paseos.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Paseo cancelado / eliminado')),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}