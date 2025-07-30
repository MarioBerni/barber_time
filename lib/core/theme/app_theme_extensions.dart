import 'package:flutter/material.dart';
import 'app_border_radius.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';
import 'app_theme.dart';

/// Extensiones para [BuildContext] que facilitan el acceso a temas, colores y
/// estilos, permitiendo un código más limpio y conciso.
extension ThemeExtension on BuildContext {
  /// Acceso rápido al [ThemeData] actual.
  ThemeData get theme => Theme.of(this);

  /// Acceso rápido al [ColorScheme] del tema actual.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Acceso rápido al [TextTheme] del tema actual.
  TextTheme get textTheme => Theme.of(this).textTheme;

  // Acceso directo a colores principales
  /// Color primario principal de la aplicación (Turquesa-menta).
  Color get primaryColor => Theme.of(this).primaryColor;

  /// Versión oscura del color primario.
  Color get primaryDarkColor => AppTheme.kPrimaryDarkColor;

  /// Versión clara del color primario.
  Color get primaryLightColor => AppTheme.kPrimaryLightColor;

  /// Color de fondo principal de la aplicación.
  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;

  /// Color de acento (Naranja terracota).
  Color get accentColor => Theme.of(this).colorScheme.secondary;

  /// Color de superficie para componentes como cards.
  Color get surfaceColor => AppTheme.kSurfaceColor;

  // Nuevos tonos de azul
  /// Tono de azul medianoche.
  Color get midnightBlue => AppTheme.kMidnightBlue;

  /// Tono de azul profundo.
  Color get deepBlue => AppTheme.kDeepBlue;

  /// Tono de azul brillante.
  Color get brightBlue => AppTheme.kBrightBlue;

  /// Tono de azul claro.
  Color get lightBlue => AppTheme.kLightBlue;

  /// Tono de azul cielo.
  Color get skyBlue => AppTheme.kSkyBlue;

  // Superficies alternativas
  /// Color de fondo alternativo.
  Color get backgroundAlt => AppTheme.kBackgroundAlt;

  /// Color de superficie alternativo.
  Color get surfaceAlt => AppTheme.kSurfaceAlt;

  // Dorados y ámbar
  /// Versión oscura del color de acento.
  Color get accentDarkColor => AppTheme.kAccentDarkColor;

  /// Versión clara del color de acento.
  Color get accentLightColor => AppTheme.kAccentLightColor;

  /// Tono de oro oscuro.
  Color get darkGold => AppTheme.kDarkGold;

  /// Tono de oro medio.
  Color get mediumGold => AppTheme.kMediumGold;

  /// Tono de oro claro.
  Color get lightGold => AppTheme.kLightGold;

  /// Tono ámbar.
  Color get amber => AppTheme.kAmber;

  // Azules elegantes - Nueva paleta premium
  /// Tono de azul primario (legacy).
  Color get bluePrimary => AppTheme.kBluePrimary;

  /// Tono de azul oscuro (legacy).
  Color get blueDark => AppTheme.kBlueDark;

  /// Tono de azul claro (legacy).
  Color get blueLight => AppTheme.kBlueLight;

  /// Tono de azul suave (legacy).
  Color get blueSoft => AppTheme.kBlueSoft;

  /// Tono de azul pálido (legacy).
  Color get bluePale => AppTheme.kBluePale;

  // Acceso a colores complementarios
  /// Color complementario 1 (Púrpura).
  Color get complementaryColor1 => AppTheme.kComplementaryColor1;

  /// Color complementario 2 (Azul acero).
  Color get complementaryColor2 => AppTheme.kComplementaryColor2;

  /// Color terciario (Púrpura).
  Color get tertiaryColor => AppTheme.kTertiaryColor;

  // Acceso a colores de texto
  /// Color de texto principal (Blanco).
  Color get textColor => AppTheme.kTextColor;

  /// Color de texto secundario (Gris claro).
  Color get textSecondaryColor => AppTheme.kSecondaryTextColor;

  /// Alias para [textSecondaryColor].
  Color get secondaryTextColor => AppTheme.kSecondaryTextColor;

  // Escala de grises refinada - Armonía Negro-Gris Premium
  /// Negro puro.
  Color get blackPure => AppTheme.kBlackPure;

  /// Negro profundo.
  Color get blackDeep => AppTheme.kBlackDeep;

  /// Tono carbón oscuro.
  Color get charcoalDark => AppTheme.kCharcoalDark;

  /// Tono carbón medio.
  Color get charcoalMedium => AppTheme.kCharcoalMedium;

  /// Tono carbón claro.
  Color get charcoalLight => AppTheme.kCharcoalLight;

  /// Tono gris oscuro.
  Color get grayDark => AppTheme.kGrayDark;

  /// Tono gris medio.
  Color get grayMedium => AppTheme.kGrayMedium;

