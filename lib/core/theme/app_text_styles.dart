import 'package:flutter/material.dart';
import 'app_theme.dart';

/// Clase que centraliza todos los estilos de texto de la aplicación
/// Proporciona constantes para usar en toda la app, garantizando consistencia visual
class AppTextStyles {
  // Encabezados
  static TextStyle get h1 => const TextStyle(
        color: AppTheme.kTextColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
      );

  static TextStyle get h2 => const TextStyle(
        color: AppTheme.kTextColor,
        fontSize: 26,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.3,
      );

  static TextStyle get h3 => const TextStyle(
        color: AppTheme.kTextColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get h4 => const TextStyle(
        color: AppTheme.kTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get h5 => const TextStyle(
        color: AppTheme.kTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  // Cuerpo de texto
  static TextStyle get bodyLarge => const TextStyle(
        color: AppTheme.kTextColor,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get bodyMedium => const TextStyle(
        color: AppTheme.kTextColor,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get bodySmall => const TextStyle(
        color: AppTheme.kSecondaryTextColor,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      );

  // Textos especiales
  static TextStyle get caption => const TextStyle(
        color: AppTheme.kSecondaryTextColor,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.2,
      );

  static TextStyle get button => const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      );

  static TextStyle get buttonSmall => const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      );

  // Textos con énfasis
  static TextStyle get link => const TextStyle(
        color: AppTheme.kAccentColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
      );

  static TextStyle get emphasis => const TextStyle(
        color: AppTheme.kTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      );

  // Variaciones de color
  static TextStyle get error => bodyMedium.copyWith(
        color: AppTheme.kErrorColor,
      );

  static TextStyle get success => bodyMedium.copyWith(
        color: AppTheme.kSuccessColor,
      );

  static TextStyle get warning => bodyMedium.copyWith(
        color: AppTheme.kWarningColor,
      );

  // Funciones útiles para modificar estilos
  static TextStyle withColor(TextStyle base, Color color) {
    return base.copyWith(color: color);
  }

  static TextStyle withWeight(TextStyle base, FontWeight weight) {
    return base.copyWith(fontWeight: weight);
  }

  static TextStyle withSize(TextStyle base, double size) {
    return base.copyWith(fontSize: size);
  }
}
