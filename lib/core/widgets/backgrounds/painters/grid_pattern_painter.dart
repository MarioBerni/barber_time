import 'package:flutter/material.dart';

/// Painter para crear patrones de cuadrícula
class GridPatternPainter extends CustomPainter {
  /// Color de la cuadrícula
  final Color gridColor;
  
  /// Opacidad del patrón
  final double opacity;
  
  /// Densidad del patrón
  final double density;
  
  /// Constructor del painter de cuadrícula
  GridPatternPainter({
    required this.gridColor,
    this.opacity = 0.12,
    this.density = 1.0,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    // Configuración de la cuadrícula
    final double cellSize = 30.0 / density; // Tamaño de cada celda
    final double lineWidth = 0.5;           // Grosor de línea
    
    // Crear paint para la cuadrícula
    final gridPaint = Paint()
      ..color = gridColor.withAlpha((opacity * 255).round())
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;
    
    // Dibujar líneas horizontales
    for (double y = 0; y < size.height; y += cellSize) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        gridPaint,
      );
    }
    
    // Dibujar líneas verticales
    for (double x = 0; x < size.width; x += cellSize) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        gridPaint,
      );
    }
    
    // Agregar líneas resaltadas cada 4 celdas para crear jerarquía visual
    final accentPaint = Paint()
      ..color = gridColor.withAlpha((opacity * 1.5 * 255).round())
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth * 1.5;
      
    for (double y = 0; y < size.height; y += cellSize * 4) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        accentPaint,
      );
    }
    
    for (double x = 0; x < size.width; x += cellSize * 4) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        accentPaint,
      );
    }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => 
      oldDelegate is GridPatternPainter &&
      (oldDelegate.gridColor != gridColor ||
       oldDelegate.opacity != opacity ||
       oldDelegate.density != density);
}
