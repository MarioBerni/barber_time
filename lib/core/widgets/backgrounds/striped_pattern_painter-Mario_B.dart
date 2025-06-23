import 'package:flutter/material.dart';

/// Custom painter que anteriormente dibujaba un patrón de líneas
/// 
/// Versión simplificada sin efectos visuales
class StripedPatternPainter extends CustomPainter {
  /// Color base para las líneas del patrón
  final Color baseColor;
  
  /// Número de líneas a dibujar (densidad)
  final int lineCount;
  
  /// Opacidad base de las líneas
  final double baseOpacity;
  
  /// Grosor de las líneas
  final double strokeWidth;
  
  // Constructor mantenido para compatibilidad pero parámetros ignorados
  const StripedPatternPainter({
    required this.baseColor,
    required this.lineCount,
    this.baseOpacity = 0.05,
    this.strokeWidth = 0.6,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    // Versión simplificada que no dibuja nada
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Siempre devuelve falso ya que no hay nada que repintar
    return false;
  }
}
