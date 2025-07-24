import 'package:flutter/material.dart';
import 'app_border_radius.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';
import 'app_theme.dart';

/// Extensiones para BuildContext que facilitan el acceso a temas, colores y estilos
/// Permite un código más limpio y conciso al usar el sistema de temas
extension ThemeExtension on BuildContext {
  // Acceso al tema
  ThemeData get theme => Theme.of(this);
  
  // Acceso a esquemas de color
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  
  // Acceso a temas de texto
  TextTheme get textTheme => Theme.of(this).textTheme;
  
  // Acceso directo a colores principales
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryDarkColor => AppTheme.kPrimaryDarkColor;
  Color get primaryLightColor => AppTheme.kPrimaryLightColor;
  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get accentColor => Theme.of(this).colorScheme.secondary;
  Color get surfaceColor => AppTheme.kSurfaceColor;
  
  // Nuevos tonos de azul
  Color get midnightBlue => AppTheme.kMidnightBlue;
  Color get deepBlue => AppTheme.kDeepBlue;
  Color get brightBlue => AppTheme.kBrightBlue;
  Color get lightBlue => AppTheme.kLightBlue;
  Color get skyBlue => AppTheme.kSkyBlue;
  
  // Superficies alternativas
  Color get backgroundAlt => AppTheme.kBackgroundAlt;
  Color get surfaceAlt => AppTheme.kSurfaceAlt;
  
  // Dorados y ámbar
  Color get accentDarkColor => AppTheme.kAccentDarkColor;
  Color get accentLightColor => AppTheme.kAccentLightColor;
  Color get darkGold => AppTheme.kDarkGold;
  Color get mediumGold => AppTheme.kMediumGold;
  Color get lightGold => AppTheme.kLightGold;
  Color get amber => AppTheme.kAmber;
  
  // Acceso a colores complementarios
  Color get complementaryColor1 => AppTheme.kComplementaryColor1;
  Color get complementaryColor2 => AppTheme.kComplementaryColor2;
  Color get tertiaryColor => AppTheme.kTertiaryColor;
  
  // Acceso a colores de texto
  Color get textColor => AppTheme.kTextColor;
  Color get textSecondaryColor => AppTheme.kSecondaryTextColor;
  Color get secondaryTextColor => AppTheme.kSecondaryTextColor;
  
  // Colores neutros expandidos
  Color get dividerColor => AppTheme.kDividerColor;
  Color get disabledColor => AppTheme.kDisabledColor;
  Color get charcoal => AppTheme.kCharcoal;
  Color get metalGray => AppTheme.kMetalGray;
  Color get pearlGray => AppTheme.kPearlGray;
  Color get coffee => AppTheme.kCoffee;
  Color get coffeeDark => AppTheme.kCoffeeDark;
  Color get coffeeLight => AppTheme.kCoffeeLight;
  Color get coffeeLighter => AppTheme.kCoffeeLighter;
  Color get cream => AppTheme.kCream;
  
  // Acceso a colores de estado
  Color get successColor => AppTheme.kSuccessColor;
  Color get successDarkColor => AppTheme.kSuccessDarkColor;
  Color get successLightColor => AppTheme.kSuccessLightColor;
  
  Color get errorColor => AppTheme.kErrorColor;
  Color get errorDarkColor => AppTheme.kErrorDarkColor;
  Color get errorLightColor => AppTheme.kErrorLightColor;
  
  Color get warningColor => AppTheme.kWarningColor;
  Color get warningDarkColor => AppTheme.kWarningDarkColor;
  Color get warningLightColor => AppTheme.kWarningLightColor;
  
  Color get infoColor => AppTheme.kInfoColor;
  Color get infoDarkColor => AppTheme.kInfoDarkColor;
  Color get infoLightColor => AppTheme.kInfoLightColor;
  
  // Acceso a colores de sombra
  Color get shadowColor => Theme.of(this).cardTheme.shadowColor ?? AppTheme.kShadowColor;
  Color get shadowColorAlt => AppTheme.kShadowColorAlt;
  Color get deepShadowColor => AppTheme.kDeepShadowColor;
  Color get lightShadowColor => AppTheme.kShadowColor.withAlpha((0.1 * 255).round());
  Color get mediumShadowColor => AppTheme.kShadowColor.withAlpha((0.3 * 255).round());
  Color get darkShadowColor => AppTheme.kShadowColor.withAlpha((0.5 * 255).round());
  
  // Tamaños de iconos estandarizados
  double get iconSizeSmall => AppTheme.kIconSizeSmall;
  double get iconSizeMedium => AppTheme.kIconSizeMedium;
  double get iconSizeDefault => AppTheme.kIconSizeDefault;
  double get iconSizeLarge => AppTheme.kIconSizeLarge;
  
  // Tamaños para contenedores de iconos
  double get iconContainerSizeSmall => AppTheme.kIconContainerSizeSmall;
  double get iconContainerSizeDefault => AppTheme.kIconContainerSizeDefault;
  double get iconContainerSizeLarge => AppTheme.kIconContainerSizeLarge;
}

/// Extensión para simplificar el acceso a los estilos de texto
extension TextStyleExtension on BuildContext {
  // Estilos de texto principales
  TextStyle get h1 => AppTextStyles.h1;
  TextStyle get h2 => AppTextStyles.h2;
  TextStyle get h3 => AppTextStyles.h3;
  TextStyle get h4 => AppTextStyles.h4;
  TextStyle get h5 => AppTextStyles.h5;
  
