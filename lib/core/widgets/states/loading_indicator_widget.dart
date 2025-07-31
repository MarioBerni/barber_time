import 'package:flutter/material.dart';

import '../../theme/app_design_constants.dart';
import '../../theme/app_theme.dart';
import '../../theme/app_theme_extensions.dart';

/// Un widget de indicador de carga personalizado y consistente con el sistema
/// de diseño de Barber Time.
///
/// Proporciona diferentes tamaños, personalización de color y opciones para
/// mostrar texto descriptivo durante estados de carga.
class LoadingIndicatorWidget extends StatelessWidget {
  /// Crea un indicador de carga personalizado.
  ///
  /// [size] controla el tamaño del indicador (pequeño, medio, grande).
  /// [color] permite personalizar el color (por defecto usa el color
  /// primario del tema).
  /// [message] opcional para mostrar texto descriptivo debajo del indicador.
  /// [showBackground] determina si mostrar un fondo semi-transparente
  /// alrededor del indicador.
  const LoadingIndicatorWidget({
    super.key,
    this.size = LoadingIndicatorSize.medium,
    this.color,
    this.message,
    this.showBackground = false,
    this.alignment = Alignment.center,
    this.padding = const EdgeInsets.all(16.0),
  });

  /// Tamaño del indicador de carga.
  final LoadingIndicatorSize size;

  /// Color personalizado (opcional).
  final Color? color;

  /// Mensaje descriptivo opcional.
  final String? message;

  /// Determina si mostrar un fondo semi-transparente.
  final bool showBackground;

  /// Alineación del indicador dentro de su contenedor padre.
  final Alignment alignment;

  /// [padding] es el relleno alrededor del indicador.
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final actualColor = color ?? AppTheme.kPrimaryColor;

    final Widget indicator = _buildCustomSpinner(context, actualColor);
    final Widget content = message != null
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              indicator,
              SizedBox(height: AppDesignConstants.spacingMD),
              Text(
                message!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        : indicator;

    if (showBackground) {
      return Container(
        color: Colors.black.withAlpha((0.7 * 255).round()),
        child: Align(
          alignment: alignment,
          child: Padding(
            padding: padding,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
              decoration: BoxDecoration(
                color: context.charcoalMedium,
                borderRadius: BorderRadius.circular(
                  AppDesignConstants.borderRadiusLG,
                ),
                boxShadow: AppDesignConstants.shadowStandard,
              ),
              child: content,
            ),
          ),
        ),
      );
    }

    return Align(
      alignment: alignment,
      child: Padding(padding: padding, child: content),
    );
  }

  /// Construye el spinner personalizado basado en el diseño propuesto
  Widget _buildCustomSpinner(BuildContext context, Color color) {
    double getSize() {
      switch (size) {
        case LoadingIndicatorSize.small:
          return 32.0;
        case LoadingIndicatorSize.medium:
          return 48.0;
        case LoadingIndicatorSize.large:
          return 64.0;
      }
    }

    final spinnerSize = getSize();
    final strokeWidth = size == LoadingIndicatorSize.small ? 3.0 : 4.0;

    return SizedBox(
      width: spinnerSize,
      height: spinnerSize,
      child: Stack(
        children: [
          // Spinner principal (blanco)
          SizedBox(
            width: spinnerSize,
            height: spinnerSize,
            child: CircularProgressIndicator(
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: strokeWidth,
              backgroundColor: Colors.transparent,
            ),
          ),
          // Spinner secundario (color de acento)
          SizedBox(
            width: spinnerSize,
            height: spinnerSize,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(color),
              strokeWidth: strokeWidth,
              backgroundColor: Colors.transparent,
              value: 0.5, // Offset para crear el efecto de dos colores
            ),
          ),
        ],
      ),
    );
  }
}

/// Tamaños predefinidos para el indicador de carga.
enum LoadingIndicatorSize {
  /// Tamaño pequeño (32px) para indicadores en línea o dentro de componentes.
  small,

  /// Tamaño mediano (48px) para uso general.
  medium,

  /// Tamaño grande (64px) para pantallas completas de carga.
  large,
}
