import 'package:flutter/material.dart';

import 'app_theme.dart';

/// Constantes de diseño unificadas para toda la aplicación
/// Elimina duplicaciones y mantiene consistencia visual
class AppDesignConstants {
  // Privado para evitar instanciación
  AppDesignConstants._();

  // ===== ESPACIADO =====

  /// Espaciado mínimo (4px)
  static const double spacingXXS = 4.0;

  /// Espaciado extra pequeño (8px)
  static const double spacingXS = 8.0;

  /// Espaciado pequeño (12px)
  static const double spacingSM = 12.0;

  /// Espaciado medio (16px) - Estándar entre elementos
  static const double spacingMD = 16.0;

  /// Espaciado grande (24px) - Entre secciones
  static const double spacingLG = 24.0;

  /// Espaciado extra grande (32px) - Entre bloques principales
  static const double spacingXL = 32.0;

  /// Espaciado extra extra grande (48px) - Entre secciones principales
  static const double spacingXXL = 48.0;

  // ===== BORDES =====

  /// Radio de borde pequeño (8px)
  static const double borderRadiusSM = 8.0;

  /// Radio de borde medio (12px) - Estándar
  static const double borderRadiusMD = 12.0;

  /// Radio de borde grande (16px)
  static const double borderRadiusLG = 16.0;

  /// Radio de borde extra grande (20px)
  static const double borderRadiusXL = 20.0;

  /// Radio de borde extra extra grande (24px)
  static const double borderRadiusXXL = 24.0;

  /// Radio de borde circular (50%)
  static const double borderRadiusCircular = 50.0;

  /// Radio de borde extra pequeño (4px)
  static const double borderRadiusXS = 4.0;

  /// Radio de borde pequeño (6px)
  static const double borderRadiusSM2 = 6.0;

  // ===== ALTURAS =====

  /// Altura de botón compacto (40px)
  static const double buttonHeightCompact = 40.0;

  /// Altura de botón estándar (48px)
  static const double buttonHeightStandard = 48.0;

  /// Altura de botón grande (56px)
  static const double buttonHeightLarge = 56.0;

  /// Altura de botón extra grande (62px)
  static const double buttonHeightSubmit = 62.0;

  /// Altura de botón extra grande (64px)
  static const double buttonHeightXL = 64.0;

  // ===== PADDING =====

  /// Padding compacto (8px)
  static const EdgeInsets paddingCompact = EdgeInsets.all(8.0);

  /// Padding pequeño (12px)
  static const EdgeInsets paddingSM = EdgeInsets.all(12.0);

  /// Padding estándar (16px)
  static const EdgeInsets paddingMD = EdgeInsets.all(16.0);

  /// Padding grande (20px)
  static const EdgeInsets paddingLG = EdgeInsets.all(20.0);

  /// Padding extra grande (24px)
  static const EdgeInsets paddingXL = EdgeInsets.all(24.0);

  /// Padding horizontal estándar
  static const EdgeInsets paddingHorizontal = EdgeInsets.symmetric(
    horizontal: 16.0,
  );

  /// Padding vertical estándar
  static const EdgeInsets paddingVertical = EdgeInsets.symmetric(
    vertical: 16.0,
  );

  // ===== MARGENES =====

  /// Margen estándar
  static const EdgeInsets marginStandard = EdgeInsets.all(16.0);

  /// Margen grande
  static const EdgeInsets marginLG = EdgeInsets.all(24.0);

  /// Margen horizontal estándar
  static const EdgeInsets marginHorizontal = EdgeInsets.symmetric(
    horizontal: 16.0,
  );

  /// Margen vertical estándar
  static const EdgeInsets marginVertical = EdgeInsets.symmetric(vertical: 16.0);

  // ===== SOMBRAS =====

