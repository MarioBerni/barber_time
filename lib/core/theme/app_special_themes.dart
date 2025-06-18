import 'package:flutter/material.dart';
import 'app_theme.dart';

/// Clase que contiene temas alternativos para eventos especiales en la aplicación
/// Estos temas mantienen la estructura base del tema principal pero modifican
/// colores y estilos para adaptarse a diferentes eventos o temporadas.
class AppSpecialThemes {
  /// Tema especial para la temporada navideña
  /// Añade acentos verdes y rojos mientras mantiene la identidad de marca
  static ThemeData get christmasTheme {
    // Colores de Navidad que combinan con la identidad de marca
    const Color christmasGreen = Color(0xFF0F8A5F);
    const Color christmasRed = Color(0xFFD42F2F);
    const Color christmasGold = Color(0xFFEBB035);
    
    // Partir del tema base
    return AppTheme.theme.copyWith(
      colorScheme: AppTheme.theme.colorScheme.copyWith(
        secondary: christmasRed,
        tertiary: christmasGreen,
      ),
      cardTheme: AppTheme.theme.cardTheme.copyWith(
        shadowColor: christmasGreen.withOpacity(0.2),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: christmasRed,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.kDefaultRadius),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 20.0,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: christmasGold,
        ),
      ),
      extensions: {
        ChristmasThemeExtension(
          isChristmasThemeActive: true,
          christmasGreen: christmasGreen,
          christmasRed: christmasRed,
          christmasGold: christmasGold,
        )
      }
    );
  }

  /// Tema especial para eventos de aniversario de la barbería
  /// Utiliza dorado y negro para un aspecto más elegante y de celebración
  static ThemeData get anniversaryTheme {
    // Colores de aniversario más elegantes
    const Color celebrationGold = Color(0xFFFFD700);
    const Color elegantBlack = Color(0xFF121212);
    const Color silverAccent = Color(0xFFC0C0C0);
    
    // Partir del tema base
    return AppTheme.theme.copyWith(
      colorScheme: AppTheme.theme.colorScheme.copyWith(
        secondary: celebrationGold,
        surface: elegantBlack,
      ),
      cardTheme: AppTheme.theme.cardTheme.copyWith(
        shadowColor: celebrationGold.withOpacity(0.3),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: celebrationGold,
          foregroundColor: elegantBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.kDefaultRadius),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 20.0,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: silverAccent,
        ),
      ),
      extensions: {
        AnniversaryThemeExtension(
          isAnniversaryThemeActive: true,
          celebrationGold: celebrationGold,
          elegantBlack: elegantBlack,
          silverAccent: silverAccent,
        )
      }
    );
  }
  
  /// Tema especial para promociones o Black Friday
  /// Utiliza negro y amarillo para destacar precios y ofertas especiales
  static ThemeData get promotionalTheme {
    // Colores para promociones
    const Color promotionalBlack = Color(0xFF000000);
    const Color promotionalYellow = Color(0xFFFFC107);
    const Color discountRed = Color(0xFFE53935);
    
    // Partir del tema base
    return AppTheme.theme.copyWith(
      colorScheme: AppTheme.theme.colorScheme.copyWith(
        secondary: promotionalYellow,
        error: discountRed,
      ),
      cardTheme: AppTheme.theme.cardTheme.copyWith(
        shadowColor: promotionalBlack.withOpacity(0.25),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: promotionalBlack,
          foregroundColor: promotionalYellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.kDefaultRadius),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 20.0,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: discountRed,
        ),
      ),
      extensions: {
        PromotionalThemeExtension(
          isPromotionalThemeActive: true,
          promotionalBlack: promotionalBlack,
          promotionalYellow: promotionalYellow,
          discountRed: discountRed,
        )
      }
    );
  }
}

/// Extensión para el tema de Navidad
class ChristmasThemeExtension extends ThemeExtension<ChristmasThemeExtension> {
  final bool isChristmasThemeActive;
  final Color christmasGreen;
  final Color christmasRed;
  final Color christmasGold;

