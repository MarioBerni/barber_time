import 'package:flutter/material.dart';

import '../../theme/app_theme_extensions.dart';
import 'gradient_builders.dart';
import 'gradient_types.dart';

/// Widget que proporciona una superposición de degradado configurable
///
/// Este componente crea una capa de degradado que puede superponerse
/// sobre cualquier otro fondo o contenido para crear efectos visuales
/// como iluminación profesional, viñetas o destellos.
class GradientOverlayBackground extends StatelessWidget {
  /// Color primario del degradado
  final Color? primaryColor;

  /// Color secundario del degradado
  final Color? secondaryColor;

  /// Tipo de degradado a utilizar
  final GradientType gradientType;

  /// Opacidad general del degradado
  final double opacity;

  /// Intensidad del efecto (1.0 = normal, 2.0 = doble intensidad)
  final double intensity;

  /// Contenido a mostrar debajo del degradado
  final Widget child;

  /// Constructor de la superposición de degradado
  const GradientOverlayBackground({
    super.key,
    this.primaryColor,
    this.secondaryColor,
    this.gradientType = GradientType.professionalVertical,
    this.opacity = 0.7,
    this.intensity = 1.0,
    required this.child,
  });

  /// Crea una superposición con degradado profesional vertical
  factory GradientOverlayBackground.professional({
    required Widget child,
    Color? primaryColor,
    Color? secondaryColor,
    double opacity = 0.7,
    double intensity = 1.0,
  }) {
    return GradientOverlayBackground(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      opacity: opacity,
      intensity: intensity,
      child: child,
    );
  }

  /// Crea una superposición con efecto de iluminación desde una esquina
  factory GradientOverlayBackground.cornerLight({
    required Widget child,
    Color? primaryColor,
    Color? secondaryColor,
    double opacity = 0.65,
    double intensity = 1.0,
  }) {
    return GradientOverlayBackground(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      gradientType: GradientType.cornerLight,
      opacity: opacity,
      intensity: intensity,
      child: child,
    );
  }

  /// Crea una superposición con efecto de viñeta estilizada
  factory GradientOverlayBackground.vignette({
    required Widget child,
    Color? primaryColor,
    Color? secondaryColor,
    double opacity = 0.75,
    double intensity = 1.0,
  }) {
    return GradientOverlayBackground(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      gradientType: GradientType.vignette,
      opacity: opacity,
      intensity: intensity,
      child: child,
    );
  }

  /// Crea una superposición con efecto de viñeta suave y elegante
  factory GradientOverlayBackground.softVignette({
    required Widget child,
    Color? primaryColor,
    Color? secondaryColor,
    double opacity = 0.65,
    double intensity = 0.8,
  }) {
    return GradientOverlayBackground(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      gradientType: GradientType.softVignette,
      opacity: opacity,
      intensity: intensity,
      child: child,
    );
  }

  /// Crea una superposición con degradado radial desde el centro
  factory GradientOverlayBackground.radial({
    required Widget child,
    Color? primaryColor,
    Color? secondaryColor,
    double opacity = 0.6,
    double intensity = 1.0,
  }) {
    return GradientOverlayBackground(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      gradientType: GradientType.radialCenter,
      opacity: opacity,
      intensity: intensity,
      child: child,
    );
  }

  /// Crea una superposición con efecto de luz superior tipo "spotlight"
  factory GradientOverlayBackground.spotlight({
    required Widget child,
    Color? primaryColor,
    Color? secondaryColor,
    double opacity = 0.55,
    double intensity = 1.0,
  }) {
    return GradientOverlayBackground(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      gradientType: GradientType.topSpotlight,
      opacity: opacity,
      intensity: intensity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Obtener colores del tema actual o usar los proporcionados
    final baseColor = primaryColor ?? context.primaryColor;
    final accentColor = secondaryColor ?? context.accentColor;

    return Stack(
      fit: StackFit.expand,
      children: [
        // El contenido principal
        child,

        // Superposición de degradado
        Positioned.fill(child: _buildGradientOverlay(baseColor, accentColor)),
      ],
    );
  }

  /// Construye la superposición de degradado según el tipo seleccionado
  Widget _buildGradientOverlay(Color baseColor, Color accentColor) {
    switch (gradientType) {
      case GradientType.professionalVertical:
        return GradientBuilders.buildProfessionalVerticalGradient(
          baseColor: baseColor,
          accentColor: accentColor,
          opacity: opacity,
          intensity: intensity,
        );

      case GradientType.cornerLight:
        return GradientBuilders.buildCornerLightGradient(
          baseColor: baseColor,
          accentColor: accentColor,
          opacity: opacity,
          intensity: intensity,
        );

      case GradientType.vignette:
        return GradientBuilders.buildVignetteGradient(
          baseColor: baseColor,
          accentColor: accentColor,
          opacity: opacity,
          intensity: intensity,
        );

      case GradientType.softVignette:
        return GradientBuilders.buildSoftVignetteGradient(
          baseColor: baseColor,
          accentColor: accentColor,
          opacity: opacity,
          intensity: intensity,
        );

      case GradientType.radialCenter:
        return GradientBuilders.buildRadialGradient(
          baseColor: baseColor,
          accentColor: accentColor,
          opacity: opacity,
          intensity: intensity,
        );

      case GradientType.topSpotlight:
        return GradientBuilders.buildTopSpotlightGradient(
          baseColor: baseColor,
          accentColor: accentColor,
          opacity: opacity,
          intensity: intensity,
        );
    }
  }
}
