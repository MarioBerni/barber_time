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
      
  static TextStyle get captionMuted => const TextStyle(
        color: AppTheme.kMetalGray, // Usando el nuevo color gris metálico
        fontSize: 11,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.2,
      );
      
  static TextStyle get label => const TextStyle(
        color: AppTheme.kCharcoal, // Usando el nuevo color carbón para etiquetas
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
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
        color: AppTheme.kBrightBlue, // Usando el nuevo color brillante para links
        fontSize: 14,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
      );
      
  static TextStyle get linkGold => const TextStyle(
        color: AppTheme.kDarkGold, // Usando el nuevo color dorado premium para links especiales
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
  // Estilos con colores de estado
  static TextStyle get error => bodyMedium.copyWith(
        color: AppTheme.kErrorColor,
      );
  
  static TextStyle get errorLight => bodyMedium.copyWith(
        color: AppTheme.kErrorLightColor,
      );

  static TextStyle get success => bodyMedium.copyWith(
        color: AppTheme.kSuccessColor,
      );
  
  static TextStyle get successLight => bodyMedium.copyWith(
        color: AppTheme.kSuccessLightColor,
      );

  static TextStyle get warning => bodyMedium.copyWith(
        color: AppTheme.kWarningColor,
      );
  
  static TextStyle get warningLight => bodyMedium.copyWith(
        color: AppTheme.kWarningLightColor,
      );
      
  static TextStyle get info => bodyMedium.copyWith(
        color: AppTheme.kInfoColor,
      );
      
  // Nuevos estilos con la paleta ampliada
  static TextStyle get premium => bodyMedium.copyWith(
        color: AppTheme.kDarkGold,
        fontWeight: FontWeight.w600,
      );
      
  static TextStyle get accent => bodyMedium.copyWith(
        color: AppTheme.kAccentColor,
      );
      
  static TextStyle get highlight => bodyMedium.copyWith(
        color: AppTheme.kBrightBlue,
        fontWeight: FontWeight.w500,
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
