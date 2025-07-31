import 'package:flutter/material.dart';

import '../../theme/app_design_constants.dart';
import '../../theme/app_theme.dart';

/// Componente unificado de contenedores
/// Elimina duplicaciones de BoxDecoration en toda la aplicación
class AppContainers {
  // Privado para evitar instanciación
  AppContainers._();

  // ===== CONTENEDORES BÁSICOS =====

  /// Contenedor estándar con decoración básica
  static Widget standard({
    required Widget child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
    List<BoxShadow>? boxShadow,
  }) {
    return Container(
      padding: padding ?? AppDesignConstants.paddingMD,
      margin: margin,
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            AppDesignConstants.colorWithOpacity(
              AppTheme.kSurfaceColor,
              AppDesignConstants.opacityMedium,
            ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppDesignConstants.borderRadiusMD,
        ),
        border: borderColor != null ? Border.all(color: borderColor) : null,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }

  /// Contenedor con efecto de cristal (glassmorphism)
  static Widget glass({
    required Widget child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? borderRadius,
    double opacity = 0.4,
    Color? baseColor,
  }) {
    return Container(
      padding: padding ?? AppDesignConstants.paddingMD,
      margin: margin,
      decoration: BoxDecoration(
        color: AppDesignConstants.colorWithOpacity(
          baseColor ?? AppTheme.kSurfaceColor,
          opacity,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppDesignConstants.borderRadiusMD,
        ),
        border: Border.all(
          color: AppDesignConstants.colorWithOpacity(
            AppTheme.kPrimaryColor,
            AppDesignConstants.opacityVeryLow,
          ),
        ),
        boxShadow: AppDesignConstants.shadowSubtle,
      ),
      child: child,
    );
  }

  /// Contenedor con borde y sombra
  static Widget bordered({
    required Widget child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? borderRadius,
    Color? borderColor,
    double borderWidth = 1.0,
    List<BoxShadow>? boxShadow,
  }) {
    return Container(
      padding: padding ?? AppDesignConstants.paddingMD,
      margin: margin,
      decoration: BoxDecoration(
        color: AppDesignConstants.colorWithOpacity(
          AppTheme.kSurfaceColor,
          AppDesignConstants.opacityMedium,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppDesignConstants.borderRadiusMD,
        ),
        border: Border.all(
          color:
              borderColor ??
              AppDesignConstants.colorWithOpacity(
                AppTheme.kPrimaryColor,
                AppDesignConstants.opacityLow,
              ),
          width: borderWidth,
        ),
        boxShadow: boxShadow ?? AppDesignConstants.shadowSubtle,
      ),
      child: child,
    );
  }

  /// Contenedor con gradiente
  static Widget gradient({
    required Widget child,
    required List<Color> colors,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? borderRadius,
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    List<double>? stops,
  }) {
    return Container(
      padding: padding ?? AppDesignConstants.paddingMD,
      margin: margin,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: begin ?? Alignment.topLeft,
          end: end ?? Alignment.bottomRight,
          stops: stops,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppDesignConstants.borderRadiusMD,
        ),
      ),
      child: child,
    );
  }

  // ===== CONTENEDORES ESPECIALIZADOS =====

  /// Contenedor para cards
  static Widget card({
    required Widget child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? borderRadius,
    bool withShadow = true,
  }) {
    return Container(
      padding: padding ?? AppDesignConstants.paddingMD,
      margin: margin,
      decoration: BoxDecoration(
        color: AppDesignConstants.colorWithOpacity(
          AppTheme.kSurfaceColor,
          AppDesignConstants.opacityMedium,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppDesignConstants.borderRadiusMD,
        ),
        boxShadow: withShadow ? AppDesignConstants.shadowStandard : null,
      ),
      child: child,
    );
  }

  /// Contenedor para botones
  static Widget button({
    required Widget child,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    Color? backgroundColor,
    List<BoxShadow>? boxShadow,
  }) {
    return Container(
      padding: padding ?? AppDesignConstants.paddingHorizontal,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppTheme.kPrimaryColor,
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppDesignConstants.borderRadiusMD,
        ),
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }

  /// Contenedor para campos de texto
  static Widget textField({
    required Widget child,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
    bool isFocused = false,
  }) {
    return Container(
      padding: padding ?? AppDesignConstants.paddingHorizontal,
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            AppDesignConstants.colorWithOpacity(
              AppTheme.kSurfaceColor,
              AppDesignConstants.opacityMedium,
            ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppDesignConstants.borderRadiusMD,
        ),
        border: Border.all(
          color:
              borderColor ??
              (isFocused
                  ? AppTheme.kPrimaryColor
                  : AppDesignConstants.colorWithOpacity(
                      AppTheme.kSurfaceColor,
                      AppDesignConstants.opacityMedium,
                    )),
        ),
        boxShadow: isFocused ? AppDesignConstants.shadowSubtle : null,
      ),
      child: child,
    );
  }

  /// Contenedor para badges/etiquetas
  static Widget badge({
    required Widget child,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return Container(
      padding:
          padding ??
          EdgeInsets.symmetric(
            horizontal: AppDesignConstants.spacingXS,
            vertical: AppDesignConstants.spacingXXS,
          ),
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            AppDesignConstants.colorWithOpacity(
              AppTheme.kPrimaryColor,
              AppDesignConstants.opacityVeryLow,
            ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppDesignConstants.borderRadiusSM,
        ),
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }

  /// Contenedor para iconos
  static Widget icon({
    required Widget child,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return Container(
      padding: padding ?? AppDesignConstants.paddingCompact,
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            AppDesignConstants.colorWithOpacity(
              AppTheme.kPrimaryColor,
              AppDesignConstants.opacityVeryLow,
            ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppDesignConstants.borderRadiusSM,
        ),
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }

  // ===== CONTENEDORES CON ANIMACIÓN =====

  /// Contenedor con animación de escala
  static Widget animatedScale({
    required Widget child,
    required Animation<double> animation,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? borderRadius,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) => Transform.scale(
        scale: animation.value,
        child: standard(
          child: child,
          padding: padding,
          margin: margin,
          borderRadius: borderRadius,
        ),
      ),
    );
  }

  /// Contenedor con animación de opacidad
  static Widget animatedOpacity({
    required Widget child,
    required Animation<double> animation,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? borderRadius,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) => Opacity(
        opacity: animation.value,
        child: standard(
          child: child,
          padding: padding,
          margin: margin,
          borderRadius: borderRadius,
        ),
      ),
    );
  }

  // ===== MÉTODOS UTILITARIOS =====

  /// Crea un contenedor con decoración personalizada
  static Widget custom({
    required Widget child,
    required BoxDecoration decoration,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: decoration,
      child: child,
    );
  }

  /// Crea un contenedor con clip personalizado
  static Widget clipped({
    required Widget child,
    required CustomClipper<Path> clipper,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      padding: padding,
      margin: margin,
      child: ClipPath(clipper: clipper, child: child),
    );
  }
}
