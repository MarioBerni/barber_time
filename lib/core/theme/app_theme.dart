import 'package:flutter/material.dart';

import 'app_design_constants.dart';

/// Clase que define el tema global de la aplicación Barber Time.
///
/// Incluye colores, estilos de texto y otros parámetros visuales.
class AppTheme {
  // ======================================================
  // NUEVA PALETA DE COLORES - BARBER TIME MODERN
  // ======================================================

  // Colores principales - Nueva paleta moderna
  /// Color primario principal de la aplicación (Turquesa-menta).
  static const Color kPrimaryColor = Color(0xFF3BBFAD);

  /// Versión oscura del primario, para estados `pressed` o `hover`.
  static const Color kPrimaryDarkColor = Color(0xFF2A8F83);

  /// Versión clara del primario, para `highlights` o fondos sutiles.
  static const Color kPrimaryLightColor = Color(0xFF65D8C8);

  // Colores de acción y énfasis
  /// Color de acento (Naranja terracota).
  /// Usado para precios, ofertas y ratings.
  static const Color kAccentColor = Color(0xFFE57C4B);

  /// Versión oscura del acento, para estados `pressed`.
  static const Color kAccentDarkColor = Color(0xFFD05F2E);

  /// Versión clara del acento, para `highlights` suaves.
  static const Color kAccentLightColor = Color(0xFFF29C74);

  // Base oscura moderna - Negro azulado
  /// Fondo principal de las pantallas (negro azulado).
  static const Color kBackgroundColor = Color(0xFF121212);

  /// Color de superficie para componentes como cards y barras de navegación.
  static const Color kSurfaceColor = Color(0xFF1E1E1E);

  /// Fondo alternativo para diferenciar secciones.
  static const Color kBackgroundAlt = Color(0xFF2A2A2A);

  /// Superficie alternativa para elementos elevados como modales.
  static const Color kSurfaceAlt = Color(0xFF383838);

  // Escala de grises neutral
  /// Tono de gris oscuro.
  static const Color kDarkGray = Color(0xFF2A2A2A);

  /// Tono de gris medio.
  static const Color kMediumGray = Color(0xFF707070);

  /// Tono de gris claro.
  static const Color kLightGray = Color(0xFFAAAAAA);

  /// Tono de gris pálido.
  static const Color kPaleGray = Color(0xFFD8D8D8);

  /// Color casi blanco para textos o fondos muy claros.
  static const Color kOffWhite = Color(0xFFF5F5F5);

  // Colores complementarios para destacados
  /// Color púrpura complementario.
  static const Color kComplementaryColor1 = Color(0xFF8367C7);

  /// Color azul acero complementario.
  static const Color kComplementaryColor2 = Color(0xFF6D9DC5);

  // Colores azules para referencias legacy y compatibilidad
  /// Azul medianoche casi negro.
  static const Color kMidnightBlue = Color(0xFF0F172A);

  /// Azul profundo.
  static const Color kDeepBlue = Color(0xFF1E3A8A);

  /// Azul brillante.
  static const Color kBrightBlue = Color(0xFF3B82F6);

  /// Azul claro.
  static const Color kLightBlue = Color(0xFF60A5FA);

  /// Azul cielo.
  static const Color kSkyBlue = Color(0xFF7DD3FC);

  // Colores dorados para referencias legacy y compatibilidad
  /// Tono de oro oscuro.
  static const Color kDarkGold = Color(0xFFB45309);

  /// Tono de oro medio.
  static const Color kMediumGold = Color(0xFFD97706);

  /// Tono de oro claro.
  static const Color kLightGold = Color(0xFFFBBF24);

  /// Tono ámbar.
  static const Color kAmber = Color(0xFFF59E0B);

  // Colores azules para referencias legacy y compatibilidad
  /// Tono de azul primario (legacy).
  static const Color kBluePrimary = Color(0xFF2563EB);

  /// Tono de azul oscuro (legacy).
  static const Color kBlueDark = Color(0xFF1D4ED8);

  /// Tono de azul claro (legacy).
  static const Color kBlueLight = Color(0xFF60A5FA);

  /// Tono de azul suave (legacy).
  static const Color kBlueSoft = Color(0xFF93C5FD);

  /// Tono de azul pálido (legacy).
  static const Color kBluePale = Color(0xFFBAE6FD);

