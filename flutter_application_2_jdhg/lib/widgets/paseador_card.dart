import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/paseador_model.dart';

class PaseadorCard extends StatelessWidget {
  final Paseador paseador;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const PaseadorCard({
    super.key,
    required this.paseador,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        // FOTO REDONDA Y PEQUEÑA ROBUSTA
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(30), // Formato totalmente redondo
          child: Container(
            width: 50,
            height: 50,
            color: Colors.deepOrange.shade100,
            child: Image.network(
              paseador.fotoUrl,
              fit: BoxFit.cover,
              // Muestra un indicador mientras descarga la foto
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.deepOrange),
                  ),
                );
              },
              // Si falla la red, muestra un ícono de respaldo sin romper la app
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text(
                    paseador.nombre[0],
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                      fontSize: 18,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        title: Text(
          paseador.nombre,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 3),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 15),
                const SizedBox(width: 4),
                Text(
                  '${paseador.calificacion} • \$${paseador.precioPorHora.toStringAsFixed(2)}/hr',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              paseador.experiencia,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            paseador.esFavorito ? Icons.favorite : Icons.favorite_border,
            color: paseador.esFavorito ? Colors.red : Colors.grey,
          ),
          onPressed: onFavoriteToggle,
        ),
        onTap: onTap,
      ),
    );
  }
}