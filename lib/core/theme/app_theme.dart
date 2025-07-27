import 'package:flutter/material.dart';

/// Clase que define el tema global de la aplicación Barber Time
/// Incluye colores, estilos de texto y otros parámetros visuales
class AppTheme {
  // ======================================================
  // NUEVA PALETA DE COLORES - BARBER TIME MODERN
  // ======================================================
  
  // Colores principales - Nueva paleta moderna
  static const Color kPrimaryColor = Color(0xFF3BBFAD);        // Turquesa-menta principal
  static const Color kPrimaryDarkColor = Color(0xFF2A8F83);    // Turquesa-menta oscuro
  static const Color kPrimaryLightColor = Color(0xFF65D8C8);   // Turquesa-menta claro
  
  // Colores de acción y énfasis
  static const Color kAccentColor = Color(0xFFE57C4B);         // Naranja terracota
  static const Color kAccentDarkColor = Color(0xFFD05F2E);     // Naranja terracota oscuro
  static const Color kAccentLightColor = Color(0xFFF29C74);    // Naranja terracota claro
  
  // Base oscura moderna - Negro azulado
  static const Color kBackgroundColor = Color(0xFF121212);      // Fondo principal negro azulado
  static const Color kSurfaceColor = Color(0xFF1E1E1E);        // Superficie de componentes
  static const Color kBackgroundAlt = Color(0xFF2A2A2A);        // Fondo alternativo (tarjetas)
  static const Color kSurfaceAlt = Color(0xFF383838);          // Superficie alternativa (elevados)
  
  // Escala de grises neutral
  static const Color kDarkGray = Color(0xFF2A2A2A);            // Gris oscuro
  static const Color kMediumGray = Color(0xFF707070);          // Gris medio
  static const Color kLightGray = Color(0xFFAAAAAA);           // Gris claro
  static const Color kPaleGray = Color(0xFFD8D8D8);            // Gris pálido
  static const Color kOffWhite = Color(0xFFF5F5F5);            // Casi blanco

  // Colores informativos y de estado - Legacy (comentados para mantener referencia)
  // Estos se han reemplazado por las definiciones más abajo
  // static const Color kSuccessColor = Color(0xFF4CAF50);
  // static const Color kErrorColor = Color(0xFFE53935);
  // static const Color kWarningColor = Color(0xFFFFB300);
  // static const Color kInfoColor = Color(0xFF2196F3);
  
  // Colores complementarios para destacados
  static const Color kComplementaryColor1 = Color(0xFF8367C7);  // Púrpura complementario
  static const Color kComplementaryColor2 = Color(0xFF6D9DC5);  // Azul acero complementario
  
  // Colores azules para referencias legacy y compatibilidad
  static const Color kMidnightBlue = Color(0xFF0F172A);         // Azul medianoche casi negro
  static const Color kDeepBlue = Color(0xFF1E3A8A);            // Azul profundo
  static const Color kBrightBlue = Color(0xFF3B82F6);          // Azul brillante
  static const Color kLightBlue = Color(0xFF60A5FA);           // Azul claro
  static const Color kSkyBlue = Color(0xFF7DD3FC);             // Azul cielo
  
  // Colores dorados para referencias legacy y compatibilidad
  static const Color kDarkGold = Color(0xFFB45309);            // Oro oscuro
  static const Color kMediumGold = Color(0xFFD97706);          // Oro medio
  static const Color kLightGold = Color(0xFFFBBF24);           // Oro claro
  static const Color kAmber = Color(0xFFF59E0B);               // Ámbar
  
  // Colores azules para referencias legacy y compatibilidad
  static const Color kBluePrimary = Color(0xFF2563EB);         // Azul primario
  static const Color kBlueDark = Color(0xFF1D4ED8);            // Azul oscuro
  static const Color kBlueLight = Color(0xFF60A5FA);           // Azul claro
  static const Color kBlueSoft = Color(0xFF93C5FD);            // Azul suave
  static const Color kBluePale = Color(0xFFBAE6FD);            // Azul pálido
  
  // Color terciario para compatibilidad
  static const Color kTertiaryColor = Color(0xFF8367C7);       // Púrpura (igual que complementario 1)
  
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
  
  // Colores de estado actualizados (para feedback visual)
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
        primary: kPrimaryColor, // Turquesa-menta
        secondary: kAccentColor, // Naranja terracota
        surface: kSurfaceColor, // Negro carbón
        surfaceContainer: kBackgroundColor, // Negro profundo
        onPrimary: kBackgroundColor, // Negro sobre turquesa
        onSecondary: kBackgroundColor, // Negro sobre naranja
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
          backgroundColor: kPrimaryColor, // Turquesa-menta
          foregroundColor: kBackgroundColor, // Texto negro sobre turquesa
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