  ChristmasThemeExtension({
    required this.isChristmasThemeActive,
    required this.christmasGreen,
    required this.christmasRed,
    required this.christmasGold,
  });

  @override
  ThemeExtension<ChristmasThemeExtension> copyWith({
    bool? isChristmasThemeActive,
    Color? christmasGreen,
    Color? christmasRed,
    Color? christmasGold,
  }) {
    return ChristmasThemeExtension(
      isChristmasThemeActive: isChristmasThemeActive ?? this.isChristmasThemeActive,
      christmasGreen: christmasGreen ?? this.christmasGreen,
      christmasRed: christmasRed ?? this.christmasRed,
      christmasGold: christmasGold ?? this.christmasGold,
    );
  }

  @override
  ThemeExtension<ChristmasThemeExtension> lerp(
    covariant ThemeExtension<ChristmasThemeExtension>? other,
    double t,
  ) {
    if (other is! ChristmasThemeExtension) {
      return this;
    }
    return ChristmasThemeExtension(
      isChristmasThemeActive: t < 0.5 ? isChristmasThemeActive : other.isChristmasThemeActive,
      christmasGreen: Color.lerp(christmasGreen, other.christmasGreen, t)!,
      christmasRed: Color.lerp(christmasRed, other.christmasRed, t)!,
      christmasGold: Color.lerp(christmasGold, other.christmasGold, t)!,
    );
  }
}

/// Extensión para el tema de Aniversario
class AnniversaryThemeExtension extends ThemeExtension<AnniversaryThemeExtension> {
  final bool isAnniversaryThemeActive;
  final Color celebrationGold;
  final Color elegantBlack;
  final Color silverAccent;

  AnniversaryThemeExtension({
    required this.isAnniversaryThemeActive,
    required this.celebrationGold,
    required this.elegantBlack,
    required this.silverAccent,
  });

  @override
  ThemeExtension<AnniversaryThemeExtension> copyWith({
    bool? isAnniversaryThemeActive,
    Color? celebrationGold,
    Color? elegantBlack,
    Color? silverAccent,
  }) {
    return AnniversaryThemeExtension(
      isAnniversaryThemeActive: isAnniversaryThemeActive ?? this.isAnniversaryThemeActive,
      celebrationGold: celebrationGold ?? this.celebrationGold,
      elegantBlack: elegantBlack ?? this.elegantBlack,
      silverAccent: silverAccent ?? this.silverAccent,
    );
  }

  @override
  ThemeExtension<AnniversaryThemeExtension> lerp(
    covariant ThemeExtension<AnniversaryThemeExtension>? other,
    double t,
  ) {
    if (other is! AnniversaryThemeExtension) {
      return this;
    }
    return AnniversaryThemeExtension(
      isAnniversaryThemeActive: t < 0.5 ? isAnniversaryThemeActive : other.isAnniversaryThemeActive,
      celebrationGold: Color.lerp(celebrationGold, other.celebrationGold, t)!,
      elegantBlack: Color.lerp(elegantBlack, other.elegantBlack, t)!,
      silverAccent: Color.lerp(silverAccent, other.silverAccent, t)!,
    );
  }
}

/// Extensión para el tema Promocional
class PromotionalThemeExtension extends ThemeExtension<PromotionalThemeExtension> {
  final bool isPromotionalThemeActive;
  final Color promotionalBlack;
  final Color promotionalYellow;
  final Color discountRed;

  PromotionalThemeExtension({
    required this.isPromotionalThemeActive,
    required this.promotionalBlack,
    required this.promotionalYellow,
    required this.discountRed,
  });

  @override
  ThemeExtension<PromotionalThemeExtension> copyWith({
    bool? isPromotionalThemeActive,
    Color? promotionalBlack,
    Color? promotionalYellow,
    Color? discountRed,
  }) {
    return PromotionalThemeExtension(
      isPromotionalThemeActive: isPromotionalThemeActive ?? this.isPromotionalThemeActive,
      promotionalBlack: promotionalBlack ?? this.promotionalBlack,
      promotionalYellow: promotionalYellow ?? this.promotionalYellow,
      discountRed: discountRed ?? this.discountRed,
    );
  }

