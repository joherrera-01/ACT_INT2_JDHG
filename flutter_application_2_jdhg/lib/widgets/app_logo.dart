import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final bool mostrarTexto;

  const AppLogo({
    super.key,
    this.size = 110.0,
    this.mostrarTexto = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // CONTENEDOR CIRCULAR ELEVADO CON EL ISOTIPO CUSTOM
        Container(
          width: size,
          height: size,
          padding: EdgeInsets.all(size * 0.08),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: CustomPaint(
            size: Size(size, size),
            painter: _PaseoLogoPainter(),
          ),
        ),
        if (mostrarTexto) ...[
          const SizedBox(height: 8),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Paseo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F2C59),
                  ),
                ),
                TextSpan(
                  text: 'Canino',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00A884),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

// PINTOR VECTORIAL BASADO EN LA ILUSTRACIÓN
class _PaseoLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // Paleta de colores exacta de la imagen
    final navyPaint = Paint()
      ..color = const Color(0xFF0F2C59)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.05
      ..strokeCap = StrokeCap.round;

    final navyFill = Paint()
      ..color = const Color(0xFF0F2C59)
      ..style = PaintingStyle.fill;

    final tealFill = Paint()
      ..color = const Color(0xFF00A884)
      ..style = PaintingStyle.fill;

    final dogFill = Paint()
      ..color = const Color(0xFFEAA64D)
      ..style = PaintingStyle.fill;

    // 1. MARCO DE SMARTPHONE (FONDO)
    final phoneRect = RRect.fromLTRBR(
      w * 0.15,
      h * 0.05,
      w * 0.85,
      h * 0.88,
      Radius.circular(w * 0.12),
    );
    canvas.drawRRect(phoneRect, navyPaint);

    // Muesca / Notch superior
    canvas.drawLine(
      Offset(w * 0.40, h * 0.09),
      Offset(w * 0.60, h * 0.09),
      navyPaint..strokeWidth = w * 0.03,
    );

    // 2. PIN DE UBICACIÓN VERDE CON HUELLA
    final pinPath = Path()
      ..moveTo(w * 0.68, h * 0.22)
      ..arcToPoint(
        Offset(w * 0.84, h * 0.35),
        radius: Radius.circular(w * 0.1),
      )
      ..lineTo(w * 0.68, h * 0.52)
      ..lineTo(w * 0.52, h * 0.35)
      ..arcToPoint(
        Offset(w * 0.68, h * 0.22),
        radius: Radius.circular(w * 0.1),
      );
    canvas.drawPath(pinPath, tealFill);

    // Huella blanca dentro del pin
    final whiteFill = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(w * 0.68, h * 0.36), w * 0.04, whiteFill);
    canvas.drawCircle(Offset(w * 0.62, h * 0.30), w * 0.02, whiteFill);
    canvas.drawCircle(Offset(w * 0.68, h * 0.28), w * 0.02, whiteFill);
    canvas.drawCircle(Offset(w * 0.74, h * 0.30), w * 0.02, whiteFill);

    // 3. BASE VERDE (SUELO)
    final groundPath = Path()
      ..moveTo(w * 0.10, h * 0.85)
      ..quadraticBezierTo(w * 0.5, h * 0.98, w * 0.90, h * 0.85)
      ..quadraticBezierTo(w * 0.5, h * 0.88, w * 0.10, h * 0.85);
    canvas.drawPath(groundPath, tealFill);

    // 4. PASEADOR DE PERROS
    // Cabeza y Gorra
    canvas.drawCircle(Offset(w * 0.35, h * 0.25), w * 0.06, navyFill);
    final capPath = Path()
      ..moveTo(w * 0.30, h * 0.23)
      ..lineTo(w * 0.44, h * 0.23)
      ..lineTo(w * 0.35, h * 0.19)
      ..close();
    canvas.drawPath(capPath, navyFill);

    // Torso Verde
    final bodyPath = Path()
      ..moveTo(w * 0.31, h * 0.32)
      ..lineTo(w * 0.41, h * 0.32)
      ..lineTo(w * 0.38, h * 0.54)
      ..lineTo(w * 0.28, h * 0.54)
      ..close();
    canvas.drawPath(bodyPath, tealFill);

    // Piernas (Pantalón Azul)
    final legPaint = Paint()
      ..color = const Color(0xFF0F2C59)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.05
      ..strokeCap = StrokeCap.round;

    // Pierna trasera
    canvas.drawLine(Offset(w * 0.32, h * 0.54), Offset(w * 0.22, h * 0.80), legPaint);
    // Pierna delantera
    canvas.drawLine(Offset(w * 0.36, h * 0.54), Offset(w * 0.42, h * 0.80), legPaint);

    // 5. PERRO DORADO
    // Cuerpo del Perro
    final dogBody = RRect.fromLTRBR(
      w * 0.52,
      h * 0.60,
      w * 0.80,
      h * 0.74,
      Radius.circular(w * 0.06),
    );
    canvas.drawRRect(dogBody, dogFill);

    // Cabeza y Oreja
    canvas.drawCircle(Offset(w * 0.82, h * 0.58), w * 0.07, dogFill);
    canvas.drawOval(
      Rect.fromLTWH(w * 0.77, h * 0.56, w * 0.04, h * 0.08),
      navyFill,
    );

    // Cola alegre
    final tailPath = Path()
      ..moveTo(w * 0.53, h * 0.62)
      ..quadraticBezierTo(w * 0.48, h * 0.55, w * 0.46, h * 0.60);
    canvas.drawPath(
      tailPath,
      Paint()
        ..color = const Color(0xFFEAA64D)
        ..style = PaintingStyle.stroke
        ..strokeWidth = w * 0.04
        ..strokeCap = StrokeCap.round,
    );

    // Patas del perro
    final dogLegPaint = Paint()
      ..color = const Color(0xFFEAA64D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.035
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(w * 0.56, h * 0.74), Offset(w * 0.54, h * 0.84), dogLegPaint);
    canvas.drawLine(Offset(w * 0.62, h * 0.74), Offset(w * 0.63, h * 0.84), dogLegPaint);
    canvas.drawLine(Offset(w * 0.72, h * 0.74), Offset(w * 0.71, h * 0.84), dogLegPaint);
    canvas.drawLine(Offset(w * 0.78, h * 0.74), Offset(w * 0.80, h * 0.84), dogLegPaint);

    // 6. CORREA QUE CONECTA AL PASEADOR CON EL PERRO
    final leashPath = Path()
      ..moveTo(w * 0.41, h * 0.50)
      ..quadraticBezierTo(w * 0.58, h * 0.65, w * 0.78, h * 0.62);
    canvas.drawPath(
      leashPath,
      Paint()
        ..color = const Color(0xFF0F2C59)
        ..style = PaintingStyle.stroke
        ..strokeWidth = w * 0.02,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}