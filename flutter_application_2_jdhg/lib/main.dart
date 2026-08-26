// ============================================================
// PaseosCaninos - App de presentación de un emprendimiento
// Actividad Integradora 2 - Mi Primera Aplicación en Flutter
// Realizado por: JORGE DAVID HERRERA GALAN
// ============================================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Punto de entrada principal de la aplicación
void main() {
  runApp(const AplicacionPaseoMascotas());
}

// ---------------------------------------------------------------------------
// 1. MaterialApp: Configuración general y tema de la aplicación
// ---------------------------------------------------------------------------
class AplicacionPaseoMascotas extends StatelessWidget {
  const AplicacionPaseoMascotas({super.key});

  @override
  Widget build(BuildContext context) {
    // -----------------------------------------------------------------------
    // REQUERIMIENTO: MaterialApp
    // -----------------------------------------------------------------------
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PaseoCanino - Cliente',
      theme: ThemeData(
        // -------------------------------------------------------------------
        // REQUERIMIENTO: Colores personalizados (Semilla de color deepOrange)
        // -------------------------------------------------------------------
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const PantallaPrincipal(),
    );
  }
}

// Widget con estado para manejar la pantalla principal
class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _EstadoPantallaPrincipal();
}

class _EstadoPantallaPrincipal extends State<PantallaPrincipal> {
  // Variable simple para el contador
  int contadorPaseosTotales = 0;

  // Datos simples del paseador
  String nombrePaseador = 'Carlos Mendoza';
  String precioPaseador = '\$15.00 / hora';
  String telefonoPaseador = '+593 98 765 4321';

  // Función para solicitar paseo
  void solicitarPaseo() {
    setState(() {
      contadorPaseosTotales++;
    });
  }

  // Función para cancelar paseo
  void cancelarPaseo() {
    setState(() {
      if (contadorPaseosTotales > 0) {
        contadorPaseosTotales--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool tienePaseosActivos = contadorPaseosTotales > 0;

    // -----------------------------------------------------------------------
    // REQUERIMIENTO: Scaffold (Estructura base de la pantalla)
    // -----------------------------------------------------------------------
    return Scaffold(
      // ---------------------------------------------------------------------
      // REQUERIMIENTO: AppBar
      // ---------------------------------------------------------------------
      appBar: AppBar(
        // -------------------------------------------------------------------
        // REQUERIMIENTO: Uso de Row y Container
        // -------------------------------------------------------------------
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ---------------------------------------------------------------
            // REQUERIMIENTO: Título de la aplicación
            // ---------------------------------------------------------------
            Text(
              'PaseoCanino',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            // REQUERIMIENTO: Container con Colores personalizados
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(50),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white70),
              ),
              child: Text(
                'Cliente',
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        // REQUERIMIENTO: Colores personalizados
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        // -------------------------------------------------------------------
        // REQUERIMIENTO: Uso de Column
        // -------------------------------------------------------------------
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // REQUERIMIENTO: Container y Row con colores personalizados
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.deepOrange,
                    // -------------------------------------------------------
                    // REQUERIMIENTO: Una imagen o ícono (Ícono de usuario)
                    // -------------------------------------------------------
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ---------------------------------------------------
                        // REQUERIMIENTO: Textos informativos
                        // ---------------------------------------------------
                        Text(
                          '¡Hola, Dueño de Mascota! 👋',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // REQUERIMIENTO: Textos informativos
                        Text(
                          'Pide un paseo seguro para tu perro aquí',
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // REQUERIMIENTO: Container con ícono principal
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepOrange.shade50,
                shape: BoxShape.circle,
              ),
              // -------------------------------------------------------------
              // REQUERIMIENTO: Una imagen o ícono (Ícono principal de mascotas)
              // -------------------------------------------------------------
              child: const Icon(
                Icons.pets,
                size: 70,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 12),

            // REQUERIMIENTO: Textos informativos
            Text(
              '¿Tu perrito necesita salir a pasear?',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),

            // REQUERIMIENTO: Textos informativos
            Text(
              'Encuentra paseadores calificados en tu zona y monitorea sus salidas.',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 13,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 16),

            // ---------------------------------------------------------------
            // REQUERIMIENTO: Uso de Card
            // ---------------------------------------------------------------
            Card(
              color: Colors.deepOrange.shade50,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                // REQUERIMIENTO: Uso de Row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // REQUERIMIENTO: Una imagen o ícono
                    const Icon(Icons.directions_run, color: Colors.deepOrange),
                    const SizedBox(width: 8),
                    // REQUERIMIENTO: Textos informativos
                    Text(
                      'Mis paseos solicitados: ',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '$contadorPaseosTotales',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // REQUERIMIENTO: Uso de Card, Column y Row
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // REQUERIMIENTO: Íconos y Textos informativos
                        const Icon(Icons.check_circle, color: Colors.green, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Paseos individuales o grupales',
                            style: GoogleFonts.roboto(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.timer, color: Colors.orange, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Duración: 30 o 60 minutos',
                            style: GoogleFonts.roboto(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.shield, color: Colors.blue, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Paseadores con seguro y verificación',
                            style: GoogleFonts.roboto(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // REQUERIMIENTO: Container con cambio de colores personalizados dinámicos
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: tienePaseosActivos ? Colors.green.shade100 : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: tienePaseosActivos ? Colors.green : Colors.grey.shade400,
                ),
              ),
              // REQUERIMIENTO: Textos informativos
              child: Text(
                tienePaseosActivos
                    ? '¡Has pedido $contadorPaseosTotales paseo(s)! Un paseador va en camino.'
                    : 'Aún no has contratado ningún paseo hoy.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: tienePaseosActivos ? Colors.green.shade900 : Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // REQUERIMIENTO: Container y Column con Textos informativos
            if (tienePaseosActivos) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.deepOrange.shade300),
                ),
                child: Column(
                  children: [
                    Text(
                      'Paseador asignado:',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Nombre: $nombrePaseador\nPrecio: $precioPaseador\nContacto: $telefonoPaseador',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        color: Colors.black87,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],

            // REQUERIMIENTO: Uso de Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // -----------------------------------------------------------
                // REQUERIMIENTO: Al menos un botón (Botón principal "Pedir Paseador")
                // -----------------------------------------------------------
                ElevatedButton.icon(
                  onPressed: solicitarPaseo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  icon: const Icon(Icons.add),
                  label: Text(
                    'Pedir Paseador',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                
                // REQUERIMIENTO: Al menos un botón (Botón opcional "Cancelar 1")
                if (tienePaseosActivos) ...[
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: cancelarPaseo,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    icon: const Icon(Icons.remove_circle_outline, size: 18),
                    label: Text(
                      'Cancelar 1',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}