  // Material 3 Typography compatibility
  TextStyle get titleLarge => AppTextStyles.h4;
  TextStyle get titleMedium => AppTextStyles.h5;
  TextStyle get titleSmall => AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold);
  
  // Estilos de cuerpo de texto
  TextStyle get bodyLarge => AppTextStyles.bodyLarge;
  TextStyle get bodyMedium => AppTextStyles.bodyMedium;
  TextStyle get bodySmall => AppTextStyles.bodySmall;
  
  // Estilos especiales
  TextStyle get caption => AppTextStyles.caption;
  TextStyle get button => AppTextStyles.button;
  TextStyle get buttonSmall => AppTextStyles.buttonSmall;
  TextStyle get link => AppTextStyles.link;
  TextStyle get emphasis => AppTextStyles.emphasis;
  
  // Estilos con estados
  TextStyle get errorText => AppTextStyles.error;
  TextStyle get successText => AppTextStyles.success;
  TextStyle get warningText => AppTextStyles.warning;
}

/// Extensión para simplificar el acceso a los espaciados
extension SpacingExtension on BuildContext {
  // Acceso a espaciados básicos
  double get spacingXXXS => AppSpacing.xxxs;
  double get spacingXXS => AppSpacing.xxs;
  double get spacingXS => AppSpacing.xs;
  double get spacingSM => AppSpacing.sm;
  double get spacingMD => AppSpacing.md;
  double get spacingLG => AppSpacing.lg;
  double get spacingXL => AppSpacing.xl;
  double get spacingXXL => AppSpacing.xxl;
  double get spacingXXXL => AppSpacing.xxxl;
  
  // Espaciados específicos de componentes
  double get formSpacing => AppSpacing.formElementSpacing;
  double get sectionSpacing => AppSpacing.sectionSpacing;
  double get cardPadding => AppSpacing.cardPadding;
  double get pagePadding => AppSpacing.pagePadding;
  double get listSpacing => AppSpacing.listItemSpacing;
  
  // Widgets de espaciado vertical preconstruidos
  Widget get verticalSpaceXXXS => SizedBox(height: AppSpacing.xxxs);
  Widget get verticalSpaceXXS => SizedBox(height: AppSpacing.xxs);
  Widget get verticalSpaceXS => SizedBox(height: AppSpacing.xs);
  Widget get verticalSpaceSM => SizedBox(height: AppSpacing.sm);
  Widget get verticalSpaceMD => SizedBox(height: AppSpacing.md);
  Widget get verticalSpaceLG => SizedBox(height: AppSpacing.lg);
  Widget get verticalSpaceXL => SizedBox(height: AppSpacing.xl);
  Widget get verticalSpaceXXL => SizedBox(height: AppSpacing.xxl);
  
  // Widgets de espaciado horizontal preconstruidos
  Widget get horizontalSpaceXXXS => SizedBox(width: AppSpacing.xxxs);
  Widget get horizontalSpaceXXS => SizedBox(width: AppSpacing.xxs);
  Widget get horizontalSpaceXS => SizedBox(width: AppSpacing.xs);
  Widget get horizontalSpaceSM => SizedBox(width: AppSpacing.sm);
  Widget get horizontalSpaceMD => SizedBox(width: AppSpacing.md);
  Widget get horizontalSpaceLG => SizedBox(width: AppSpacing.lg);
  Widget get horizontalSpaceXL => SizedBox(width: AppSpacing.xl);
  Widget get horizontalSpaceXXL => SizedBox(width: AppSpacing.xxl);
}

/// Extensión para simplificar el acceso a los radios de borde
extension BorderRadiusExtension on BuildContext {
  // Radios básicos
  BorderRadius get defaultBorderRadius => AppBorderRadius.defaultBorderRadius;
  BorderRadius get buttonBorderRadius => AppBorderRadius.buttonBorderRadius;
  BorderRadius get cardBorderRadius => AppBorderRadius.cardBorderRadius;
  BorderRadius get textFieldBorderRadius => AppBorderRadius.textFieldBorderRadius;
  BorderRadius get bottomSheetBorderRadius => AppBorderRadius.bottomSheetBorderRadius;
  
  // Valores numéricos
  double get borderRadiusXS => AppBorderRadius.xs;
  double get borderRadiusSM => AppBorderRadius.sm;
  double get borderRadiusMD => AppBorderRadius.md;
  double get borderRadiusLG => AppBorderRadius.lg;
  double get borderRadiusXL => AppBorderRadius.xl;
  double get borderRadiusXXL => AppBorderRadius.xxl;
}

/// Extensión para simplificar el acceso a las sombras estandarizadas
extension ShadowExtension on BuildContext {
  // Sombras predefinidas
  List<BoxShadow> get noShadow => [];
  
  List<BoxShadow> get lightShadow => [
    BoxShadow(
      color: lightShadowColor,
      blurRadius: 4.0,
      offset: const Offset(0, 2),
    ),
  ];
  
  List<BoxShadow> get mediumShadow => [
    BoxShadow(
      color: mediumShadowColor,
      blurRadius: 8.0,
      offset: const Offset(0, 4),
    ),
  ];
  
  List<BoxShadow> get strongShadow => [
    BoxShadow(
      color: darkShadowColor,
      blurRadius: 12.0,
      offset: const Offset(0, 6),
    ),
  ];
  
  List<BoxShadow> get elevatedShadow => [
    BoxShadow(
      color: shadowColor.withAlpha((0.06 * 255).round()),
      blurRadius: 4.0,
      offset: const Offset(0, 2),
    ),
    BoxShadow(
      color: shadowColor.withAlpha((0.16 * 255).round()),
      blurRadius: 12.0,
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
