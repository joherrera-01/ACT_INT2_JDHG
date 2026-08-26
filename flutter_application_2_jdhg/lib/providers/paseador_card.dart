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
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.deepOrange.shade100,
          child: Text(
            paseador.nombre[0],
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.deepOrange,
            ),
          ),
        ),
        title: Text(
          paseador.nombre,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text('${paseador.calificacion} • \$${paseador.precioPorHora}/hr'),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              paseador.experiencia,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
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