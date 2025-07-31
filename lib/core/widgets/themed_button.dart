import 'package:flutter/material.dart';

import '../theme/app_theme_extensions.dart';
import 'states/states.dart';

/// Enumeración para definir los tipos de botón disponibles
enum ThemedButtonType {
  /// Botón principal con fondo de color y texto en contraste
  primary,

  /// Botón secundario con fondo transparente y borde
  outlined,

  /// Botón terciario con fondo transparente y sin borde
  text,

  /// Botón con acento dorado para acciones destacadas
  accent,
}

/// Enumeración para definir los tamaños de botón disponibles
enum ThemedButtonSize {
  /// Botón pequeño para interfaces densas
  small,

  /// Tamaño estándar para la mayoría de casos
  medium,

  /// Botón grande para acciones principales
  large,
}

/// Botón temático personalizado que sigue el sistema de diseño de Barber Time
class ThemedButton extends StatelessWidget {
  /// Constructor
  const ThemedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ThemedButtonType.primary,
    this.size = ThemedButtonSize.medium,
    this.icon,
    this.iconLeading = false,
    this.isLoading = false,
    this.fullWidth = false,
    this.minWidth,
  });

  /// Texto del botón
  final String text;

  /// Callback cuando se presiona el botón
  final VoidCallback onPressed;

  /// Tipo de botón
  final ThemedButtonType type;

  /// Tamaño del botón
  final ThemedButtonSize size;

  /// Icono opcional
  final IconData? icon;

  /// Si el icono va antes del texto
  final bool iconLeading;

  /// Si está cargando
  final bool isLoading;

  /// Si ocupa todo el ancho disponible
  final bool fullWidth;

  /// Ancho mínimo del botón
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    final buttonColors = _getButtonColors(context);
    final textStyle = _getTextStyle(context, buttonColors.foregroundColor);
    final iconSize = _getIconSize();
    final padding = _getPadding(context);

    // Contenido del botón (texto con o sin icono)
    /// Contenido del botón (texto con o sin icono).
    Widget buttonContent = _buildButtonContent(context, textStyle, iconSize);

    // Si está cargando, mostrar indicador de progreso en lugar del contenido
    if (isLoading) {
      buttonContent = LoadingIndicatorWidget(
        size: LoadingIndicatorSize.small,
        color: buttonColors.foregroundColor,
      );
    }

    // Construir el botón según su tipo
    switch (type) {
      case ThemedButtonType.outlined:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: buttonColors.foregroundColor,
            side: BorderSide(color: buttonColors.backgroundColor),
            padding: padding,
            minimumSize: Size(minWidth ?? 0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: context.buttonBorderRadius,
            ),
          ),
          child: buttonContent,
        );
      case ThemedButtonType.text:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            foregroundColor: buttonColors.foregroundColor,
            padding: padding,
            minimumSize: Size(minWidth ?? 0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: context.buttonBorderRadius,
            ),
          ),
          child: buttonContent,
        );
      case ThemedButtonType.accent:
      case ThemedButtonType.primary:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColors.backgroundColor,
            foregroundColor: buttonColors.foregroundColor,
            padding: padding,
            minimumSize: Size(minWidth ?? 0, 0),
            shadowColor: context.shadowColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: context.buttonBorderRadius,
            ),
          ),
          child: buttonContent,
        );
    }
  }

  /// Construye el contenido del botón (texto con o sin icono)
  Widget _buildButtonContent(
    BuildContext context,
    TextStyle textStyle,
    double iconSize,
  ) {
    final Widget textWidget = Text(text, style: textStyle);

    // Si no hay icono, retornar solo el texto
    if (icon == null) {
      return textWidget;
    }

    // Construir fila con icono y texto en el orden adecuado
    final iconWidget = Icon(icon, size: iconSize);
    final spacing = SizedBox(width: context.spacingXS);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: iconLeading
          ? [iconWidget, spacing, textWidget]
          : [textWidget, spacing, iconWidget],
    );
  }

  /// Obtiene el padding adecuado según el tamaño del botón
  EdgeInsets _getPadding(BuildContext context) {
    switch (size) {
      case ThemedButtonSize.small:
        return EdgeInsets.symmetric(
          horizontal: context.spacingSM,
          vertical: context.spacingXXS,
        );
      case ThemedButtonSize.large:
        return EdgeInsets.symmetric(
          horizontal: context.spacingLG,
          vertical: context.spacingMD,
        );
      case ThemedButtonSize.medium:
        return EdgeInsets.symmetric(
          horizontal: context.spacingMD,
          vertical: context.spacingSM,
        );
    }
  }

  /// Obtiene el estilo de texto adecuado según el tamaño del botón
  TextStyle _getTextStyle(BuildContext context, Color foregroundColor) {
    switch (size) {
      case ThemedButtonSize.small:
        return context.buttonSmall.copyWith(color: foregroundColor);
      case ThemedButtonSize.large:
        return context.button.copyWith(fontSize: 16, color: foregroundColor);
      case ThemedButtonSize.medium:
        return context.button.copyWith(color: foregroundColor);
    }
  }

  /// Obtiene el tamaño de icono adecuado según el tamaño del botón
  double _getIconSize() {
    switch (size) {
      case ThemedButtonSize.small:
        return 16;
      case ThemedButtonSize.large:
        return 24;
      case ThemedButtonSize.medium:
        return 20;
    }
  }

  /// Obtiene los colores adecuados según el tipo de botón
  _ButtonColors _getButtonColors(BuildContext context) {
    // Usar color personalizado si se proporciona
    final baseColor = context.primaryColor; // Default to primary color

    switch (type) {
      case ThemedButtonType.outlined:
        return _ButtonColors(
          backgroundColor: Colors.transparent,
          foregroundColor: baseColor,
        );
      case ThemedButtonType.text:
        return _ButtonColors(
          backgroundColor: Colors.transparent,
          foregroundColor: baseColor,
        );
      case ThemedButtonType.accent:
        return _ButtonColors(
          backgroundColor: baseColor,
          foregroundColor: context.textColor,
        );
      case ThemedButtonType.primary:
        return _ButtonColors(
          backgroundColor: baseColor,
          foregroundColor: Colors.white,
        );
    }
  }
}

/// Clase auxiliar para manejar los colores del botón
class _ButtonColors {
  final Color backgroundColor;
  final Color foregroundColor;

  _ButtonColors({required this.backgroundColor, required this.foregroundColor});
}

/// Ejemplo de uso:
/// ```dart
/// ThemedButton(
///   text: 'Iniciar sesión',
///   type: ThemedButtonType.primary,
///   size: ThemedButtonSize.medium,
///   icon: Icons.login,
///   fullWidth: true,
///   onPressed: () => print('Button pressed'),
/// )
/// ```