  /// Sombra sutil
  static List<BoxShadow> get shadowSubtle => [
    BoxShadow(
      color: AppTheme.kBackgroundColor.withAlpha(51),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  /// Sombra estándar
  static List<BoxShadow> get shadowStandard => [
    BoxShadow(
      color: AppTheme.kBackgroundColor.withAlpha(77),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  /// Sombra pronunciada
  static List<BoxShadow> get shadowPronounced => [
    BoxShadow(
      color: AppTheme.kBackgroundColor.withAlpha(102),
      blurRadius: 12,
      offset: const Offset(0, 6),
    ),
  ];

  // ===== DECORACIONES PREDEFINIDAS =====

  /// Decoración de contenedor estándar
  static BoxDecoration get containerDecoration => BoxDecoration(
    color: AppTheme.kSurfaceColor.withAlpha(102),
    borderRadius: BorderRadius.circular(borderRadiusMD),
    border: Border.all(color: AppTheme.kPrimaryColor.withAlpha(26)),
  );

  /// Decoración de contenedor con sombra
  static BoxDecoration get containerWithShadow => BoxDecoration(
    color: AppTheme.kSurfaceColor.withAlpha(102),
    borderRadius: BorderRadius.circular(borderRadiusMD),
    border: Border.all(color: AppTheme.kPrimaryColor.withAlpha(26)),
    boxShadow: shadowSubtle,
  );

  /// Decoración de botón estándar
  static BoxDecoration get buttonDecoration => BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadiusMD),
    gradient: LinearGradient(
      colors: [AppTheme.kPrimaryColor, AppTheme.kPrimaryDarkColor],
    ),
  );

  /// Decoración de campo de texto
  static BoxDecoration get textFieldDecoration => BoxDecoration(
    color: AppTheme.kSurfaceColor.withAlpha(102),
    borderRadius: BorderRadius.circular(borderRadiusMD),
    border: Border.all(color: AppTheme.kSurfaceColor.withAlpha(102)),
  );

  // ===== WIDGETS PREDEFINIDOS =====

  /// Espaciador estándar
  static const Widget spacer = SizedBox(height: spacingMD);

  /// Espaciador grande
  static const Widget spacerLG = SizedBox(height: spacingLG);

  /// Espaciador extra grande
  static const Widget spacerXL = SizedBox(height: spacingXL);

  /// Espaciador horizontal estándar
  static const Widget spacerHorizontal = SizedBox(width: spacingMD);

  /// Espaciador horizontal grande
  static const Widget spacerHorizontalLG = SizedBox(width: spacingLG);

  // ===== DURACIONES DE ANIMACIÓN =====

  /// Duración de animación rápida
  static const Duration animationFast = Duration(milliseconds: 200);

  /// Duración de animación estándar
  static const Duration animationStandard = Duration(milliseconds: 300);

  /// Duración de animación lenta
  static const Duration animationSlow = Duration(milliseconds: 500);

  // ===== CURVAS DE ANIMACIÓN =====

  /// Curva estándar
  static const Curve curveStandard = Curves.easeInOut;

  /// Curva suave
  static const Curve curveSmooth = Curves.easeOutCubic;

  /// Curva elástica
  static const Curve curveElastic = Curves.elasticOut;

  // ===== TAMAÑOS DE ICONOS =====

  /// Tamaño de icono pequeño
  static const double iconSizeSM = 16.0;

  /// Tamaño de icono estándar
  static const double iconSizeMD = 20.0;

  /// Tamaño de icono grande
  static const double iconSizeLG = 24.0;

  /// Tamaño de icono extra grande
  static const double iconSizeXL = 32.0;

  // ===== OPACIDADES =====

  /// Opacidad muy baja
  static const double opacityVeryLow = 0.1;

  /// Opacidad baja
  static const double opacityLow = 0.3;

  /// Opacidad media
  static const double opacityMedium = 0.5;

  /// Opacidad alta
  static const double opacityHigh = 0.7;

  /// Opacidad muy alta
  static const double opacityVeryHigh = 0.9;

  // ===== MÉTODOS UTILITARIOS =====

  /// Convierte opacidad a valor alpha
  static int opacityToAlpha(double opacity) => (opacity * 255).round();

  /// Crea color con opacidad
  static Color colorWithOpacity(Color color, double opacity) =>
      color.withAlpha(opacityToAlpha(opacity));

  /// Crea border radius estándar
  static BorderRadius get standardBorderRadius =>
      BorderRadius.circular(borderRadiusMD);

  /// Crea border radius circular
  static BorderRadius get circularBorderRadius =>
      BorderRadius.circular(borderRadiusCircular);

  // ===== CONSTANTES ESPECÍFICAS PARA COMPONENTES =====

  /// Radio de borde para diálogos
  static BorderRadius get dialogBorderRadius =>
      BorderRadius.circular(borderRadiusXXL);

  /// Radio de borde para badges
  static BorderRadius get badgeBorderRadius =>
      BorderRadius.circular(borderRadiusXS);

  /// Radio de borde para chips
  static BorderRadius get chipBorderRadius =>
      BorderRadius.circular(borderRadiusSM2);

  /// Radio de borde para elementos premium
  static BorderRadius get premiumBorderRadius =>
      BorderRadius.circular(borderRadiusLG);

  /// Radio de borde para elementos de navegación
  static BorderRadius get navigationBorderRadius =>
      BorderRadius.circular(borderRadiusSM);

  // ===== DECORACIONES ESPECÍFICAS =====

  /// Decoración para elementos premium
  static BoxDecoration get premiumDecoration => BoxDecoration(
    borderRadius: premiumBorderRadius,
    gradient: LinearGradient(
      colors: [AppTheme.kAccentColor, AppTheme.kAccentDarkColor],
    ),
    boxShadow: shadowStandard,
  );

  /// Decoración para diálogos
  static BoxDecoration get dialogDecoration => BoxDecoration(
    color: AppTheme.kSurfaceColor.withAlpha(204),
    borderRadius: dialogBorderRadius,
    boxShadow: shadowPronounced,
  );

  /// Decoración para badges
  static BoxDecoration get badgeDecoration => BoxDecoration(
    color: AppTheme.kPrimaryColor,
    borderRadius: badgeBorderRadius,
  );

  /// Decoración para chips
  static BoxDecoration get chipDecoration => BoxDecoration(
    color: AppTheme.kSurfaceColor.withAlpha(102),
    borderRadius: chipBorderRadius,
    border: Border.all(color: AppTheme.kPrimaryColor.withAlpha(51)),
  );
}
