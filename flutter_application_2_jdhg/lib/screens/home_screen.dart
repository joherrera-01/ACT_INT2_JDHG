import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/paseos_provider.dart';
import 'paseadores_screen.dart';
import 'mis_paseos_screen.dart';
import '../widgets/app_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final int totalPaseadores = PaseosDatosBase.listaPaseadores.length;
    final int totalPaseos = PaseosDatosBase.misPaseos.length;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'PaseoCanino 🐾',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          // ---------------------------------------------------------------
// BANNER PRINCIPAL / HEADER CON EL NUEVO LOGOTIPO REPRESENTATIVO
// ---------------------------------------------------------------
Container(
  width: double.infinity,
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.deepOrange, Colors.orangeAccent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(30),
      bottomRight: Radius.circular(30),
    ),
  ),
  padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
  child: Column(
    children: [
      // LOGOTIPO REPRESENTATIVO DE LA APLICACIÓN
      const AppLogo(size: 85),
      const SizedBox(height: 15),
      Text(
        '¡Hola, Bienvenid@!',
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        'El mejor cuidado para tu mejor amigo',
        style: GoogleFonts.roboto(
          fontSize: 14,
          color: Colors.white.withValues(alpha: 0.9),
        ),
      ),
    ],
  ),
),

            // ---------------------------------------------------------------
            // 2. TARJETAS DE MÉTRICAS / ESTADÍSTICAS RÁPIDAS
            // ---------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: _crearTarjetaEstadistica(
                      titulo: 'Paseadores',
                      valor: '$totalPaseadores Activos',
                      icono: Icons.verified_user,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _crearTarjetaEstadistica(
                      titulo: 'Mis Reservas',
                      valor: '$totalPaseos Paseos',
                      icono: Icons.directions_walk,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ---------------------------------------------------------------
            // 3. MENÚ DE ACCIONES PRINCIPALES (GRIDVIEW MEJORADO)
            // ---------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Servicios y Gestión',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.1,
                    children: [
                      _crearTarjetaMenu(
                        context: context,
                        titulo: 'Buscar\nPaseadores',
                        subtitulo: 'Ver catálogo',
                        icono: Icons.person_search_rounded,
                        color: Colors.deepOrange,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaseadoresScreen(),
                            ),
                          ).then((_) => setState(() {}));
                        },
                      ),
                      _crearTarjetaMenu(
                        context: context,
                        titulo: 'Mis Paseos',
                        subtitulo: 'Ver historial',
                        icono: Icons.assignment_rounded,
                        color: Colors.teal,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MisPaseosScreen(),
                            ),
                          ).then((_) => setState(() {}));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ---------------------------------------------------------------
            // 4. BANNER INFORMATIVO / GARANTÍA
            // ---------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: Colors.deepOrange.shade100),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.shield_outlined,
                        color: Colors.deepOrange,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Paseos 100% Seguros',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Todos los paseadores cuentan con verificación de identidad y experiencia.',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
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

  // WIDGET AUXILIAR: TARJETA DE MENÚ
  Widget _crearTarjetaMenu({
    required BuildContext context,
    required String titulo,
    required String subtitulo,
    required IconData icono,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.08),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icono, size: 30, color: color),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitulo,
                    style: GoogleFonts.roboto(
                      fontSize: 11,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // WIDGET AUXILIAR: TARJETA DE ESTADÍSTICAS
  Widget _crearTarjetaEstadistica({
    required String titulo,
    required String valor,
    required IconData icono,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icono, size: 24, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: GoogleFonts.roboto(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  valor,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}