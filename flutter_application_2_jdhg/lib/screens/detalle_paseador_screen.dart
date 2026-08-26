import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // PAQUETE EXTERNO
import '../models/paseador_model.dart';
import '../models/paseo_model.dart';
import '../providers/paseos_provider.dart';

class DetallePaseadorScreen extends StatefulWidget {
  final Paseador paseador;

  const DetallePaseadorScreen({super.key, required this.paseador});

  @override
  State<DetallePaseadorScreen> createState() => _DetallePaseadorScreenState();
}

class _DetallePaseadorScreenState extends State<DetallePaseadorScreen> {
  int duracionSeleccionada = 30; // 30 o 60 minutos

  // USO DE PAQUETE EXTERNO: url_launcher para abrir llamadas/WhatsApp
  Future<void> _abrirContacto(String telefono) async {
    final Uri url = Uri.parse('tel:$telefono');
    if (!await launchUrl(url)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo abrir la aplicación de llamadas.')),
        );
      }
    }
  }

  void _confirmarReserva() {
    // ACCIÓN: MOSTRAR ALERTDIALOG
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Confirmar Paseo', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          content: Text(
            '¿Deseas confirmar la solicitud de paseo con ${widget.paseador.nombre} por $duracionSeleccionada minutos?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white),
              onPressed: () {
                Navigator.pop(dialogContext); // Cerrar Dialog

                // SETSTATE: Agregar nuevo paseo
                final nuevoPaseo = Paseo(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  nombreMascota: 'Mi Perro',
                  nombrePaseador: widget.paseador.nombre,
                  fecha: DateTime.now(),
                  duracionMinutos: duracionSeleccionada,
                  total: widget.paseador.precioPorHora * (duracionSeleccionada / 60),
                );

                PaseosDatosBase.misPaseos.add(nuevoPaseo);

                // MOSTRAR SNACKBAR
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('¡Paseo solicitado exitosamente!'),
                    backgroundColor: Colors.green,
                  ),
                );

                Navigator.pop(context); // Volver
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.paseador.nombre, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepOrange,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 15),
            Text(widget.paseador.nombre, style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('⭐ ${widget.paseador.calificacion} / 5.0', style: GoogleFonts.roboto(fontSize: 16, color: Colors.amber.shade900)),
            const SizedBox(height: 15),
            
            // ESPECIALIDADES
            Wrap(
              spacing: 8,
              children: widget.paseador.especialidades
                  .map((e) => Chip(
                        label: Text(e, style: const TextStyle(fontSize: 12)),
                        backgroundColor: Colors.deepOrange.shade50,
                      ))
                  .toList(),
            ),
            const Divider(height: 30),

            // TARIFA Y CONTACTO
            ListTile(
              leading: const Icon(Icons.attach_money, color: Colors.green),
              title: const Text('Precio por hora'),
              subtitle: Text('\$${widget.paseador.precioPorHora.toStringAsFixed(2)} USD', style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.blue),
              title: const Text('Teléfono de Contacto'),
              subtitle: Text(widget.paseador.telefono),
              trailing: IconButton(
                icon: const Icon(Icons.call, color: Colors.green),
                onPressed: () => _abrirContacto(widget.paseador.telefono),
              ),
            ),
            const Divider(height: 30),

            // SELECCIÓN DE DURACIÓN (SETSTATE)
            Text('Selecciona la duración del paseo:', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text('30 minutos'),
                  selected: duracionSeleccionada == 30,
                  selectedColor: Colors.deepOrange.shade200,
                  onSelected: (selected) {
                    if (selected) setState(() => duracionSeleccionada = 30);
                  },
                ),
                const SizedBox(width: 15),
                ChoiceChip(
                  label: const Text('60 minutos'),
                  selected: duracionSeleccionada == 60,
                  selectedColor: Colors.deepOrange.shade200,
                  onSelected: (selected) {
                    if (selected) setState(() => duracionSeleccionada = 60);
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),

            // BOTÓN RESERVAR
            ElevatedButton.icon(
              onPressed: _confirmarReserva,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.calendar_today),
              label: Text('Solicitar Paseo Ahora', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}