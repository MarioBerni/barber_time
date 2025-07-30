import 'dart:ui';
import 'package:flutter/material.dart';
import '../../theme/app_theme_extensions.dart';

/// Nivel de elevación para el contenedor glamoroso
enum GlamElevation {
  /// Elevación mínima (muy sutil)
  low,

  /// Elevación media (moderada)
  medium,

  /// Elevación alta (notable)
  high,

  /// Elevación muy alta (dramática)
  dramatic,
}

/// Estilo de borde para el contenedor glamoroso
enum GlamBorderStyle {
  /// Sin borde
  none,

  /// Borde sólido sutil
  solid,

  /// Borde con resplandor
  glow,

  /// Borde con degradado sutil
  gradient,
}

/// Contenedor glamoroso con efecto de cristal (glassmorphism)
///
/// Este componente crea un contenedor con efecto de vidrio esmerilado,
/// bordes estilizados, sombras dinámicas y efectos visuales premium.
class GlamContainer extends StatelessWidget {
  /// El contenido del contenedor
  final Widget child;

  /// Color base del contenedor (afecta la tinta del efecto de vidrio)
  final Color? baseColor;

  /// Nivel de opacidad del efecto de vidrio (0.0 - 1.0)
  final double opacity;

  /// Intensidad del efecto de desenfoque (1.0 - 20.0)
  final double blurIntensity;

  /// Nivel de elevación que determina la intensidad de las sombras
  final GlamElevation elevation;

  /// Estilo de borde
  final GlamBorderStyle borderStyle;

  /// Color del borde (si aplica)
  final Color? borderColor;

  /// Ancho del borde (si aplica)
  final double borderWidth;

  /// Radio de las esquinas del contenedor
  final BorderRadius? borderRadius;

  /// Margen exterior del contenedor
  final EdgeInsetsGeometry? margin;

  /// Relleno interior del contenedor
  final EdgeInsetsGeometry? padding;

  /// Si debe mostrar un sutil resplandor interior
  final bool showInnerGlow;

  /// Tamaño fijo del contenedor (opcional)
  final Size? fixedSize;

  /// Ancho máximo del contenedor (opcional)
  final double? maxWidth;

  /// Alto máximo del contenedor (opcional)
  final double? maxHeight;

  /// Crea un contenedor glamoroso con efecto de vidrio
  const GlamContainer({
    super.key,
    required this.child,
    this.baseColor,
    this.opacity = 0.65,
    this.blurIntensity = 8.0,
    this.elevation = GlamElevation.medium,
    this.borderStyle = GlamBorderStyle.solid,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius,
    this.margin,
    this.padding,
    this.showInnerGlow = false,
    this.fixedSize,
    this.maxWidth,
    this.maxHeight,
  });

