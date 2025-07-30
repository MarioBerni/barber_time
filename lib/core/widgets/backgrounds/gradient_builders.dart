import 'package:flutter/material.dart';

/// Utilidades para construir diferentes efectos de gradiente
///
/// Esta clase contiene los métodos de construcción para diferentes
/// tipos de gradientes
/// usados por GradientOverlayBackground.
class GradientBuilders {
  /// Construye un degradado profesional vertical
  static Widget buildProfessionalVerticalGradient({
    required Color baseColor,
    required Color accentColor,
    required double opacity,
    required double intensity,
  }) {
    final Color topColor = accentColor.withAlpha(
      (opacity * 0.3 * intensity * 255).round(),
    );
    final Color bottomColor = baseColor.withAlpha(
      (opacity * intensity * 255).round(),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [topColor, bottomColor],
          stops: const [0.0, 1.0],
        ),
      ),
    );
  }

  /// Construye un degradado con efecto de iluminación desde una esquina
  static Widget buildCornerLightGradient({
    required Color baseColor,
    required Color accentColor,
    required double opacity,
    required double intensity,
  }) {
    final Color lightColor = accentColor.withAlpha(
      (opacity * 0.4 * intensity * 255).round(),
    );
    final Color darkColor = baseColor.withAlpha(
      (opacity * intensity * 255).round(),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [lightColor, darkColor],
          stops: const [0.0, 1.0],
        ),
      ),
    );
  }

  /// Construye un efecto de viñeta estilizada
  static Widget buildVignetteGradient({
    required Color baseColor,
    required Color accentColor,
    required double opacity,
    required double intensity,
  }) {
    final Color darkColor = baseColor.withAlpha(
      (opacity * intensity * 255).round(),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 1.2,
          colors: [
            Colors.transparent,
            darkColor.withAlpha((darkColor.a / 255 * 0.3 * 255).round()),
            darkColor,
          ],
          stops: const [0.6, 0.8, 1.0],
        ),
      ),
    );
  }

  /// Construye un efecto de viñeta suave y elegante
  static Widget buildSoftVignetteGradient({
    required Color baseColor,
    required Color accentColor,
    required double opacity,
    required double intensity,
  }) {
    final Color darkColor = baseColor.withAlpha(
      (opacity * intensity * 255).round(),
    );
    final Color accentGlow = accentColor.withAlpha(
      (opacity * 0.2 * intensity * 255).round(),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        // Viñeta suave en los bordes
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 1.5,
              colors: [
                Colors.transparent,
                darkColor.withAlpha((darkColor.a / 255 * 0.15 * 255).round()),
                darkColor.withAlpha((darkColor.a / 255 * 0.45 * 255).round()),
              ],
              stops: const [0.7, 0.85, 1.0],
            ),
          ),
        ),
        // Sutil resplandor central
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 150,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [accentGlow, Colors.transparent],
                stops: const [0.0, 1.0],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Construye un degradado radial desde el centro
  static Widget buildRadialGradient({
    required Color baseColor,
    required Color accentColor,
    required double opacity,
    required double intensity,
  }) {
    final Color centerColor = accentColor.withAlpha(
      (opacity * 0.3 * intensity * 255).round(),
    );
    final Color edgeColor = baseColor.withAlpha(
      (opacity * intensity * 255).round(),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 0.8,
          colors: [centerColor, edgeColor],
          stops: const [0.1, 1.0],
        ),
      ),
    );
  }

  /// Construye un efecto de luz superior tipo "spotlight"
  static Widget buildTopSpotlightGradient({
    required Color baseColor,
    required Color accentColor,
    required double opacity,
    required double intensity,
  }) {
    final Color lightColor = accentColor.withAlpha(
      (opacity * 0.4 * intensity * 255).round(),
    );
    final Color darkColor = baseColor.withAlpha(
      (opacity * intensity * 255).round(),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            lightColor,
            darkColor.withAlpha((darkColor.a / 255 * 0.3 * 255).round()),
            darkColor,
          ],
          stops: const [0.0, 0.4, 1.0],
        ),
      ),
    );
  }
}
