import 'package:flutter/material.dart';
import 'animated_gradient_background.dart';
import 'gradient_background_preset.dart';

/// Clase utilitaria para crear instancias de AnimatedGradientBackground
/// 
/// Proporciona constructores factory para facilitar la creación 
/// de fondos con configuraciones predefinidas
class GradientBackgroundFactory {
  /// Constructor privado para prevenir instanciación
  GradientBackgroundFactory._();
  
  /// Crea una instancia de AnimatedGradientBackground desde un preset
  static AnimatedGradientBackground fromPreset({
    Key? key,
    required GradientBackgroundPreset preset,
    bool? showDecorationElements,
    bool? showBouncingCircles,
  }) {
    return AnimatedGradientBackground(
      key: key,
      primaryColor: preset.primaryColor,
      secondaryColor: preset.secondaryColor,
      accentColor: preset.accentColor,
      opacity: preset.opacity,
      showDecorationElements: showDecorationElements ?? preset.showDecorationElements,
      showBouncingCircles: showBouncingCircles ?? preset.showBouncingCircles,
      lineCount: preset.lineCount,
      lineOpacity: preset.lineOpacity,
      circleOpacityFactor: preset.circleOpacity / 0.35, // 0.35 es la opacidad base
    );
  }
  
  /// Crea una instancia con el preset profesional
  static AnimatedGradientBackground professional({Key? key}) {
    return fromPreset(
      key: key,
      preset: GradientBackgroundPreset.professional,
    );
  }
  
  /// Crea una instancia con el preset premium
  static AnimatedGradientBackground premium({Key? key}) {
    return fromPreset(
      key: key,
      preset: GradientBackgroundPreset.premium,
    );
  }
  
  /// Crea una instancia con el preset de bienvenida
  static AnimatedGradientBackground welcome({Key? key}) {
    return fromPreset(
      key: key,
      preset: GradientBackgroundPreset.welcome,
    );
  }
  
  /// Crea una instancia con el preset elegante
  static AnimatedGradientBackground elegant({Key? key}) {
    return fromPreset(
      key: key,
      preset: GradientBackgroundPreset.elegant,
    );
  }
}