  /// Tono gris claro.
  Color get grayLight => AppTheme.kGrayLight;

  /// Tono gris pálido.
  Color get grayPale => AppTheme.kGrayPale;

  // Textos optimizados
  /// Color de texto terciario (placeholders).
  Color get tertiaryTextColor => AppTheme.kTertiaryTextColor;

  // Colores neutros (compatibilidad y nuevos)
  /// Color para divisores.
  Color get dividerColor => AppTheme.kDividerColor;

  /// Color para elementos deshabilitados.
  Color get disabledColor => AppTheme.kDisabledColor;

  /// Tono carbón (legacy).
  Color get charcoal => AppTheme.kCharcoal;

  /// Tono gris metálico (legacy).
  Color get metalGray => AppTheme.kMetalGray;

  /// Tono gris pizarra (legacy).
  Color get pearlGray => AppTheme.kPearlGray;

  /// Tono café oscuro (legacy).
  Color get coffee => AppTheme.kCoffee;

  /// Tono café muy oscuro (legacy).
  Color get coffeeDark => AppTheme.kCoffeeDark;

  /// Tono café claro (legacy).
  Color get coffeeLight => AppTheme.kCoffeeLight;

  /// Tono café muy claro (legacy).
  Color get coffeeLighter => AppTheme.kCoffeeLighter;

  /// Tono crema oscuro (legacy).
  Color get cream => AppTheme.kCream;

  // Acceso a colores de estado
  /// Color para indicar éxito.
  Color get successColor => AppTheme.kSuccessColor;

  /// Tono oscuro del color de éxito.
  Color get successDarkColor => AppTheme.kSuccessDarkColor;

  /// Tono claro del color de éxito.
  Color get successLightColor => AppTheme.kSuccessLightColor;

  /// Color para indicar error.
  Color get errorColor => AppTheme.kErrorColor;

  /// Tono oscuro del color de error.
  Color get errorDarkColor => AppTheme.kErrorDarkColor;

  /// Tono claro del color de error.
  Color get errorLightColor => AppTheme.kErrorLightColor;

  /// Color para indicar advertencia.
  Color get warningColor => AppTheme.kWarningColor;

  /// Tono oscuro del color de advertencia.
  Color get warningDarkColor => AppTheme.kWarningDarkColor;

  /// Tono claro del color de advertencia.
  Color get warningLightColor => AppTheme.kWarningLightColor;

  /// Color para indicar información.
  Color get infoColor => AppTheme.kInfoColor;

  /// Tono oscuro del color de información.
  Color get infoDarkColor => AppTheme.kInfoDarkColor;

  /// Tono claro del color de información.
  Color get infoLightColor => AppTheme.kInfoLightColor;

  // Acceso a colores de sombra
  /// Color de sombra por defecto.
  Color get shadowColor =>
      Theme.of(this).cardTheme.shadowColor ?? AppTheme.kShadowColor;

  /// Color de sombra alternativo.
  Color get shadowColorAlt => AppTheme.kShadowColorAlt;

  /// Color de sombra profundo.
  Color get deepShadowColor => AppTheme.kDeepShadowColor;

  /// Color de sombra claro.
  Color get lightShadowColor =>
      AppTheme.kShadowColor.withAlpha((0.1 * 255).round());

  /// Color de sombra medio.
  Color get mediumShadowColor =>
      AppTheme.kShadowColor.withAlpha((0.3 * 255).round());

  /// Color de sombra oscuro.
  Color get darkShadowColor =>
      AppTheme.kShadowColor.withAlpha((0.5 * 255).round());

  // Tamaños de iconos estandarizados
  /// Tamaño de icono pequeño.
  double get iconSizeSmall => AppTheme.kIconSizeSmall;

  /// Tamaño de icono mediano.
  double get iconSizeMedium => AppTheme.kIconSizeMedium;

  /// Tamaño de icono por defecto.
  double get iconSizeDefault => AppTheme.kIconSizeDefault;

  /// Tamaño de icono grande.
  double get iconSizeLarge => AppTheme.kIconSizeLarge;

  // Tamaños para contenedores de iconos
  /// Tamaño de contenedor de icono pequeño.
  double get iconContainerSizeSmall => AppTheme.kIconContainerSizeSmall;

  /// Tamaño de contenedor de icono por defecto.
  double get iconContainerSizeDefault => AppTheme.kIconContainerSizeDefault;

  /// Tamaño de contenedor de icono grande.
  double get iconContainerSizeLarge => AppTheme.kIconContainerSizeLarge;
}

/// Extensión para simplificar el acceso a los estilos de texto.
extension TextStyleExtension on BuildContext {
  // Estilos de texto principales
  /// Estilo de texto para encabezado de nivel 1.
  TextStyle get h1 => AppTextStyles.h1;

