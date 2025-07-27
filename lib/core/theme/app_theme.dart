import 'package:flutter/material.dart';

/// Clase que define el tema global de la aplicación Barber Time
/// Incluye colores, estilos de texto y otros parámetros visuales
class AppTheme {
  // ======================================================
  // PALETA DE COLORES DARK - BARBER TIME PREMIUM
  // ======================================================
  
  // Paleta de dorados principales (reemplaza azules)
  static const Color kPrimaryColor = Color(0xFFD4AF37);        // Oro clásico principal
  static const Color kPrimaryDarkColor = Color(0xFFB8860B);    // Oro oscuro
  static const Color kPrimaryLightColor = Color(0xFFE6C757);   // Oro claro
  
  // Tonalidades de dorado para jerarquía visual
  static const Color kMidnightBlue = Color(0xFF0A0A0A);        // Negro profundo (fondo principal)
  static const Color kDeepBlue = Color(0xFF1A1A1A);            // Negro carbón (superficies)
  static const Color kBrightBlue = Color(0xFFCD7F32);          // Bronce brillante
  static const Color kLightBlue = Color(0xFFDDC371);           // Oro muy claro
  static const Color kSkyBlue = Color(0xFFF4E99B);             // Oro pálido

  // Colores de superficie y fondo - DARK THEME
  static const Color kBackgroundColor = Color(0xFF0A0A0A);     // Fondo negro profundo
  static const Color kSurfaceColor = Color(0xFF1A1A1A);        // Superficie de componentes oscura
  static const Color kBackgroundAlt = Color(0xFF2A2A2A);       // Fondo alternativo (tarjetas)
  static const Color kSurfaceAlt = Color(0xFF333333);          // Superficie alternativa (elevados)
  
  // Acento dorado refinado para tema dark
  static const Color kAccentColor = Color(0xFFD4AF37);          // Oro clásico principal
  static const Color kAccentDarkColor = Color(0xFFB8860B);      // Oro oscuro profundo
  static const Color kAccentLightColor = Color(0xFFE6C757);     // Oro claro elegante
  
  // Tonalidades de dorado premium para dark theme
  static const Color kDarkGold = Color(0xFFB8860B);            // Oro oscuro intenso
  static const Color kMediumGold = Color(0xFFD4AF37);          // Oro medio clásico
  static const Color kLightGold = Color(0xFFE6C757);           // Oro claro suave
  static const Color kAmber = Color(0xFFCD7F32);               // Bronce ámbar

  // Colores azules elegantes - Nueva paleta premium
  static const Color kBluePrimary = Color(0xFF2196F3);          // Azul principal elegante
  static const Color kBlueDark = Color(0xFF1976D2);             // Azul oscuro  
  static const Color kBlueLight = Color(0xFF64B5F6);            // Azul claro
  static const Color kBlueSoft = Color(0xFF90CAF9);             // Azul suave
  static const Color kBluePale = Color(0xFFBBDEFB);             // Azul pálido
  
  // Colores complementarios (armónicos con dark theme, dorado y turquesa)
  static const Color kComplementaryColor1 = Color(0xFF8A8A8A);  // Gris plateado complementario
  static const Color kComplementaryColor2 = Color(0xFFCD7F32);  // Bronce complementario 
  static const Color kTertiaryColor = Color(0xFF4A4A4A);       // Gris carbón terciario
  
  // Escala de grises refinada - Armonía Negro-Gris Premium
  static const Color kBlackPure = Color(0xFF000000);           // Negro puro - Elementos de máximo contraste
  static const Color kBlackDeep = Color(0xFF0A0A0A);           // Negro profundo - Fondo principal
  static const Color kCharcoalDark = Color(0xFF1A1A1A);        // Carbón oscuro - Superficies principales
  static const Color kCharcoalMedium = Color(0xFF2A2A2A);      // Carbón medio - Cards y contenedores
  static const Color kCharcoalLight = Color(0xFF3A3A3A);       // Carbón claro - Elementos elevados
  static const Color kGrayDark = Color(0xFF4A4A4A);           // Gris oscuro - Divisores importantes
  static const Color kGrayMedium = Color(0xFF6A6A6A);         // Gris medio - Elementos secundarios
  static const Color kGrayLight = Color(0xFF8A8A8A);          // Gris claro - Texto secundario
  static const Color kGrayPale = Color(0xFFAAAAAA);           // Gris pálido - Placeholders
  
