import 'package:flutter/material.dart';

/// Clase que define el tema global de la aplicación Barber Time
/// Incluye colores, estilos de texto y otros parámetros visuales
class AppTheme {
  // ======================================================
  // PALETA DE COLORES EXPANDIDA - BARBER TIME
  // ======================================================
  
  // Paleta de azules principales (ampliada)
  static const Color kPrimaryColor = Color(0xFF1A56C7);        // Azul principal (original)
  static const Color kPrimaryDarkColor = Color(0xFF0B4AB3);    // Azul oscuro (original)
  static const Color kPrimaryLightColor = Color(0xFF4377D1);   // Azul claro (original)
  
  // Nuevas tonalidades de azul añadidas para crear jerarquía visual
  static const Color kMidnightBlue = Color(0xFF001233);        // Azul muy oscuro (casi negro)
  static const Color kDeepBlue = Color(0xFF023E7D);            // Azul profundo
  static const Color kBrightBlue = Color(0xFF0466C8);          // Azul brillante
  static const Color kLightBlue = Color(0xFF0582CA);           // Azul celeste
  static const Color kSkyBlue = Color(0xFF80B3FF);             // Azul cielo

  // Colores de superficie y fondo
  static const Color kBackgroundColor = Color(0xFFF5F7FA);     // Fondo claro con matiz azul (original)
  static const Color kSurfaceColor = Color(0xFFFFFFFF);        // Superficie de componentes (original)
  static const Color kBackgroundAlt = Color(0xFFEEF2F6);       // Fondo alternativo
  static const Color kSurfaceAlt = Color(0xFFF9FAFC);          // Superficie alternativa
  
  // Acento dorado y variaciones (ampliado)
  static const Color kAccentColor = Color(0xFFFDC500);          // Dorado principal (original)
  static const Color kAccentDarkColor = Color(0xFFE9B400);      // Dorado oscuro (original)
  static const Color kAccentLightColor = Color(0xFFFFD33C);     // Dorado claro (original)
  
  // Nuevas tonalidades de dorado/ámbar
  static const Color kDarkGold = Color(0xFFD4A017);            // Dorado oscuro premium
  static const Color kMediumGold = Color(0xFFEDBC00);          // Dorado medio
  static const Color kLightGold = Color(0xFFFFD700);           // Dorado claro brillante
  static const Color kAmber = Color(0xFFF0C870);               // Ámbar suave

  // Colores complementarios (armónicos con azul y dorado)
  static const Color kComplementaryColor1 = Color(0xFF5C89C7);  // Azul medio complementario
  static const Color kComplementaryColor2 = Color(0xFFF7B84B);  // Naranja complementario 
  static const Color kTertiaryColor = Color(0xFF70B0F8);       // Azul claro terciario
  
  // Colores neutros expandidos (escala de grises profesional)
  static const Color kTextColor = Color(0xFF212B36);            // Texto principal (original)
  static const Color kSecondaryTextColor = Color(0xFF637381);   // Texto secundario (original)
  static const Color kDividerColor = Color(0xFFE2E8F0);         // Divisores (original)
  static const Color kDisabledColor = Color(0xFFCBD5E1);        // Elementos deshabilitados (original)
  
  // Nuevos colores neutros para mayor versatilidad
  static const Color kCharcoal = Color(0xFF303841);             // Gris carbón para alto contraste
  static const Color kMetalGray = Color(0xFF7D8597);           // Gris metálico para bordes y detalles
  static const Color kPearlGray = Color(0xFFE0E1DD);           // Gris perla para fondos alternativos
  static const Color kCoffee = Color(0xFF4F3621);              // Café oscuro complementario
  static const Color kCoffeeDark = Color(0xFF3A2A1C);          // Café oscuro intenso
  static const Color kCoffeeLight = Color(0xFF6B4B2F);         // Café claro
  static const Color kCoffeeLighter = Color(0xFF8C6B43);       // Café claro cálido
  static const Color kCream = Color(0xFFF8F5F0);               // Crema para fondos suaves
  