  /// Estilo de texto para encabezado de nivel 2.
  TextStyle get h2 => AppTextStyles.h2;

  /// Estilo de texto para encabezado de nivel 3.
  TextStyle get h3 => AppTextStyles.h3;

  /// Estilo de texto para encabezado de nivel 4.
  TextStyle get h4 => AppTextStyles.h4;

  /// Estilo de texto para encabezado de nivel 5.
  TextStyle get h5 => AppTextStyles.h5;

  // Material 3 Typography compatibility
  /// Estilo de texto para títulos grandes (compatible con Material 3).
  TextStyle get titleLarge => AppTextStyles.h4;

  /// Estilo de texto para títulos medianos (compatible con Material 3).
  TextStyle get titleMedium => AppTextStyles.h5;

  /// Estilo de texto para títulos pequeños (compatible con Material 3).
  TextStyle get titleSmall =>
      AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold);

  // Estilos de cuerpo de texto
  /// Estilo de texto para cuerpo de texto grande.
  TextStyle get bodyLarge => AppTextStyles.bodyLarge;

  /// Estilo de texto para cuerpo de texto mediano.
  TextStyle get bodyMedium => AppTextStyles.bodyMedium;

  /// Estilo de texto para cuerpo de texto pequeño.
  TextStyle get bodySmall => AppTextStyles.bodySmall;

  // Estilos especiales
  /// Estilo de texto para leyendas.
  TextStyle get caption => AppTextStyles.caption;

  /// Estilo de texto para botones.
  TextStyle get button => AppTextStyles.button;

  /// Estilo de texto para botones pequeños.
  TextStyle get buttonSmall => AppTextStyles.buttonSmall;

  /// Estilo de texto para enlaces.
  TextStyle get link => AppTextStyles.link;

  /// Estilo de texto con énfasis (itálica).
  TextStyle get emphasis => AppTextStyles.emphasis;

  // Estilos con estados
  /// Estilo de texto para errores.
  TextStyle get errorText => AppTextStyles.error;

  /// Estilo de texto para éxito.
  TextStyle get successText => AppTextStyles.success;

  /// Estilo de texto para advertencias.
  TextStyle get warningText => AppTextStyles.warning;
}

/// Extensión para simplificar el acceso a los espaciados.
extension SpacingExtension on BuildContext {
  // Acceso a espaciados básicos
  /// Espaciado de tamaño `xxxs`.
  double get spacingXXXS => AppSpacing.xxxs;

  /// Espaciado de tamaño `xxs`.
  double get spacingXXS => AppSpacing.xxs;

  /// Espaciado de tamaño `xs`.
  double get spacingXS => AppSpacing.xs;

  /// Espaciado de tamaño `sm`.
  double get spacingSM => AppSpacing.sm;

  /// Espaciado de tamaño `md`.
  double get spacingMD => AppSpacing.md;

  /// Espaciado de tamaño `lg`.
  double get spacingLG => AppSpacing.lg;

  /// Espaciado de tamaño `xl`.
  double get spacingXL => AppSpacing.xl;

  /// Espaciado de tamaño `xxl`.
  double get spacingXXL => AppSpacing.xxl;

  /// Espaciado de tamaño `xxxl`.
  double get spacingXXXL => AppSpacing.xxxl;

  // Espaciados específicos de componentes
  /// Espaciado para elementos de formulario.
  double get formSpacing => AppSpacing.formElementSpacing;

  /// Espaciado entre secciones.
  double get sectionSpacing => AppSpacing.sectionSpacing;

  /// Padding para tarjetas.
  double get cardPadding => AppSpacing.cardPadding;

  /// Padding de página.
  double get pagePadding => AppSpacing.pagePadding;

  /// Espaciado para elementos de lista.
  double get listSpacing => AppSpacing.listItemSpacing;

  // Widgets de espaciado vertical preconstruidos
  /// [SizedBox] vertical de tamaño `xxxs`.
  Widget get verticalSpaceXXXS => SizedBox(height: AppSpacing.xxxs);

  /// [SizedBox] vertical de tamaño `xxs`.
  Widget get verticalSpaceXXS => SizedBox(height: AppSpacing.xxs);

  /// [SizedBox] vertical de tamaño `xs`.
  Widget get verticalSpaceXS => SizedBox(height: AppSpacing.xs);

  /// [SizedBox] vertical de tamaño `sm`.
  Widget get verticalSpaceSM => SizedBox(height: AppSpacing.sm);

  /// [SizedBox] vertical de tamaño `md`.
  Widget get verticalSpaceMD => SizedBox(height: AppSpacing.md);

  /// [SizedBox] vertical de tamaño `lg`.
  Widget get verticalSpaceLG => SizedBox(height: AppSpacing.lg);