  // Color terciario para compatibilidad
  /// Color terciario (Púrpura).
  static const Color kTertiaryColor = Color(0xFF8367C7);

  // Escala de grises refinada - Armonía Negro-Gris Premium
  /// Negro puro, para elementos de máximo contraste.
  static const Color kBlackPure = Color(0xFF000000);

  /// Negro profundo, para el fondo principal de la app.
  static const Color kBlackDeep = Color(0xFF0A0A0A);

  /// Tono carbón oscuro, para superficies principales.
  static const Color kCharcoalDark = Color(0xFF1A1A1A);

  /// Tono carbón medio, para cards y contenedores.
  static const Color kCharcoalMedium = Color(0xFF2A2A2A);

  /// Tono carbón claro, para elementos elevados.
  static const Color kCharcoalLight = Color(0xFF3A3A3A);

  /// Tono gris oscuro, para divisores importantes.
  static const Color kGrayDark = Color(0xFF4A4A4A);

  /// Tono gris medio, para elementos secundarios.
  static const Color kGrayMedium = Color(0xFF6A6A6A);

  /// Tono gris claro, para texto secundario.
  static const Color kGrayLight = Color(0xFF8A8A8A);

  /// Tono gris pálido, para placeholders.
  static const Color kGrayPale = Color(0xFFAAAAAA);

  // Textos optimizados para la nueva escala
  /// Color principal para textos (Blanco).
  static const Color kTextColor = Color(0xFFFFFFFF);

  /// Color secundario para textos (Gris claro).
  static const Color kSecondaryTextColor = Color(0xFFE0E0E0);

  /// Color terciario para textos (placeholders).
  static const Color kTertiaryTextColor = Color(0xFFAAAAAA);

  /// Color para divisores.
  static const Color kDividerColor = Color(0xFF4A4A4A);

  /// Color para elementos deshabilitados.
  static const Color kDisabledColor = Color(0xFF6A6A6A);

  // Compatibilidad con colores legacy (usando nueva escala)
  /// Tono carbón (legacy).
  static const Color kCharcoal = Color(0xFF1A1A1A);

  /// Tono gris metálico para detalles (legacy).
  static const Color kMetalGray = Color(0xFF8A8A8A);

  /// Tono gris pizarra para fondos alternativos (legacy).
  static const Color kPearlGray = Color(0xFF2A2A2A);

  /// Tono café oscuro para acentos (legacy).
  static const Color kCoffee = Color(0xFF3D2914);

  /// Tono café muy oscuro (legacy).
  static const Color kCoffeeDark = Color(0xFF2A1C0F);

  /// Tono café claro (legacy).
  static const Color kCoffeeLight = Color(0xFF5C3E2A);

  /// Tono café muy claro (legacy).
  static const Color kCoffeeLighter = Color(0xFF8B6F47);

  /// Tono crema oscuro para superficies (legacy).
  static const Color kCream = Color(0xFF2A2A2A);

  // Colores de estado actualizados (para feedback visual)
  /// Color para indicar éxito (verde).
  static const Color kSuccessColor = Color(0xFF10B981);

  /// Tono oscuro del color de éxito.
  static const Color kSuccessDarkColor = Color(0xFF059669);

  /// Tono claro del color de éxito.
  static const Color kSuccessLightColor = Color(0xFF6EE7B7);

  /// Color para indicar error (rojo).
  static const Color kErrorColor = Color(0xFFEF4444);

  /// Tono oscuro del color de error.
  static const Color kErrorDarkColor = Color(0xFFDC2626);

  /// Tono claro del color de error.
  static const Color kErrorLightColor = Color(0xFFFCA5A5);

  /// Color para indicar advertencia (naranja).
  static const Color kWarningColor = Color(0xFFF59E0B);

  /// Tono oscuro del color de advertencia.
  static const Color kWarningDarkColor = Color(0xFFD97706);

  /// Tono claro del color de advertencia.
  static const Color kWarningLightColor = Color(0xFFFCD34D);

  /// Color para indicar información (azul).
  static const Color kInfoColor = Color(0xFF3B82F6);

  /// Tono oscuro del color de información.
  static const Color kInfoDarkColor = Color(0xFF2563EB);

  /// Tono claro del color de información.
  static const Color kInfoLightColor = Color(0xFF93C5FD);

  // Colores de sombras expandidos
  /// Color base para sombras.
  static const Color kShadowColor = Color(0xFF1A1A1A);

