import 'package:flutter/material.dart';

/// Painter personalizado para crear un patrón de líneas horizontales
/// Simula el estilo de una barbería vintage con líneas sutiles
class StripedPatternPainter extends CustomPainter {
  /// Color base para las líneas del patrón
  final Color baseColor;

  /// Número de líneas a dibujar (densidad)
  final int lineCount;

  /// Opacidad base de las líneas
  final double baseOpacity;

  /// Grosor de las líneas
  final double strokeWidth;

  /// Constructor para el painter de patrón de líneas
  StripedPatternPainter({
    required this.baseColor,
    this.lineCount = 40, // Mayor densidad que la versión original
    this.baseOpacity = 0.05, // Ligeramente más visible
    this.strokeWidth = 0.6, // Ligeramente más grueso
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = baseColor.withAlpha((baseOpacity * 255).round())
      ..strokeWidth = strokeWidth;

    // Crear líneas horizontales como detalle de diseño
    final lineSpacing = size.height / lineCount;

    for (var i = 0; i < lineCount; i++) {
      // Alternar opacidad ligeramente para crear efecto visual más interesante
      if (i % 3 == 0) {
        paint.color = baseColor.withAlpha((baseOpacity * 1.5 * 255).round());
      } else {
        paint.color = baseColor.withAlpha((baseOpacity * 255).round());
      }

      final y = i * lineSpacing;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is StripedPatternPainter &&
      (oldDelegate.baseColor != baseColor ||
          oldDelegate.lineCount != lineCount ||
          oldDelegate.baseOpacity != baseOpacity ||
          oldDelegate.strokeWidth != strokeWidth);
}
