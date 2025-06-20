import 'package:flutter/material.dart';

/// Painter para crear patrones de rayas diagonales
class DiagonalStripesPainter extends CustomPainter {
  /// Color de las rayas
  final Color stripeColor;
  
  /// Color de fondo (opcional)
  final Color backgroundColor;
  
  /// Opacidad del patrón
  final double opacity;
  
  /// Densidad del patrón
  final double density;
  
  /// Constructor del painter de rayas diagonales
  DiagonalStripesPainter({
    required this.stripeColor,
    required this.backgroundColor,
    this.opacity = 0.15,
    this.density = 1.0,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    // Configuración del patrón
    final double stripeWidth = 15.0 / density; // Ancho de cada raya
    final double spacing = 40.0 / density;     // Espacio entre rayas
    
    // Crear paint para las rayas
    final stripePaint = Paint()
      ..color = stripeColor.withAlpha((opacity * 255).round())
      ..style = PaintingStyle.stroke
      ..strokeWidth = stripeWidth
      ..isAntiAlias = true;
    
    // Calcular diagonal para cubrir toda la pantalla
    final double diagonal = size.width + size.height;
    
    // Dibujar rayas diagonales en toda la pantalla
    for (double i = -diagonal; i < diagonal * 2; i += spacing) {
      // Rayas principales
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + diagonal, diagonal),
        stripePaint,
      );
      
      // Rayas secundarias con menor opacidad
      final secondaryPaint = Paint()
        ..color = backgroundColor.withAlpha((opacity * 0.6 * 255).round())
        ..style = PaintingStyle.stroke
        ..strokeWidth = stripeWidth * 0.7
        ..isAntiAlias = true;
        
      canvas.drawLine(
        Offset(i + (spacing / 2), 0),
        Offset(i + (spacing / 2) + diagonal, diagonal),
        secondaryPaint,
      );
    }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => 
      oldDelegate is DiagonalStripesPainter &&
      (oldDelegate.stripeColor != stripeColor ||
       oldDelegate.backgroundColor != backgroundColor ||
       oldDelegate.opacity != opacity ||
       oldDelegate.density != density);
}
