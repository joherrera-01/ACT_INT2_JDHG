import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/paseos_provider.dart';
import '../widgets/paseador_card.dart';
import 'detalle_paseador_screen.dart';

class PaseadoresScreen extends StatefulWidget {
  const PaseadoresScreen({super.key});

  @override
  State<PaseadoresScreen> createState() => _PaseadoresScreenState();
}

class _PaseadoresScreenState extends State<PaseadoresScreen> {
  bool mostrarSoloFavoritos = false;

  @override
  Widget build(BuildContext context) {
    // FILTRADO DINÁMICO DE DATOS
    final lista = mostrarSoloFavoritos
        ? PaseosDatosBase.listaPaseadores.where((p) => p.esFavorito).toList()
        : PaseosDatosBase.listaPaseadores;

    return Scaffold(
      appBar: AppBar(
        title: Text('Paseadores Disponibles', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          // INTERACCIÓN CON SETSTATE: Filtrar favoritos
          IconButton(
            icon: Icon(
              mostrarSoloFavoritos ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                mostrarSoloFavoritos = !mostrarSoloFavoritos;
              });

              // ACCIÓN: MOSTRAR SNACKBAR
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(mostrarSoloFavoritos ? 'Mostrando favoritos' : 'Mostrando todos los paseadores'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // BUSCADOR / ENCABEZADO
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 10),
                  Text('Filtro: ${mostrarSoloFavoritos ? "Solo Favoritos" : "Todos los disponibles"}', style: TextStyle(color: Colors.grey.shade700)),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // LISTVIEW DE PASEADORES
            Expanded(
              child: lista.isEmpty
                  ? Center(
                      child: Text('No hay paseadores en esta categoría.', style: GoogleFonts.poppins(fontSize: 14)),
                    )
                  : ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, index) {
                        final paseador = lista[index];
                        return PaseadorCard(
                          paseador: paseador,
                          onTap: () {
                            // NAVEGACIÓN A PANTALLA DETALLE
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetallePaseadorScreen(paseador: paseador),
                              ),
                            ).then((_) => setState(() {})); // Recargar cambios al volver
                          },
                          onFavoriteToggle: () {
                            // FUNCIONALIDAD CON SETSTATE: Cambiar estado de favorito
                            setState(() {
                              paseador.esFavorito = !paseador.esFavorito;
                            });
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}