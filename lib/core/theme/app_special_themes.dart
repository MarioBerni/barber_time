import 'package:flutter/material.dart';
import 'app_theme.dart';

/// Contiene temas alternativos para eventos especiales en la aplicación.
///
/// Estos temas mantienen la estructura base del tema principal pero modifican
/// colores y estilos para adaptarse a diferentes eventos o temporadas.
class AppSpecialThemes {
  /// Tema especial para la temporada navideña.
  ///
  /// Añade acentos verdes y rojos mientras mantiene la identidad de marca.
  static ThemeData get christmasTheme {
    const christmasGreen = Color(0xFF0F8A5F);
    const christmasRed = Color(0xFFD42F2F);
    const christmasGold = Color(0xFFEBB035);

    return AppTheme.theme.copyWith(
      colorScheme: AppTheme.theme.colorScheme.copyWith(
        secondary: christmasRed,
        tertiary: christmasGreen,
      ),
      cardTheme: AppTheme.theme.cardTheme.copyWith(
        shadowColor: christmasGreen.withAlpha((0.2 * 255).round()),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: christmasRed,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.kDefaultRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: christmasGold),
      ),
      extensions: {
        ChristmasThemeExtension(
          isChristmasThemeActive: true,
          christmasGreen: christmasGreen,
          christmasRed: christmasRed,
          christmasGold: christmasGold,
        ),
      },
    );
  }

  /// Tema especial para eventos de aniversario de la barbería.
  ///
  /// Utiliza dorado y negro para un aspecto más elegante y de celebración.
  static ThemeData get anniversaryTheme {
    const celebrationGold = Color(0xFFFFD700);
    const elegantBlack = Color(0xFF121212);
    const silverAccent = Color(0xFFC0C0C0);

    return AppTheme.theme.copyWith(
      colorScheme: AppTheme.theme.colorScheme.copyWith(
        secondary: celebrationGold,
        surface: elegantBlack,
      ),
      cardTheme: AppTheme.theme.cardTheme.copyWith(
        shadowColor: celebrationGold.withAlpha((0.3 * 255).round()),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: celebrationGold,
          foregroundColor: elegantBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.kDefaultRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: silverAccent),
      ),
      extensions: {
        AnniversaryThemeExtension(
          isAnniversaryThemeActive: true,
          celebrationGold: celebrationGold,
          elegantBlack: elegantBlack,
          silverAccent: silverAccent,
        ),
      },
    );
  }

  /// Tema especial para promociones o Black Friday.
  ///
  /// Utiliza negro y amarillo para destacar precios y ofertas especiales.
  static ThemeData get promotionalTheme {
    const promotionalBlack = Color(0xFF000000);
    const promotionalYellow = Color(0xFFFFC107);
    const discountRed = Color(0xFFE53935);

    return AppTheme.theme.copyWith(
      colorScheme: AppTheme.theme.colorScheme.copyWith(
        secondary: promotionalYellow,
        error: discountRed,
      ),
      cardTheme: AppTheme.theme.cardTheme.copyWith(
        shadowColor: promotionalBlack.withAlpha((0.25 * 255).round()),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: promotionalBlack,
          foregroundColor: promotionalYellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.kDefaultRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: discountRed),
      ),
      extensions: {
        PromotionalThemeExtension(
          isPromotionalThemeActive: true,
          promotionalBlack: promotionalBlack,
          promotionalYellow: promotionalYellow,
          discountRed: discountRed,
        ),
      },
    );
  }
}

/// Extensión de tema para la temporada de Navidad.
class ChristmasThemeExtension extends ThemeExtension<ChristmasThemeExtension> {
  /// Indica si el tema de Navidad está activo.
  final bool isChristmasThemeActive;

  /// Color verde característico de la Navidad.
  final Color christmasGreen;

  /// Color rojo característico de la Navidad.
  final Color christmasRed;

  /// Color dorado para detalles navideños.
  final Color christmasGold;

  /// Crea una instancia de la extensión del tema de Navidad.
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
      isChristmasThemeActive:
          isChristmasThemeActive ?? this.isChristmasThemeActive,
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
      isChristmasThemeActive: t < 0.5
          ? isChristmasThemeActive
          : other.isChristmasThemeActive,
      christmasGreen: Color.lerp(christmasGreen, other.christmasGreen, t)!,
      christmasRed: Color.lerp(christmasRed, other.christmasRed, t)!,
      christmasGold: Color.lerp(christmasGold, other.christmasGold, t)!,
    );
  }
}

