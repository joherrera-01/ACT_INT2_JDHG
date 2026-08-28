import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
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
  // Función para realizar llamadas telefónicas
  Future<void> _abrirContacto(String telefono) async {
    final Uri url = Uri.parse('tel:$telefono');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No se pudo abrir la aplicación de llamadas.'),
          ),
        );
      }
    }
  }

  // Modal para solicitar el paseo con la foto del paseador integrada
  void _mostrarModalSolicitarPaseo() {
    final nombreMascotaController = TextEditingController();
    DateTime fechaSeleccionada = DateTime.now();
    TimeOfDay horaSeleccionada = TimeOfDay.now();
    int duracionHoras = 1;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            final double totalPagar = widget.paseador.precioPorHora * duracionHoras;

            return Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    
                    // HEADER DEL MODAL CON LA FOTO REDONDA DEL PASEADOR
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.deepOrange.shade100,
                            child: Image.network(
                              widget.paseador.fotoUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Text(
                                    widget.paseador.nombre[0],
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
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Solicitar Paseo',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Con ${widget.paseador.nombre}',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 25),

                    // Campo: Nombre de la mascota
                    TextField(
                      controller: nombreMascotaController,
                      decoration: InputDecoration(
                        labelText: 'Nombre de tu mascota',
                        prefixIcon: const Icon(Icons.pets, color: Colors.deepOrange),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Selección de Fecha y Hora
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            icon: const Icon(Icons.calendar_today, size: 18),
                            label: Text(
                              '${fechaSeleccionada.day}/${fechaSeleccionada.month}/${fechaSeleccionada.year}',
                            ),
                            onPressed: () async {
                              final picked = await showDatePicker(
                                context: context,
                                initialDate: fechaSeleccionada,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(const Duration(days: 30)),
                              );
                              if (picked != null) {
                                setModalState(() => fechaSeleccionada = picked);
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton.icon(
                            icon: const Icon(Icons.access_time, size: 18),
                            label: Text(horaSeleccionada.format(context)),
                            onPressed: () async {
                              final picked = await showTimePicker(
                                context: context,
                                initialTime: horaSeleccionada,
                              );
                              if (picked != null) {
                                setModalState(() => horaSeleccionada = picked);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Selector de Duración
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Duración:',
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: duracionHoras > 1
                                  ? () => setModalState(() => duracionHoras--)
                                  : null,
                            ),
                            Text(
                              '$duracionHoras hr(s)',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () => setModalState(() => duracionHoras++),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Resumen del Total
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total a Pagar:',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${totalPagar.toStringAsFixed(2)}',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Botón de Confirmación
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (nombreMascotaController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Por favor ingresa el nombre de tu mascota.'),
                              ),
                            );
                            return;
                          }

                          final fechaFinal = DateTime(
                            fechaSeleccionada.year,
                            fechaSeleccionada.month,
                            fechaSeleccionada.day,
                            horaSeleccionada.hour,
                            horaSeleccionada.minute,
                          );

                          final nuevoPaseo = Paseo(
                            id: DateTime.now().millisecondsSinceEpoch.toString(),
                            paseador: widget.paseador,
                            nombreMascota: nombreMascotaController.text.trim(),
                            fechaHora: fechaFinal,
                            duracionHoras: duracionHoras,
                            costoTotal: totalPagar,
                          );

                          PaseosDatosBase.misPaseos.add(nuevoPaseo);
                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('¡Paseo reservado con éxito! 🐾'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                        child: Text(
                          'Confirmar Reserva',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.paseador.nombre,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // FOTO PRINCIPAL REDONDA DEL PASEADOR (VENTANA DE DETALLES)
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60), // Redondo amplio
                child: Container(
                  width: 110,
                  height: 110,
                  color: Colors.deepOrange.shade100,
                  child: Image.network(
                    widget.paseador.fotoUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Text(
                          widget.paseador.nombre[0],
                          style: GoogleFonts.poppins(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              widget.paseador.nombre,
              style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text(
                  '${widget.paseador.calificacion} / 5.0',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tarjeta de Información
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Experiencia:',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.paseador.experiencia,
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const Divider(height: 25),
                    Text(
                      'Tarifa por Hora:',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${widget.paseador.precioPorHora.toStringAsFixed(2)} / hora',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 25),
                    Text(
                      'Especialidades:',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: widget.paseador.especialidades
                          .map(
                            (esp) => Chip(
                              label: Text(esp),
                              backgroundColor: Colors.deepOrange.shade50,
                              labelStyle: const TextStyle(color: Colors.deepOrange),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Botón Contactar / Llamar
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                side: const BorderSide(color: Colors.deepOrange),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.phone, color: Colors.deepOrange),
              label: Text(
                'Llamar al Paseador',
                style: GoogleFonts.poppins(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => _abrirContacto(widget.paseador.telefono),
            ),
            const SizedBox(height: 12),

            // Botón Solicitar Paseo
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.pets, color: Colors.white),
              label: Text(
                'Solicitar Paseo',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: _mostrarModalSolicitarPaseo,
            ),
          ],
        ),
      ),
    );
  }
}