import 'package:flutter/material.dart';

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
    final actualColor = color ?? theme.colorScheme.primary;

    final Widget indicator = _buildIndicator(theme, actualColor);
    final Widget content = message != null
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              indicator,
              const SizedBox(height: 16),
              Text(
                message!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
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
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha((0.2 * 255).round()),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
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

  Widget _buildIndicator(ThemeData theme, Color color) {
    double getSize() {
      switch (size) {
        case LoadingIndicatorSize.small:
          return 20.0;
        case LoadingIndicatorSize.medium:
          return 36.0;
        case LoadingIndicatorSize.large:
          return 48.0;
      }
    }

    return SizedBox(
      width: getSize(),
      height: getSize(),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color),
        strokeWidth: size == LoadingIndicatorSize.small ? 2.0 : 3.0,
      ),
    );
  }
}

/// Tamaños predefinidos para el indicador de carga.
enum LoadingIndicatorSize {
  /// Tamaño pequeño (20px) para indicadores en línea o dentro de componentes.
  small,

  /// Tamaño mediano (36px) para uso general.
  medium,

  /// Tamaño grande (48px) para pantallas completas de carga.
  large,
}
