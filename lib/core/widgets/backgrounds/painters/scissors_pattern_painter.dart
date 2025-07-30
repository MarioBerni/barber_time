import 'package:flutter/material.dart';

/// Painter para crear patrones de tijeras estilizadas
class ScissorsPatternPainter extends CustomPainter {
  /// Color primario de las tijeras
  final Color primaryColor;

  /// Color secundario de las tijeras
  final Color secondaryColor;

  /// Opacidad del patrón
  final double opacity;

  /// Densidad del patrón (controla cuántas tijeras se dibujan)
  final double density;

  /// Constructor del painter de tijeras
  ScissorsPatternPainter({
    required this.primaryColor,
    required this.secondaryColor,
    this.opacity = 0.1,
    this.density = 0.8,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Configuración del patrón
    final double baseSize = 24.0 / density; // Tamaño base de cada tijera
    final int rowCount = (size.height / (baseSize * 6)).ceil();
    final int colCount = (size.width / (baseSize * 6)).ceil();

    // Crear paints para las tijeras
    final handlePaint = Paint()
      ..color = primaryColor.withAlpha((opacity * 255).round())
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..isAntiAlias = true;

    final bladePaint = Paint()
      ..color = secondaryColor.withAlpha((opacity * 1.2 * 255).round())
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true;

    // Dibujar un patrón de tijeras en toda la pantalla
    for (int row = 0; row < rowCount; row++) {
      for (int col = 0; col < colCount; col++) {
        // Posición de cada tijera
        final x = col * baseSize * 6 + ((row % 2 == 0) ? baseSize * 3 : 0);
        final y = row * baseSize * 6;

        // Dibujar tijera estilizada
        _drawScissor(
          canvas,
          Offset(x, y),
          baseSize,
          handlePaint,
          bladePaint,
          (row + col) % 4 * 0.25, // Rotación para variar
        );
      }
    }
  }

  /// Dibuja una tijera estilizada en la posición dada
  void _drawScissor(
    Canvas canvas,
    Offset position,
    double size,
    Paint handlePaint,
    Paint bladePaint,
    double rotationFactor,
  ) {
    // Guardar el estado del canvas
    // Trasladar y rotar para posicionar la tijera
    canvas
      ..save()
      ..translate(position.dx, position.dy)
      ..rotate(rotationFactor * 3.14159);

    // Dibujar las hojas de la tijera
    final path1 = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(size, size, size * 2, 0);

    final path2 = Path()
      ..moveTo(0, size)
      ..quadraticBezierTo(size, 0, size * 2, size);

    // Dibujar las hojas y el mango de la tijera
    canvas
      ..drawPath(path1, bladePaint)
      ..drawPath(path2, bladePaint)
      ..drawLine(
        Offset(-size * 0.8, size * 0.5),
        Offset(0, size * 0.5),
        handlePaint,
      )
      // Dibujar el punto de pivote
      ..drawCircle(Offset(0, size * 0.5), size * 0.15, handlePaint)
      ..restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is ScissorsPatternPainter &&
      (oldDelegate.primaryColor != primaryColor ||
          oldDelegate.secondaryColor != secondaryColor ||
          oldDelegate.opacity != opacity ||
          oldDelegate.density != density);
}