  /// Sombra alternativa con matiz azul.
  static const Color kShadowColorAlt = Color(0xFF2E3A59);

  /// Sombra profunda para efectos dramáticos.
  static const Color kDeepShadowColor = Color(0xFF0F172A);

  // Espaciado
  /// Padding por defecto (16.0).
  static const double kDefaultPadding = 16.0;

  /// Padding pequeño (8.0).
  static const double kSmallPadding = 8.0;

  /// Padding grande (24.0).
  static const double kLargePadding = 24.0;

  // Tamaños de iconos estandarizados
  /// Tamaño de icono pequeño (16.0).
  static const double kIconSizeSmall = 16.0;

  /// Tamaño de icono mediano (20.0).
  static const double kIconSizeMedium = 20.0;

  /// Tamaño de icono por defecto (24.0).
  static const double kIconSizeDefault = 24.0;

  /// Tamaño de icono grande (32.0).
  static const double kIconSizeLarge = 32.0;

  // Tamaños para contenedores de iconos
  /// Tamaño de contenedor de icono pequeño (32.0).
  static const double kIconContainerSizeSmall = 32.0;

  /// Tamaño de contenedor de icono por defecto (40.0).
  static const double kIconContainerSizeDefault = 40.0;

  /// Tamaño de contenedor de icono grande (48.0).
  static const double kIconContainerSizeLarge = 48.0;

  // Radios
  /// Radio de borde por defecto (12.0).
  static const double kDefaultRadius = 12.0;

  /// Radio de borde pequeño (6.0).
  static const double kSmallRadius = 6.0;

  /// Radio de borde grande (20.0).
  static const double kLargeRadius = 20.0;

  /// Tema oscuro principal - BARBER TIME DARK.
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kBackgroundColor,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: kPrimaryColor,
        secondary: kAccentColor,
        surface: kSurfaceColor,
        surfaceContainer: kBackgroundColor,
        onPrimary: kBackgroundColor,
        onSecondary: kBackgroundColor,
        onSurface: kTextColor,
      ),
      textTheme: _darkTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: kTextColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: kPrimaryColor),
      ),
      // Los botones se manejan a través del sistema unificado de componentes
      // EnhancedButton y ThemedButton tienen sus propios estilos
      inputDecorationTheme: InputDecorationTheme(
        fillColor: kSurfaceColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: BorderSide(color: kDividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        contentPadding: const EdgeInsets.all(kDefaultPadding),
        hintStyle: const TextStyle(color: kSecondaryTextColor),
      ),
      cardColor: kSurfaceColor,
      cardTheme: ThemeData.dark().cardTheme.copyWith(
        color: kSurfaceColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
        ),
        shadowColor: kBackgroundColor.withAlpha((0.3 * 255).round()),
      ),
    );
  }

  // Tema de texto para dark theme
  static final TextTheme _darkTextTheme = TextTheme(
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
    bodyLarge: TextStyle(color: kTextColor, fontSize: 16),
    bodyMedium: TextStyle(
      color: kTextColor.withAlpha((0.9 * 255).round()),
      fontSize: 14,
    ),
    bodySmall: TextStyle(color: kSecondaryTextColor, fontSize: 12),
  );

  // Tema de texto para light theme (compatibilidad)
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
    bodyLarge: TextStyle(color: kTextColor, fontSize: 16),
    bodyMedium: TextStyle(
      color: kTextColor.withAlpha((0.9 * 255).round()),
      fontSize: 14,
    ),
    bodySmall: TextStyle(color: kSecondaryTextColor, fontSize: 12),
  );

  /// Tema principal de la aplicación (actualmente el tema oscuro).
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
          borderRadius: BorderRadius.circular(
            AppDesignConstants.borderRadiusMD,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusMD,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: AppDesignConstants.spacingSM,
            horizontal: AppDesignConstants.spacingLG,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: kAccentColor),
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
          borderSide: BorderSide(
            color: kPrimaryColor.withAlpha((0.3 * 255).round()),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: const BorderSide(color: kAccentColor),
        ),
        contentPadding: const EdgeInsets.all(kDefaultPadding),
        hintStyle: TextStyle(
          color: kSecondaryTextColor.withAlpha((0.7 * 255).round()),
        ),
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

  /// Getter para el tema claro, por compatibilidad. Apunta al tema principal.
  static ThemeData get lightTheme => theme;
}
