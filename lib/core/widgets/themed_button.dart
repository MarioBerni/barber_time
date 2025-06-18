import 'package:flutter/material.dart';
import '../theme/app_theme_extensions.dart';

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

/// Un componente de botón que utiliza el sistema de temas centralizado
/// 
/// Este widget permite crear botones con apariencia consistente en toda la aplicación
/// y aprovecha las extensiones de contexto para acceder a colores, bordes y estilos de texto.
class ThemedButton extends StatelessWidget {
  /// Texto a mostrar en el botón
  final String text;
  
  /// Icono opcional para mostrar junto al texto
  final IconData? icon;
  
  /// Posición del icono (true = izquierda, false = derecha)
  final bool iconLeading;
  
  /// Tipo de botón a mostrar
  final ThemedButtonType type;
  
  /// Tamaño del botón
  final ThemedButtonSize size;
  
  /// Función que se ejecuta al presionar el botón
  final VoidCallback? onPressed;
  
  /// Si el botón ocupa todo el ancho disponible
  final bool fullWidth;
  
  /// Color personalizado para el botón (anula el color determinado por el tipo)
  final Color? customColor;
  
  /// Si es verdadero, muestra un indicador de carga en lugar del contenido
  final bool isLoading;

  const ThemedButton({
    Key? key,
    required this.text,
    this.icon,
    this.iconLeading = true,
    this.type = ThemedButtonType.primary,
    this.size = ThemedButtonSize.medium,
    this.onPressed,
    this.fullWidth = false,
    this.customColor,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtener propiedades basadas en el tamaño
    final EdgeInsets padding = _getPadding(context);
    final double? minWidth = fullWidth ? double.infinity : null;
    final TextStyle textStyle = _getTextStyle(context);
    final double iconSize = _getIconSize();
    
    // Obtener colores según el tipo de botón
    final buttonColors = _getButtonColors(context);
    
    // Contenido del botón (texto con o sin icono)
    Widget buttonContent = _buildButtonContent(context, textStyle, iconSize);
    
    // Si está cargando, mostrar indicador de progreso en lugar del contenido
    if (isLoading) {
      buttonContent = SizedBox(
        height: _getLoadingSize(),
        width: _getLoadingSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(buttonColors.foregroundColor),
        ),
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
  Widget _buildButtonContent(BuildContext context, TextStyle textStyle, double iconSize) {
    final Widget textWidget = Text(
      text,
      style: textStyle,
    );
    
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
  TextStyle _getTextStyle(BuildContext context) {
    switch (size) {
      case ThemedButtonSize.small:
        return context.buttonSmall;
      case ThemedButtonSize.large:
        return context.button.copyWith(fontSize: 16);
      case ThemedButtonSize.medium:
        return context.button;
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
  
  /// Obtiene el tamaño del indicador de carga según el tamaño del botón
  double _getLoadingSize() {
    switch (size) {
      case ThemedButtonSize.small:
        return 12;
      case ThemedButtonSize.large:
        return 20;
      case ThemedButtonSize.medium:
        return 16;
    }
  }
  
  /// Obtiene los colores adecuados según el tipo de botón
  _ButtonColors _getButtonColors(BuildContext context) {
    // Usar color personalizado si se proporciona
    final baseColor = customColor;
    
    switch (type) {
      case ThemedButtonType.outlined:
        return _ButtonColors(
          backgroundColor: Colors.transparent,
          foregroundColor: baseColor ?? context.primaryColor,
        );
      case ThemedButtonType.text:
        return _ButtonColors(
          backgroundColor: Colors.transparent,
          foregroundColor: baseColor ?? context.accentColor,
        );
      case ThemedButtonType.accent:
        return _ButtonColors(
          backgroundColor: baseColor ?? context.accentColor,
          foregroundColor: context.textColor,
        );
      case ThemedButtonType.primary:
      default:
        return _ButtonColors(
          backgroundColor: baseColor ?? context.primaryColor,
          foregroundColor: Colors.white,
        );
    }
  }
}

/// Clase auxiliar para manejar los colores del botón
class _ButtonColors {
  final Color backgroundColor;
  final Color foregroundColor;
  
  _ButtonColors({
    required this.backgroundColor,
    required this.foregroundColor,
  });
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
