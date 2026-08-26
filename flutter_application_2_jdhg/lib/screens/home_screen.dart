import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'paseadores_screen.dart';
import 'mis_paseos_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaseoCanino', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.deepOrange.shade50, borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.deepOrange,
                    child: Icon(Icons.pets, color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('¡Bienvenido a PaseoCanino!', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('Encuentra el paseador ideal para tu perro.', style: GoogleFonts.roboto(fontSize: 13, color: Colors.black60)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // Tarjetas de navegación principal (GridView)
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: [
                _crearTarjetaOpcion(
                  context: context,
                  titulo: 'Buscar Paseadores',
                  icono: Icons.search,
                  color: Colors.deepOrange,
                  onTap: () {
                    // NAVEGACIÓN MEDIANTE NAVIGATOR
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PaseadoresScreen()),
                    );
                  },
                ),
                _crearTarjetaOpcion(
                  context: context,
                  titulo: 'Mis Paseos',
                  icono: Icons.history,
                  color: Colors.teal,
                  onTap: () {
                    // NAVEGACIÓN MEDIANTE NAVIGATOR
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MisPaseosScreen()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 25),
            
            const Divider(),
            const SizedBox(height: 15),

            // Banner Informativo
            Card(
              elevation: 2,
              color: Colors.orange.shade50,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.shield, color: Colors.deepOrange, size: 36),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        'Todos nuestros paseadores están verificados y cuentan con seguro de accidentes.',
                        style: GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearTarjetaOpcion({
    required BuildContext context,
    required String titulo,
    required IconData icono,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icono, size: 48, color: color),
            const SizedBox(height: 12),
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }
}