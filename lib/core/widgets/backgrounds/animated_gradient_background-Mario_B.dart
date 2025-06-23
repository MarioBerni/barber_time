import 'package:flutter/material.dart';
import '../../theme/app_theme_extensions.dart';

/// Widget que proporciona un fondo sólido simple
/// 
/// Esta versión simplificada reemplaza la implementación anterior
/// que contenía degradados y efectos de burbujas animados.
class AnimatedGradientBackground extends StatelessWidget {
  /// Color de fondo primario.
  final Color? primaryColor;
  
  /// Constructor del fondo simplificado.
  /// 
  /// Mantiene compatibilidad con la API anterior pero ignora parámetros innecesarios.
  const AnimatedGradientBackground({
    super.key,
    this.primaryColor,
    Color? secondaryColor, // Ignorado en esta implementación simplificada
    Color? accentColor, // Ignorado
    double opacity = 0.9, // Ignorado
    bool showDecorationElements = true, // Ignorado
    bool showBouncingCircles = true, // Ignorado
    int lineCount = 40, // Ignorado
    double lineOpacity = 0.05, // Ignorado
    double circleOpacityFactor = 1.0, // Ignorado
  });
  
  @override
  Widget build(BuildContext context) {
    // Usar el color primario proporcionado o el color de fondo del tema
    final backgroundColor = primaryColor ?? context.backgroundColor;
    
    return Container(
      color: backgroundColor,
      width: double.infinity,
      height: double.infinity,
    );
  }
}

// Clase eliminada ya que ahora AnimatedGradientBackground es StatelessWidget