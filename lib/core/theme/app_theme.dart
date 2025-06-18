import 'package:flutter/material.dart';

/// Clase que define el tema global de la aplicación Barber Time
/// Incluye colores, estilos de texto y otros parámetros visuales
class AppTheme {
  // Paleta de colores principal
  static const Color kPrimaryColor = Color(0xFF1A56C7);      // Azul principal
  static const Color kPrimaryDarkColor = Color(0xFF0B4AB3);   // Azul oscuro (para hover/presionado)
  static const Color kPrimaryLightColor = Color(0xFF4377D1);   // Azul claro (para bordes/detalles)
  static const Color kBackgroundColor = Color(0xFFF5F7FA);    // Fondo claro con matiz azul
  static const Color kSurfaceColor = Color(0xFFFFFFFF);       // Superficie de componentes
  
  // Acento dorado y variaciones
  static const Color kAccentColor = Color(0xFFFDC500);        // Dorado principal
  static const Color kAccentDarkColor = Color(0xFFE9B400);    // Dorado oscuro (hover/presionado)
  static const Color kAccentLightColor = Color(0xFFFFD33C);    // Dorado claro (para destacar)

  // Colores complementarios (armónicos con azul y dorado)
  static const Color kComplementaryColor1 = Color(0xFF5C89C7); // Azul medio complementario
  static const Color kComplementaryColor2 = Color(0xFFF7B84B); // Naranja complementario 
  static const Color kTertiaryColor = Color(0xFF70B0F8);      // Azul claro terciario
  
  // Colores neutros
  static const Color kTextColor = Color(0xFF212B36);          // Texto principal
  static const Color kSecondaryTextColor = Color(0xFF637381);  // Texto secundario
  static const Color kDividerColor = Color(0xFFE2E8F0);        // Divisores
  static const Color kDisabledColor = Color(0xFFCBD5E1);       // Elementos deshabilitados
  
  // Colores de estado
  static const Color kSuccessColor = Color(0xFF10B981);        // Éxito (verde)
  static const Color kErrorColor = Color(0xFFEF4444);          // Error (rojo)
  static const Color kWarningColor = Color(0xFFF59E0B);        // Advertencia (naranja)
  static const Color kInfoColor = Color(0xFF3B82F6);           // Información (azul)
  
  // Colores de sombras
  static const Color kShadowColor = Color(0xFF1A1A1A);         // Color base para sombras

  // Espaciado
  static const double kDefaultPadding = 16.0;
  static const double kSmallPadding = 8.0;
  static const double kLargePadding = 24.0;

  // Radios
  static const double kDefaultRadius = 12.0;
  static const double kSmallRadius = 6.0;
  static const double kLargeRadius = 20.0;

  // Tema oscuro de la aplicación
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
  
  // Tema de la aplicación
  static ThemeData get theme {
    return ThemeData.light().copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kBackgroundColor,
      colorScheme: const ColorScheme.light().copyWith(
        primary: kPrimaryColor,
        secondary: kAccentColor,
        background: kBackgroundColor,
      ),
      textTheme: _textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.white),
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
          foregroundColor: Colors.white,
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
        fillColor: kSurfaceColor,
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
      cardColor: kSurfaceColor,
      cardTheme: ThemeData.light().cardTheme.copyWith(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
        ),
        shadowColor: kPrimaryColor.withOpacity(0.1),
      ),
    );
  }
  
  // Para mantener compatibilidad con código existente
  static ThemeData get lightTheme => theme;
}
