import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// Clase que define presets para fondos con degradado
/// 
/// Proporciona configuraciones predefinidas para diferentes contextos
/// que se pueden aplicar fácilmente al AnimatedGradientBackground
class GradientBackgroundPreset {
  /// Colores principales del degradado
  final Color primaryColor;
  final Color secondaryColor;
  final Color? accentColor;
  
  /// Ajustes visuales
  final double opacity;
  final bool showDecorationElements;
  final bool showBouncingCircles;
  
  /// Parámetros para los elementos decorativos
  final int lineCount;
  final double lineOpacity;
  final double circleOpacity;
  
  /// Constructor estándar
  const GradientBackgroundPreset({
    required this.primaryColor,
    required this.secondaryColor,
    this.accentColor,
    this.opacity = 0.9,
    this.showDecorationElements = true,
    this.showBouncingCircles = true,
    this.lineCount = 40,
    this.lineOpacity = 0.05,
    this.circleOpacity = 0.35,
  });
  
  /// Preset para pantallas profesionales, con azules profundos
  /// Ideal para pantallas de inicio o perfiles de profesionales
  static GradientBackgroundPreset get professional => GradientBackgroundPreset(
    primaryColor: AppTheme.kMidnightBlue,
    secondaryColor: AppTheme.kDeepBlue,
    accentColor: AppTheme.kBrightBlue,
    opacity: 0.95,
    lineCount: 50,
    lineOpacity: 0.04,
    circleOpacity: 0.3,
  );
  
  /// Preset para pantallas premium, con tonos dorados
  /// Perfecto para pantallas de servicios especiales o premium
  static GradientBackgroundPreset get premium => GradientBackgroundPreset(
    primaryColor: AppTheme.kDeepBlue,
    secondaryColor: AppTheme.kMidnightBlue,
    accentColor: AppTheme.kDarkGold,
    opacity: 0.92,
    lineCount: 60,
    lineOpacity: 0.06,
    circleOpacity: 0.4,
  );
  
  /// Preset para pantallas de bienvenida, con tonos más claros y vibrantes
  /// Ideal para splash screens o pantallas de onboarding
  static GradientBackgroundPreset get welcome => GradientBackgroundPreset(
    primaryColor: AppTheme.kBrightBlue,
    secondaryColor: AppTheme.kLightBlue,
    accentColor: AppTheme.kSkyBlue,
    opacity: 0.85,
    lineCount: 35,
    lineOpacity: 0.04,
    circleOpacity: 0.45,
  );
  
  /// Preset para pantallas sobrias, con un look más neutro y sofisticado
  /// Bueno para pantallas de configuración o información
  static GradientBackgroundPreset get elegant => GradientBackgroundPreset(
    primaryColor: AppTheme.kCharcoal,
    secondaryColor: AppTheme.kDeepBlue.withOpacity(0.8),
    accentColor: AppTheme.kMetalGray,
    opacity: 0.9,
    lineCount: 45,
    lineOpacity: 0.03,
    circleOpacity: 0.25,
  );
}
