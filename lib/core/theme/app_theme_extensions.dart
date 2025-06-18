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
  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get accentColor => Theme.of(this).colorScheme.secondary;
  Color get surfaceColor => AppTheme.kSurfaceColor;
  
  // Acceso a colores complementarios
  Color get complementaryColor1 => AppTheme.kComplementaryColor1;
  Color get complementaryColor2 => AppTheme.kComplementaryColor2;
  Color get tertiaryColor => AppTheme.kTertiaryColor;
  
  // Acceso a colores de texto
  Color get textColor => AppTheme.kTextColor;
  Color get secondaryTextColor => AppTheme.kSecondaryTextColor;
  
  // Acceso a colores de estado
  Color get successColor => AppTheme.kSuccessColor;
  Color get errorColor => AppTheme.kErrorColor;
  Color get warningColor => AppTheme.kWarningColor;
  Color get infoColor => AppTheme.kInfoColor;
}

/// Extensión para simplificar el acceso a los estilos de texto
extension TextStyleExtension on BuildContext {
  // Estilos de texto principales
  TextStyle get h1 => AppTextStyles.h1;
  TextStyle get h2 => AppTextStyles.h2;
  TextStyle get h3 => AppTextStyles.h3;
  TextStyle get h4 => AppTextStyles.h4;
  TextStyle get h5 => AppTextStyles.h5;
  
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