  @override
  ThemeExtension<PromotionalThemeExtension> lerp(
    covariant ThemeExtension<PromotionalThemeExtension>? other,
    double t,
  ) {
    if (other is! PromotionalThemeExtension) {
      return this;
    }
    return PromotionalThemeExtension(
      isPromotionalThemeActive: t < 0.5 ? isPromotionalThemeActive : other.isPromotionalThemeActive,
      promotionalBlack: Color.lerp(promotionalBlack, other.promotionalBlack, t)!,
      promotionalYellow: Color.lerp(promotionalYellow, other.promotionalYellow, t)!,
      discountRed: Color.lerp(discountRed, other.discountRed, t)!,
    );
  }
}

/// Extensión para acceder a los temas especiales desde el contexto
extension SpecialThemeExtension on BuildContext {
  // Verificar si un tema especial está activo
  bool get isChristmasThemeActive => 
      Theme.of(this).extensions[ChristmasThemeExtension] != null && 
      (Theme.of(this).extensions[ChristmasThemeExtension] as ChristmasThemeExtension?)?.isChristmasThemeActive == true;
  
  bool get isAnniversaryThemeActive => 
      Theme.of(this).extensions[AnniversaryThemeExtension] != null && 
      (Theme.of(this).extensions[AnniversaryThemeExtension] as AnniversaryThemeExtension?)?.isAnniversaryThemeActive == true;
  
  bool get isPromotionalThemeActive => 
      Theme.of(this).extensions[PromotionalThemeExtension] != null && 
      (Theme.of(this).extensions[PromotionalThemeExtension] as PromotionalThemeExtension?)?.isPromotionalThemeActive == true;
  
  // Acceder a los colores de temas especiales
  // Tema de Navidad
  Color? get christmasGreen => isChristmasThemeActive 
      ? (Theme.of(this).extensions[ChristmasThemeExtension] as ChristmasThemeExtension).christmasGreen
      : null;
  
  Color? get christmasRed => isChristmasThemeActive 
      ? (Theme.of(this).extensions[ChristmasThemeExtension] as ChristmasThemeExtension).christmasRed
      : null;
  
  Color? get christmasGold => isChristmasThemeActive 
      ? (Theme.of(this).extensions[ChristmasThemeExtension] as ChristmasThemeExtension).christmasGold
      : null;
  
  // Tema de Aniversario
  Color? get celebrationGold => isAnniversaryThemeActive 
      ? (Theme.of(this).extensions[AnniversaryThemeExtension] as AnniversaryThemeExtension).celebrationGold
      : null;
  
  Color? get elegantBlack => isAnniversaryThemeActive 
      ? (Theme.of(this).extensions[AnniversaryThemeExtension] as AnniversaryThemeExtension).elegantBlack
      : null;
  
  Color? get silverAccent => isAnniversaryThemeActive 
      ? (Theme.of(this).extensions[AnniversaryThemeExtension] as AnniversaryThemeExtension).silverAccent
      : null;
  
  // Tema Promocional
  Color? get promotionalBlack => isPromotionalThemeActive 
      ? (Theme.of(this).extensions[PromotionalThemeExtension] as PromotionalThemeExtension).promotionalBlack
      : null;
  
  Color? get promotionalYellow => isPromotionalThemeActive 
      ? (Theme.of(this).extensions[PromotionalThemeExtension] as PromotionalThemeExtension).promotionalYellow
      : null;
  
  Color? get discountRed => isPromotionalThemeActive 
      ? (Theme.of(this).extensions[PromotionalThemeExtension] as PromotionalThemeExtension).discountRed
      : null;
  
  // Helper para determinar si cualquier tema especial está activo
  bool get isAnySpecialThemeActive => 
      isChristmasThemeActive || isAnniversaryThemeActive || isPromotionalThemeActive;
}
