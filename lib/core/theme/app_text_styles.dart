import 'package:flutter/material.dart';
import 'app_theme.dart';

/// Clase que centraliza todos los estilos de texto de la aplicación.
///
/// Proporciona constantes para usar en toda la app, garantizando
/// consistencia visual.
class AppTextStyles {
  // Encabezados
  /// Estilo para el encabezado más importante (ej. títulos de página).
  static TextStyle get h1 => const TextStyle(
    color: AppTheme.kTextColor,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  /// Estilo para encabezados de segundo nivel.
  static TextStyle get h2 => const TextStyle(
    color: AppTheme.kTextColor,
    fontSize: 26,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.3,
  );

  /// Estilo para encabezados de tercer nivel.
  static TextStyle get h3 => const TextStyle(
    color: AppTheme.kTextColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  /// Estilo para encabezados de cuarto nivel (ej. títulos de sección).
  static TextStyle get h4 => const TextStyle(
    color: AppTheme.kTextColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  /// Estilo para encabezados de quinto nivel (ej. subtítulos de sección).
  static TextStyle get h5 => const TextStyle(
    color: AppTheme.kTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  // Cuerpo de texto
  /// Estilo para el cuerpo de texto principal con tamaño grande.
  static TextStyle get bodyLarge => const TextStyle(
    color: AppTheme.kTextColor,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  /// Estilo para el cuerpo de texto estándar.
  static TextStyle get bodyMedium => const TextStyle(
    color: AppTheme.kTextColor,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  /// Estilo para el cuerpo de texto pequeño y secundario.
  static TextStyle get bodySmall => const TextStyle(
    color: AppTheme.kSecondaryTextColor,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  // Textos especiales
  /// Estilo para leyendas o texto informativo de apoyo.
  static TextStyle get caption => const TextStyle(
    color: AppTheme.kSecondaryTextColor,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.2,
  );

  /// Estilo para leyendas con un color más atenuado.
  static TextStyle get captionMuted => const TextStyle(
    color: AppTheme.kMetalGray, // Usando el nuevo color gris metálico
    fontSize: 11,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.2,
  );

  /// Estilo para etiquetas, con un peso visual mayor.
  static TextStyle get label => const TextStyle(
    color: AppTheme.kCharcoal, // Usando el nuevo color carbón para etiquetas
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  /// Estilo de texto para botones.
  static TextStyle get button => const TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  /// Estilo de texto para botones pequeños.
  static TextStyle get buttonSmall => const TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  // Textos con énfasis
  /// Estilo para enlaces de texto.
  static TextStyle get link => const TextStyle(
    color: AppTheme.kBrightBlue, // Usando el color brillante para links
    fontSize: 14,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );

  /// Estilo para enlaces de texto con color dorado.
  static TextStyle get linkGold => const TextStyle(
    color: AppTheme.kDarkGold,
    // Usando el color dorado premium para links especiales
    fontSize: 14,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );

  /// Estilo para texto con énfasis (itálica).
  static TextStyle get emphasis => const TextStyle(
    color: AppTheme.kTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  // Variaciones de color
  // Estilos con colores de estado
  /// Estilo de texto para mensajes de error.
  static TextStyle get error =>
      bodyMedium.copyWith(color: AppTheme.kErrorColor);

  /// Estilo de texto para mensajes de error con color claro.
  static TextStyle get errorLight =>
      bodyMedium.copyWith(color: AppTheme.kErrorLightColor);

  /// Estilo de texto para mensajes de éxito.
  static TextStyle get success =>
      bodyMedium.copyWith(color: AppTheme.kSuccessColor);

  /// Estilo de texto para mensajes de éxito con color claro.
  static TextStyle get successLight =>
      bodyMedium.copyWith(color: AppTheme.kSuccessLightColor);

  /// Estilo de texto para mensajes de advertencia.
  static TextStyle get warning =>
      bodyMedium.copyWith(color: AppTheme.kWarningColor);

  /// Estilo de texto para mensajes de advertencia con color claro.
  static TextStyle get warningLight =>
      bodyMedium.copyWith(color: AppTheme.kWarningLightColor);

  /// Estilo de texto para mensajes informativos.
  static TextStyle get info => bodyMedium.copyWith(color: AppTheme.kInfoColor);

  // Nuevos estilos con la paleta ampliada
  /// Estilo para texto premium, usando color dorado.
  static TextStyle get premium => bodyMedium.copyWith(
    color: AppTheme.kDarkGold,
    fontWeight: FontWeight.w600,
  );

  /// Estilo de texto con el color de acento principal.
  static TextStyle get accent =>
      bodyMedium.copyWith(color: AppTheme.kAccentColor);

  /// Estilo de texto para resaltar información, usando azul brillante.
  static TextStyle get highlight => bodyMedium.copyWith(
    color: AppTheme.kBrightBlue,
    fontWeight: FontWeight.w500,
  );

  // Funciones útiles para modificar estilos
  /// Retorna un nuevo estilo de texto basado en [base] con un [color] nuevo.
  static TextStyle withColor(TextStyle base, Color color) {
    return base.copyWith(color: color);
  }

  /// Retorna un nuevo estilo de texto basado en [base] con un [weight] nuevo.
  static TextStyle withWeight(TextStyle base, FontWeight weight) {
    return base.copyWith(fontWeight: weight);
  }

  /// Retorna un nuevo estilo de texto basado en [base] con un [size] nuevo.
  static TextStyle withSize(TextStyle base, double size) {
    return base.copyWith(fontSize: size);
  }
}