  /// Constructor conveniente para crear un contenedor de tarjeta glamorosa
  factory GlamContainer.card({
    required Widget child,
    Color? baseColor,
    double opacity = 0.7,
    GlamElevation elevation = GlamElevation.medium,
    GlamBorderStyle borderStyle = GlamBorderStyle.glow,
    Color? borderColor,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16.0),
    double? maxWidth,
    bool showInnerGlow = true,
  }) {
    return GlamContainer(
      baseColor: baseColor,
      opacity: opacity,
      blurIntensity: 10.0,
      elevation: elevation,
      borderStyle: borderStyle,
      borderColor: borderColor,
      borderWidth: 0.8,
      borderRadius: BorderRadius.circular(16.0),
      margin: margin,
      padding: padding,
      showInnerGlow: showInnerGlow,
      maxWidth: maxWidth,
      child: child,
    );
  }

  /// Constructor conveniente para crear un panel informativo glamoroso
  factory GlamContainer.panel({
    required Widget child,
    Color? baseColor,
    double opacity = 0.8,
    GlamElevation elevation = GlamElevation.low,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry padding = const EdgeInsets.all(20.0),
    double? maxWidth,
    bool showInnerGlow = false,
  }) {
    return GlamContainer(
      baseColor: baseColor,
      opacity: opacity,
      blurIntensity: 6.0,
      elevation: elevation,
      borderWidth: 0.5,
      borderRadius: BorderRadius.circular(12.0),
      margin: margin,
      padding: padding,
      showInnerGlow: showInnerGlow,
      maxWidth: maxWidth,
      child: child,
    );
  }

  /// Constructor conveniente para crear una superficie sutil glamorosa
  factory GlamContainer.surface({
    required Widget child,
    Color? baseColor,
    double opacity = 0.4,
    GlamElevation elevation = GlamElevation.low,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 12.0,
    ),
    BorderRadius? borderRadius,
  }) {
    return GlamContainer(
      baseColor: baseColor,
      opacity: opacity,
      blurIntensity: 4.0,
      elevation: elevation,
      borderStyle: GlamBorderStyle.none,
      borderRadius: borderRadius ?? BorderRadius.circular(8.0),
      margin: margin,
      padding: padding,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Obtener colores del tema
    final themeBaseColor = baseColor ?? context.surfaceColor;
    final themeBorderColor = borderColor ?? context.dividerColor;

    // Crear el contenedor con efecto de vidrio
    return Container(
      width: fixedSize?.width,
      height: fixedSize?.height,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? double.infinity,
        maxHeight: maxHeight ?? double.infinity,
      ),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(12.0),
        boxShadow: _getShadows(context),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(12.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blurIntensity,
            sigmaY: blurIntensity,
          ),
          child: Container(
            padding: padding,
            decoration: _getContainerDecoration(
              context,
              themeBaseColor,
              themeBorderColor,
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  /// Obtiene la lista de sombras según el nivel de elevación
  List<BoxShadow> _getShadows(BuildContext context) {
    switch (elevation) {
      case GlamElevation.low:
        return [
          BoxShadow(
            color: context.shadowColor.withAlpha((0.1 * 255).round()),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ];

      case GlamElevation.medium:
        return [
          BoxShadow(
            color: context.shadowColor.withAlpha((0.05 * 255).round()),
            blurRadius: 4.0,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: context.shadowColor.withAlpha((0.15 * 255).round()),
            blurRadius: 10.0,
            offset: const Offset(0, 4),
          ),
        ];

      case GlamElevation.high:
        return [
          BoxShadow(
            color: context.shadowColor.withAlpha((0.05 * 255).round()),
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: context.shadowColor.withAlpha((0.2 * 255).round()),
            blurRadius: 16.0,
            offset: const Offset(0, 8),
          ),
        ];

      case GlamElevation.dramatic:
        return [
          BoxShadow(
            color: context.shadowColor.withAlpha((0.05 * 255).round()),
            blurRadius: 10.0,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: context.shadowColor.withAlpha((0.2 * 255).round()),
            blurRadius: 24.0,
            offset: const Offset(0, 12),
          ),
        ];
    }
  }

  /// Obtiene la decoración del contenedor según los parámetros
  BoxDecoration _getContainerDecoration(
    BuildContext context,
    Color baseColor,
    Color borderColor,
  ) {
    // Color base con opacidad
    final containerColor = baseColor.withAlpha((opacity * 255).round());

    // Borde según el estilo seleccionado
    BoxBorder? border;
    List<BoxShadow>? innerShadow;
    Gradient? gradient;

    switch (borderStyle) {
      case GlamBorderStyle.none:
        border = null;
        break;

      case GlamBorderStyle.solid:
        border = Border.all(
          color: borderColor.withAlpha((0.6 * 255).round()),
          width: borderWidth,
        );
        break;

      case GlamBorderStyle.glow:
        border = Border.all(
          color: borderColor.withAlpha((0.5 * 255).round()),
          width: borderWidth,
        );

        innerShadow = [
          BoxShadow(
            color: borderColor.withAlpha((0.3 * 255).round()),
            blurRadius: 6.0,
            spreadRadius: 1.0,
          ),
        ];
        break;

      case GlamBorderStyle.gradient:
        gradient = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            borderColor.withAlpha((0.7 * 255).round()),
            borderColor.withAlpha((0.3 * 255).round()),
            borderColor.withAlpha((0.1 * 255).round()),
            borderColor.withAlpha((0.3 * 255).round()),
          ],
          stops: const [0.0, 0.3, 0.7, 1.0],
        );
        break;
    }

    // Resplandor interior
    if (showInnerGlow && innerShadow == null) {
      innerShadow = [
        BoxShadow(
          color: baseColor.withAlpha((0.15 * 255).round()),
          blurRadius: 8.0,
          spreadRadius: -2.0,
          offset: const Offset(0, 1),
        ),
      ];
    }

    // Construir la decoración final
    return BoxDecoration(
      color: containerColor,
      borderRadius: borderRadius ?? BorderRadius.circular(12.0),
      border: border,
      boxShadow: innerShadow,
      gradient: gradient,
    );
  }
}
