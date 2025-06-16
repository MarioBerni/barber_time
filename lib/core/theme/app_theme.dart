import 'package:flutter/material.dart';

/// Clase que define el tema global de la aplicación Barber Time
/// Incluye colores, estilos de texto y otros parámetros visuales
class AppTheme {
  // Constantes de Color
  static const Color kPrimaryColor = Color(0xFF00296B);
  static const Color kBackgroundColor = Color(0xFF001B4D);
  static const Color kAccentColor = Color(0xFFFDC500);
  static const Color kTextColor = Color(0xFFFFFFFF);
  static const Color kSecondaryTextColor = Color(0xFFB0BAC5);

  // Espaciado
  static const double kDefaultPadding = 16.0;
  static const double kSmallPadding = 8.0;
  static const double kLargePadding = 24.0;

  // Radios
  static const double kDefaultRadius = 12.0;
  static const double kSmallRadius = 6.0;
  static const double kLargeRadius = 20.0;

  // Tema de la aplicación
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kBackgroundColor,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: kPrimaryColor,
        secondary: kAccentColor,
        background: kBackgroundColor,
      ),
      textTheme: _textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: kTextColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          foregroundColor: kTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDefaultRadius),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 20.0,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: kAccentColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: kBackgroundColor.withOpacity(0.7),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: BorderSide(color: kPrimaryColor.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: const BorderSide(color: kAccentColor),
        ),
        contentPadding: const EdgeInsets.all(kDefaultPadding),
        hintStyle: TextStyle(color: kSecondaryTextColor.withOpacity(0.7)),
      ),
      // Configuración de tarjetas como parte del tema usando propiedades individuales
      // para evitar problemas de compatibilidad entre versiones de Flutter
      cardColor: kPrimaryColor.withOpacity(0.2),
      cardTheme: ThemeData.dark().cardTheme.copyWith(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
        ),
      ),
    );
  }

  // Tema de texto
  static final TextTheme _textTheme = TextTheme(
    displayLarge: const TextStyle(
      color: kTextColor,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: const TextStyle(
      color: kTextColor,
      fontSize: 26,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: const TextStyle(
      color: kTextColor,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: const TextStyle(
      color: kTextColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: kTextColor,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: kTextColor.withOpacity(0.9),
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      color: kSecondaryTextColor,
      fontSize: 12,
    ),
  );
}