  // Textos optimizados para la nueva escala
  static const Color kTextColor = Color(0xFFFFFFFF);            // Texto principal blanco
  static const Color kSecondaryTextColor = Color(0xFFE0E0E0);   // Texto secundario gris claro
  static const Color kTertiaryTextColor = Color(0xFFAAAAAA);    // Texto terciario (placeholders)
  static const Color kDividerColor = Color(0xFF4A4A4A);         // Divisores con nueva escala
  static const Color kDisabledColor = Color(0xFF6A6A6A);        // Elementos deshabilitados
  
  // Compatibilidad con colores legacy (usando nueva escala)
  static const Color kCharcoal = Color(0xFF1A1A1A);             // Charcoal oscuro
  static const Color kMetalGray = Color(0xFF8A8A8A);           // Gris plateado para detalles
  static const Color kPearlGray = Color(0xFF2A2A2A);           // Gris pizarra para fondos alternativos
  static const Color kCoffee = Color(0xFF3D2914);              // Café oscuro para acentos
  static const Color kCoffeeDark = Color(0xFF2A1C0F);          // Café muy oscuro
  static const Color kCoffeeLight = Color(0xFF5C3E2A);         // Café claro
  static const Color kCoffeeLighter = Color(0xFF8B6F47);       // Café muy claro
  static const Color kCream = Color(0xFF2A2A2A);               // Crema oscura para superficies
  
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

  // Espaciado
  static const double kDefaultPadding = 16.0;
  static const double kSmallPadding = 8.0;
  static const double kLargePadding = 24.0;
  
  // Tamaños de iconos estandarizados
  static const double kIconSizeSmall = 16.0;
  static const double kIconSizeMedium = 20.0;
  static const double kIconSizeDefault = 24.0;
  static const double kIconSizeLarge = 32.0;
  
  // Tamaños para contenedores de iconos
  static const double kIconContainerSizeSmall = 32.0;
  static const double kIconContainerSizeDefault = 40.0;
  static const double kIconContainerSizeLarge = 48.0;

  // Radios
  static const double kDefaultRadius = 12.0;
  static const double kSmallRadius = 6.0;
  static const double kLargeRadius = 20.0;

  // Tema oscuro principal - BARBER TIME DARK
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: kPrimaryColor, // Oro clásico
      scaffoldBackgroundColor: kBackgroundColor, // Negro profundo
      colorScheme: const ColorScheme.dark().copyWith(
        primary: kPrimaryColor, // Oro clásico
        secondary: kAccentColor, // Oro clásico
        surface: kSurfaceColor, // Negro carbón
        surfaceContainer: kBackgroundColor, // Negro profundo
        onPrimary: kMidnightBlue, // Negro sobre oro
        onSecondary: kMidnightBlue, // Negro sobre oro
        onSurface: kTextColor, // Blanco sobre superficies
      ),
      textTheme: _darkTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: kBackgroundColor, // Negro profundo
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: kTextColor, // Blanco
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: kPrimaryColor), // Iconos dorados
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: kPrimaryColor, // Oro clásico
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor, // Oro clásico
          foregroundColor: kMidnightBlue, // Texto negro sobre oro
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
          foregroundColor: kPrimaryColor, // Oro clásico
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: kSurfaceColor, // Negro carbón
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: BorderSide(color: kDividerColor), // Gris oscuro
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: const BorderSide(color: kPrimaryColor), // Oro clásico
        ),
        contentPadding: const EdgeInsets.all(kDefaultPadding),
        hintStyle: const TextStyle(color: kSecondaryTextColor), // Gris claro
      ),
      cardColor: kSurfaceColor, // Negro carbón
      cardTheme: ThemeData.dark().cardTheme.copyWith(
        color: kSurfaceColor, // Negro carbón
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
        ),
        shadowColor: kMidnightBlue.withAlpha((0.3 * 255).round()),
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