  /// [SizedBox] vertical de tamaño `xl`.
  Widget get verticalSpaceXL => SizedBox(height: AppSpacing.xl);

  /// [SizedBox] vertical de tamaño `xxl`.
  Widget get verticalSpaceXXL => SizedBox(height: AppSpacing.xxl);

  // Widgets de espaciado horizontal preconstruidos
  /// [SizedBox] horizontal de tamaño `xxxs`.
  Widget get horizontalSpaceXXXS => SizedBox(width: AppSpacing.xxxs);

  /// [SizedBox] horizontal de tamaño `xxs`.
  Widget get horizontalSpaceXXS => SizedBox(width: AppSpacing.xxs);

  /// [SizedBox] horizontal de tamaño `xs`.
  Widget get horizontalSpaceXS => SizedBox(width: AppSpacing.xs);

  /// [SizedBox] horizontal de tamaño `sm`.
  Widget get horizontalSpaceSM => SizedBox(width: AppSpacing.sm);

  /// [SizedBox] horizontal de tamaño `md`.
  Widget get horizontalSpaceMD => SizedBox(width: AppSpacing.md);

  /// [SizedBox] horizontal de tamaño `lg`.
  Widget get horizontalSpaceLG => SizedBox(width: AppSpacing.lg);

  /// [SizedBox] horizontal de tamaño `xl`.
  Widget get horizontalSpaceXL => SizedBox(width: AppSpacing.xl);

  /// [SizedBox] horizontal de tamaño `xxl`.
  Widget get horizontalSpaceXXL => SizedBox(width: AppSpacing.xxl);
}

/// Extensión para simplificar el acceso a los radios de borde.
extension BorderRadiusExtension on BuildContext {
  // Radios básicos
  /// [BorderRadius] por defecto.
  BorderRadius get defaultBorderRadius => AppBorderRadius.defaultBorderRadius;

  /// [BorderRadius] para botones.
  BorderRadius get buttonBorderRadius => AppBorderRadius.buttonBorderRadius;

  /// [BorderRadius] para tarjetas.
  BorderRadius get cardBorderRadius => AppBorderRadius.cardBorderRadius;

  /// [BorderRadius] para campos de texto.
  BorderRadius get textFieldBorderRadius =>
      AppBorderRadius.textFieldBorderRadius;

  /// [BorderRadius] para hojas inferiores.
  BorderRadius get bottomSheetBorderRadius =>
      AppBorderRadius.bottomSheetBorderRadius;

  // Valores numéricos
  /// Valor de radio de borde `xs`.
  double get borderRadiusXS => AppBorderRadius.xs;

  /// Valor de radio de borde `sm`.
  double get borderRadiusSM => AppBorderRadius.sm;

  /// Valor de radio de borde `md`.
  double get borderRadiusMD => AppBorderRadius.md;

  /// Valor de radio de borde `lg`.
  double get borderRadiusLG => AppBorderRadius.lg;

  /// Valor de radio de borde `xl`.
  double get borderRadiusXL => AppBorderRadius.xl;

  /// Valor de radio de borde `xxl`.
  double get borderRadiusXXL => AppBorderRadius.xxl;
}

/// Extensión para simplificar el acceso a las sombras estandarizadas.
extension ShadowExtension on BuildContext {
  // Sombras predefinidas
  /// Sin sombra.
  List<BoxShadow> get noShadow => [];

  /// Sombra ligera.
  List<BoxShadow> get lightShadow => [
    BoxShadow(
      color: lightShadowColor,
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  /// Sombra media.
  List<BoxShadow> get mediumShadow => [
    BoxShadow(
      color: mediumShadowColor,
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  /// Sombra fuerte.
  List<BoxShadow> get strongShadow => [
    BoxShadow(
      color: darkShadowColor,
      blurRadius: 12,
      offset: const Offset(0, 6),
    ),
  ];

  /// Sombra para elementos elevados.
  List<BoxShadow> get elevatedShadow => [
    BoxShadow(
      color: shadowColor.withAlpha((0.06 * 255).round()),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
    BoxShadow(
      color: shadowColor.withAlpha((0.16 * 255).round()),
      blurRadius: 12,
      offset: const Offset(0, 8),
    ),
  ];
}

/// Ejemplo de uso de las extensiones:
///
/// ```dart
/// Container(
///   color: context.primaryColor,
///   padding: EdgeInsets.all(context.spacingMD),
///   margin: EdgeInsets.symmetric(
///     horizontal: context.spacingSM,
///     vertical: context.spacingLG,
///   ),
///   decoration: BoxDecoration(
///     borderRadius: context.cardBorderRadius,
///     color: context.surfaceColor,
///   ),
///   child: Text(
///     'Ejemplo de texto',
///     style: context.h3,
///   ),
/// )
/// ```
