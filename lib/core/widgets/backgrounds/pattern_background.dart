import 'package:flutter/material.dart';
import '../../theme/app_theme_extensions.dart';

// Importamos los painters modularizados
import 'painters/diagonal_stripes_painter.dart';
import 'painters/grid_pattern_painter.dart';
import 'painters/scissors_pattern_painter.dart';

/// Enumeración de patrones de barbería disponibles
enum BarberPattern {
  /// Patrón de rayas diagonales reminiscente de los postes de barbería
  diagonalStripes,

  /// Patrón de cuadrícula sutil que evoca elegancia y profesionalismo
  subtleGrid,

  /// Patrón de tijeras de peluquero estilizadas
  scissorsPattern,
}

/// Widget que proporciona un fondo con patrones inspirados en barberías vintage
///
/// Este componente crea diferentes patrones de fondo
/// relacionados con la estética
/// de barberías clásicas, permitiendo personalizar la densidad y opacidad.
class PatternBackground extends StatelessWidget {
  /// Color primario para el patrón
  final Color? primaryColor;

  /// Color secundario para el patrón
  final Color? secondaryColor;

  /// Tipo de patrón a utilizar
  final BarberPattern patternType;

  /// Opacidad del patrón (0.0 - 1.0)
  final double opacity;

  /// Densidad del patrón (1.0 = normal, 2.0 = doble densidad, 0.5 = mitad)
  final double density;

  /// Color de fondo base
  final Color? backgroundColor;

  /// Constructor del fondo con patrón
  const PatternBackground({
    super.key,
    this.primaryColor,
    this.secondaryColor,
    this.backgroundColor,
    this.patternType = BarberPattern.diagonalStripes,
    this.opacity = 0.15,
    this.density = 1.0,
  });

  /// Crea un patrón de rayas diagonales ideal para barbería
  factory PatternBackground.diagonalStripes({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    double opacity = 0.15,
    double density = 1.0,
  }) {
    return PatternBackground(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      backgroundColor: backgroundColor,
      opacity: opacity,
      density: density,
    );
  }

  /// Crea un patrón de cuadrícula sutil para un ambiente profesional
  factory PatternBackground.subtleGrid({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    double opacity = 0.12,
    double density = 1.0,
  }) {
    return PatternBackground(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      backgroundColor: backgroundColor,
      patternType: BarberPattern.subtleGrid,
      opacity: opacity,
      density: density,
    );
  }

  /// Crea un patrón de tijeras estilizadas
  factory PatternBackground.scissors({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    double opacity = 0.1,
    double density = 0.8,
  }) {
    return PatternBackground(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      backgroundColor: backgroundColor,
      patternType: BarberPattern.scissorsPattern,
      opacity: opacity,
      density: density,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Obtener colores del tema actual o usar los proporcionados
    final baseColor = primaryColor ?? context.primaryColor;
    final secondColor = secondaryColor ?? context.accentColor;
    final bgColor = backgroundColor ?? context.backgroundColor;

    return Stack(
      children: [
        // Fondo base
        Container(
          width: double.infinity,
          height: double.infinity,
          color: bgColor,
        ),

        // Patrón según el tipo seleccionado
        CustomPaint(
          painter: _getPatternPainter(
            baseColor: baseColor,
            secondaryColor: secondColor,
            patternType: patternType,
            opacity: opacity,
            density: density,
          ),
          size: Size.infinite,
        ),
      ],
    );
  }

  /// Retorna el CustomPainter adecuado según el tipo de patrón
  CustomPainter _getPatternPainter({
    required Color baseColor,
    required Color secondaryColor,
    required BarberPattern patternType,
    required double opacity,
    required double density,
  }) {
    switch (patternType) {
      case BarberPattern.diagonalStripes:
        return DiagonalStripesPainter(
          stripeColor: baseColor,
          backgroundColor: secondaryColor,
          opacity: opacity,
          density: density,
        );

      case BarberPattern.subtleGrid:
        return GridPatternPainter(
          gridColor: baseColor,
          opacity: opacity,
          density: density,
        );

      case BarberPattern.scissorsPattern:
        return ScissorsPatternPainter(
          primaryColor: baseColor,
          secondaryColor: secondaryColor,
          opacity: opacity,
          density: density,
        );
    }
  }
}