  // Colores de estado (para feedback visual)
  static const Color kSuccessColor = Color(0xFF10B981);          // Éxito (verde)
  static const Color kSuccessDarkColor = Color(0xFF059669);      // Éxito oscuro
  static const Color kSuccessLightColor = Color(0xFF6EE7B7);     // Éxito claro
  
  static const Color kErrorColor = Color(0xFFEF4444);            // Error (rojo)
  static const Color kErrorDarkColor = Color(0xFFDC2626);        // Error oscuro
  static const Color kErrorLightColor = Color(0xFFFCA5A5);       // Error claro
  
  static const Color kWarningColor = Color(0xFFF59E0B);          // Advertencia (naranja)
  static const Color kWarningDarkColor = Color(0xFFD97706);      // Advertencia oscura
  static const Color kWarningLightColor = Color(0xFFFCD34D);     // Advertencia clara
  
  static const Color kInfoColor = Color(0xFF3B82F6);             // Información (azul)
  static const Color kInfoDarkColor = Color(0xFF2563EB);         // Información oscura
  static const Color kInfoLightColor = Color(0xFF93C5FD);        // Información clara
  
  // Colores de sombras expandidos
  static const Color kShadowColor = Color(0xFF1A1A1A);           // Color base para sombras (original)
  static const Color kShadowColorAlt = Color(0xFF2E3A59);        // Sombra alternativa con matiz azul
  static const Color kDeepShadowColor = Color(0xFF0F172A);       // Sombra profunda para efectos dramáticos

  // Tamaños de fuente para utilizar en toda la aplicación
  static const double kFontSizeH1 = 28;
  static const double kFontSizeH2 = 24;
  static const double kFontSizeH3 = 20;
  static const double kFontSizeH4 = 18;
  static const double kFontSizeBody = 16;
  static const double kFontSizeBodySmall = 14;
  static const double kFontSizeCaption = 12;
  
  // Tamaños de iconos estandarizados
  static const double kIconSizeSmall = 18;      // Iconos pequeños (indicadores)
  static const double kIconSizeMedium = 20;     // Iconos medianos (complementarios)
  static const double kIconSizeDefault = 24;    // Iconos estándar (navegación, acciones principales)
  static const double kIconSizeLarge = 32;      // Iconos grandes (destacados)
  
  // Tamaños para contenedores de iconos (botones circulares, etc.)
  static const double kIconContainerSizeSmall = 32;   // Contenedores pequeños para iconos
  static const double kIconContainerSizeDefault = 40; // Contenedores estándar para iconos
  static const double kIconContainerSizeLarge = 48;   // Contenedores grandes para iconos

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
        surface: kBackgroundColor,
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
        fillColor: kBackgroundColor.withAlpha((0.7 * 255).round()),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: BorderSide(color: kPrimaryColor.withAlpha((0.3 * 255).round())),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: const BorderSide(color: kAccentColor),
        ),
        contentPadding: const EdgeInsets.all(kDefaultPadding),
        hintStyle: TextStyle(color: kSecondaryTextColor.withAlpha((0.7 * 255).round())),
      ),
      // Configuración de tarjetas como parte del tema usando propiedades individuales
      // para evitar problemas de compatibilidad entre versiones de Flutter
      cardColor: kPrimaryColor.withAlpha((0.2 * 255).round()),
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
      color: kTextColor.withAlpha((0.9 * 255).round()),
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
        surface: kBackgroundColor,
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
          borderSide: BorderSide(color: kPrimaryColor.withAlpha((0.3 * 255).round())),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: const BorderSide(color: kAccentColor),
        ),
        contentPadding: const EdgeInsets.all(kDefaultPadding),
        hintStyle: TextStyle(color: kSecondaryTextColor.withAlpha((0.7 * 255).round())),
      ),
      cardColor: kSurfaceColor,
      cardTheme: ThemeData.light().cardTheme.copyWith(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
        ),
        shadowColor: kPrimaryColor.withAlpha((0.1 * 255).round()),
      ),
    );
  }
  
  // Para mantener compatibilidad con código existente
  static ThemeData get lightTheme => theme;
}