/// Extensión de tema para eventos de Aniversario.
class AnniversaryThemeExtension
    extends ThemeExtension<AnniversaryThemeExtension> {
  /// Indica si el tema de Aniversario está activo.
  final bool isAnniversaryThemeActive;

  /// Color dorado principal para la celebración.
  final Color celebrationGold;

  /// Tono de negro elegante para el fondo.
  final Color elegantBlack;

  /// Acento plateado para detalles.
  final Color silverAccent;

  /// Crea una instancia de la extensión del tema de Aniversario.
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
      isAnniversaryThemeActive:
          isAnniversaryThemeActive ?? this.isAnniversaryThemeActive,
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
      isAnniversaryThemeActive: t < 0.5
          ? isAnniversaryThemeActive
          : other.isAnniversaryThemeActive,
      celebrationGold: Color.lerp(celebrationGold, other.celebrationGold, t)!,
      elegantBlack: Color.lerp(elegantBlack, other.elegantBlack, t)!,
      silverAccent: Color.lerp(silverAccent, other.silverAccent, t)!,
    );
  }
}

/// Extensión de tema para eventos Promocionales.
class PromotionalThemeExtension
    extends ThemeExtension<PromotionalThemeExtension> {
  /// Indica si el tema Promocional está activo.
  final bool isPromotionalThemeActive;

  /// Color negro intenso para el tema.
  final Color promotionalBlack;

  /// Color amarillo para destacar ofertas.
  final Color promotionalYellow;

  /// Color rojo para indicar descuentos.
  final Color discountRed;

  /// Crea una instancia de la extensión del tema Promocional.
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
      isPromotionalThemeActive:
          isPromotionalThemeActive ?? this.isPromotionalThemeActive,
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
      isPromotionalThemeActive: t < 0.5
          ? isPromotionalThemeActive
          : other.isPromotionalThemeActive,
      promotionalBlack: Color.lerp(
        promotionalBlack,
        other.promotionalBlack,
        t,
      )!,
      promotionalYellow: Color.lerp(
        promotionalYellow,
        other.promotionalYellow,
        t,
      )!,
      discountRed: Color.lerp(discountRed, other.discountRed, t)!,
    );
  }
}

/// Extensión para acceder a los temas especiales desde el contexto.
extension SpecialThemeExtension on BuildContext {
  T? _getExtension<T>() => Theme.of(this).extension<T>();

  /// Verdadero si el tema de Navidad está activo.
  bool get isChristmasThemeActive =>
      _getExtension<ChristmasThemeExtension>()?.isChristmasThemeActive ?? false;

  /// Verdadero si el tema de Aniversario está activo.
  bool get isAnniversaryThemeActive =>
      _getExtension<AnniversaryThemeExtension>()?.isAnniversaryThemeActive ??
      false;

  /// Verdadero si el tema Promocional está activo.
  bool get isPromotionalThemeActive =>
      _getExtension<PromotionalThemeExtension>()?.isPromotionalThemeActive ??
      false;

  /// Color verde del tema de Navidad, o null si no está activo.
  Color? get christmasGreen =>
      _getExtension<ChristmasThemeExtension>()?.christmasGreen;

  /// Color rojo del tema de Navidad, o null si no está activo.
  Color? get christmasRed =>
      _getExtension<ChristmasThemeExtension>()?.christmasRed;

  /// Color dorado del tema de Navidad, o null si no está activo.
  Color? get christmasGold =>
      _getExtension<ChristmasThemeExtension>()?.christmasGold;

  /// Color dorado del tema de Aniversario, o null si no está activo.
  Color? get celebrationGold =>
      _getExtension<AnniversaryThemeExtension>()?.celebrationGold;

  /// Color negro del tema de Aniversario, o null si no está activo.
  Color? get elegantBlack =>
      _getExtension<AnniversaryThemeExtension>()?.elegantBlack;

  /// Color plateado del tema de Aniversario, o null si no está activo.
  Color? get silverAccent =>
      _getExtension<AnniversaryThemeExtension>()?.silverAccent;

  /// Color negro del tema Promocional, o null si no está activo.
  Color? get promotionalBlack =>
      _getExtension<PromotionalThemeExtension>()?.promotionalBlack;

  /// Color amarillo del tema Promocional, o null si no está activo.
  Color? get promotionalYellow =>
      _getExtension<PromotionalThemeExtension>()?.promotionalYellow;

  /// Color rojo del tema Promocional, o null si no está activo.
  Color? get discountRed =>
      _getExtension<PromotionalThemeExtension>()?.discountRed;

  /// Verdadero si cualquier tema especial está activo.
  bool get isAnySpecialThemeActive =>
      isChristmasThemeActive ||
      isAnniversaryThemeActive ||
      isPromotionalThemeActive;
}
