import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// Clase que define presets para fondos con degradado
///
/// Proporciona configuraciones predefinidas para diferentes contextos
/// que se pueden aplicar fácilmente al AnimatedGradientBackground
class GradientBackgroundPreset {
  /// Colores principales del degradado
  /// Color primario del degradado.
  final Color primaryColor;

  /// Color secundario del degradado.
  final Color secondaryColor;

  /// Color de acento opcional para el degradado.
  final Color? accentColor;

  /// Ajustes visuales
  /// Opacidad del degradado (0.0 - 1.0).
  final double opacity;

  /// Determina si se muestran elementos decorativos adicionales.
  final bool showDecorationElements;

  /// Determina si se muestra el círculo animado que rebota.
  final bool showBouncingCircles;

  /// Parámetros para los elementos decorativos
  /// Número de líneas para el patrón de fondo.
  final int lineCount;

  /// Opacidad base de las líneas.
  final double lineOpacity;

  /// Opacidad de los círculos.
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

  /// Preset específico para Barber Time con estilo moderno
  /// Diseñado para la pantalla de login y todas las páginas principales
  /// Degradado horizontal de turquesa-menta 
  /// con burbujas terracota bien visibles
  static GradientBackgroundPreset get lightBarber => GradientBackgroundPreset(
    primaryColor: AppTheme.kPrimaryDarkColor,
    // Turquesa-menta oscuro para la parte superior
    secondaryColor: AppTheme.kPrimaryColor.withAlpha(
      (0.7 * 255).round(),
    ), // Turquesa-menta para la parte inferior
    accentColor: AppTheme.kAccentColor,
    // Naranja terracota para burbujas bien visibles
    opacity: 0.85, // Alta opacidad para un efecto más contundente
    lineCount: 0, // Sin líneas para mantener simplicidad
    lineOpacity: 0.0, // Sin opacidad para líneas
    circleOpacity: 0.9, // Opacidad alta para burbujas muy visibles
    showDecorationElements: false,
    // Sin elementos decorativos para un fondo limpio
  );

  /// Preset para área de auth oscura con tema premium
  /// Diseñado para mostrar un fondo premium en el área de login
  static GradientBackgroundPreset get darkPremiumAuth =>
      GradientBackgroundPreset(
        primaryColor: AppTheme.kBackgroundColor,
        secondaryColor: AppTheme.kSurfaceColor,
        accentColor: AppTheme.kPrimaryColor,
        lineCount: 30,
        lineOpacity: 0.03,
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

  /// Preset especialmente diseñado para citas
  static GradientBackgroundPreset get appointments => GradientBackgroundPreset(
    primaryColor: AppTheme.kBackgroundColor,
    secondaryColor: AppTheme.kSurfaceColor,
    accentColor: AppTheme.kPrimaryColor,
    opacity: 0.95,
    showBouncingCircles: false,
    lineCount: 25,
    lineOpacity: 0.03,
  );

  /// Preset para pantallas de bienvenida, con tonos más claros y vibrantes
  /// Preset optimizado para pantallas donde se requiere un fondo más claro
  static GradientBackgroundPreset get lightApp => GradientBackgroundPreset(
    primaryColor: AppTheme.kPrimaryLightColor,
    secondaryColor: AppTheme.kPrimaryColor,
    accentColor: AppTheme.kPrimaryDarkColor,
    opacity: 0.25,
    showDecorationElements: false,
    showBouncingCircles: false,
    lineCount: 0,
    lineOpacity: 0.0,
    circleOpacity: 0.0,
  );

  /// Preset para pantallas sobrias, con un look más neutro y sofisticado
  /// Preset para pantallas de datos con fondo sutil y oscuro
  static GradientBackgroundPreset get darkData => GradientBackgroundPreset(
    primaryColor: Colors.black,
    secondaryColor: AppTheme.kBackgroundColor.withAlpha((0.8 * 255).round()),
    accentColor: Colors.white,
    opacity: 0.95,
    showBouncingCircles: false,
    lineCount: 0,
    lineOpacity: 0.0,
    circleOpacity: 0.0,
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
  );

  /// Preset de lujo avanzado con degradados complejos de múltiples colores
  /// Ideal para pantallas principales y experiencias visuales premium
  static GradientBackgroundPreset get luxurious => GradientBackgroundPreset(
    primaryColor: AppTheme.kMidnightBlue,
    secondaryColor: AppTheme.kDeepBlue,
    accentColor: AppTheme.kDarkGold,
    opacity: 0.95,
    lineCount: 50,
    circleOpacity: 0.38,
  );

  /// Preset diseñado para pantalla de About/Acerca de
  static GradientBackgroundPreset get aboutScreen => GradientBackgroundPreset(
    primaryColor: AppTheme.kBackgroundColor,
    secondaryColor: AppTheme.kSurfaceColor,
    accentColor: AppTheme.kPrimaryColor,
    lineCount: 20,
    lineOpacity: 0.02,
    circleOpacity: 0.25,
  );
}
