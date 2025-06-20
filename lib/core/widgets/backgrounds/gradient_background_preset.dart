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
  
  /// Preset específico para Barber Time con estilo masculino
  /// Diseñado para la pantalla de login y todas las páginas principales
  /// Degradado horizontal de azul profundo con burbujas doradas bien visibles
  static GradientBackgroundPreset get lightBarber => GradientBackgroundPreset(
    primaryColor: AppTheme.kDeepBlue, // Azul profundo para la parte superior (masculino)
    secondaryColor: AppTheme.kBrightBlue.withAlpha((0.7 * 255).round()), // Azul brillante para la parte inferior
    accentColor: AppTheme.kLightGold, // Dorado brillante para burbujas bien visibles
    opacity: 0.85, // Alta opacidad para un efecto más contundente
    lineCount: 0, // Sin líneas para mantener simplicidad
    lineOpacity: 0.0, // Sin opacidad para líneas
    circleOpacity: 0.9, // Opacidad alta para burbujas muy visibles
    showDecorationElements: false, // Sin elementos decorativos para un fondo limpio
    showBouncingCircles: true, // Mantener exactamente 3 burbujas
  );
  
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
    secondaryColor: AppTheme.kDeepBlue.withAlpha((0.8 * 255).round()),
    accentColor: AppTheme.kMetalGray,
    opacity: 0.9,
    lineCount: 45,
    lineOpacity: 0.03,
    circleOpacity: 0.25,
  );
  
  /// Preset para pantallas de lujo con degradados profundos en tonos de azul
  /// Ideal para la página de login y para transmitir exclusividad
  static GradientBackgroundPreset get elegantDark => GradientBackgroundPreset(
    primaryColor: AppTheme.kDeepBlue,
    secondaryColor: AppTheme.kMidnightBlue,
    accentColor: AppTheme.kDarkGold,
    opacity: 0.92,
    lineCount: 35,
    lineOpacity: 0.03,
    circleOpacity: 0.28,
    showDecorationElements: true,
    showBouncingCircles: true,
  );
  
  /// Preset para pantallas modernas con degradado de tonos celestes/verde agua
  /// Ideal para interfaces limpias, frescas y contemporáneas
  static GradientBackgroundPreset get aquaLight => GradientBackgroundPreset(
    primaryColor: const Color(0xFF89CFF0), // Celeste claro
    secondaryColor: const Color(0xFFAFE1E1), // Aqua suave
    accentColor: const Color(0xFF66CDAA), // Verde agua medio
    opacity: 0.85,
    lineCount: 25,
    lineOpacity: 0.02,
    circleOpacity: 0.20,
    showDecorationElements: true,
    showBouncingCircles: true,
  );
  
  /// Preset de lujo avanzado con degradados complejos de múltiples colores
  /// Ideal para pantallas principales y experiencias visuales premium
  static GradientBackgroundPreset get luxurious => GradientBackgroundPreset(
    primaryColor: AppTheme.kMidnightBlue,
    secondaryColor: AppTheme.kDeepBlue,
    accentColor: AppTheme.kDarkGold,
    opacity: 0.95,
    lineCount: 50,
    lineOpacity: 0.05,
    circleOpacity: 0.38,
    showDecorationElements: true,
    showBouncingCircles: true,
  );
}
