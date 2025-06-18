import 'package:flutter/material.dart';
import '../theme/app_theme_extensions.dart';

/// Enumeración para definir los tipos de badge disponibles
enum StatusBadgeType {
  /// Información neutral (azul)
  info,
  
  /// Éxito o confirmación (verde)
  success,
  
  /// Advertencia (naranja/amarillo)
  warning,
  
  /// Error o alerta (rojo)
  error,
  
  /// Neutral/Informativo secundario (gris)
  neutral,
  
  /// Color primario de la aplicación
  primary,
  
  /// Color de acento de la aplicación
  accent,
}

/// Un componente de badge para mostrar estados o etiquetas
/// utilizando el sistema de temas centralizado
class StatusBadge extends StatelessWidget {
  /// Texto a mostrar en el badge
  final String text;
  
  /// Tipo de badge que determina sus colores
  final StatusBadgeType type;
  
  /// Icono opcional para mostrar junto al texto
  final IconData? icon;
  
  /// Si es verdadero, el badge tendrá un borde más redondeado
  final bool rounded;
  
  /// Si es verdadero, el badge tendrá un tamaño más pequeño
  final bool small;
  
  /// Color personalizado (opcional, anula el color determinado por el tipo)
  final Color? customColor;

  const StatusBadge({
    Key? key,
    required this.text,
    this.type = StatusBadgeType.info,
    this.icon,
    this.rounded = false,
    this.small = false,
    this.customColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determinar colores según el tipo
    final badgeColors = _getBadgeColors(context);
    
    // Determinar tamaño de texto e icono
    final double fontSize = small ? 11 : 12;
    final double iconSize = small ? 12 : 14;
    
    // Determinar el radio de borde
    final double borderRadius = rounded 
        ? (small ? 12 : 16) 
        : (small ? 4 : 6);
    
    // Determinar el padding
    final EdgeInsets padding = small
        ? EdgeInsets.symmetric(horizontal: context.spacingXS, vertical: context.spacingXXXS)
        : EdgeInsets.symmetric(horizontal: context.spacingSM, vertical: context.spacingXXS);
    
    // Construir el contenido del badge
    List<Widget> children = [];
    
    // Añadir icono si está presente
    if (icon != null) {
      children.add(Icon(
        icon, 
        size: iconSize,
        color: badgeColors.textColor,
      ));
      children.add(SizedBox(width: context.spacingXXXS));
    }
    
    // Añadir texto
    children.add(Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: badgeColors.textColor,
      ),
    ));
    
    // Construir el widget
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: badgeColors.backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
  
  /// Obtiene los colores adecuados según el tipo de badge
  _BadgeColors _getBadgeColors(BuildContext context) {
    // Si hay un color personalizado, usarlo
    if (customColor != null) {
      final bool isDark = _isColorDark(customColor!);
      return _BadgeColors(
        backgroundColor: customColor!,
        textColor: isDark ? Colors.white : context.textColor,
      );
    }
    
    // Determinar colores según el tipo
    switch (type) {
      case StatusBadgeType.success:
        return _BadgeColors(
          backgroundColor: context.successColor.withOpacity(0.15),
          textColor: context.successColor,
        );
      case StatusBadgeType.warning:
        return _BadgeColors(
          backgroundColor: context.warningColor.withOpacity(0.15),
          textColor: context.warningColor,
        );
      case StatusBadgeType.error:
        return _BadgeColors(
          backgroundColor: context.errorColor.withOpacity(0.15),
          textColor: context.errorColor,
        );
      case StatusBadgeType.neutral:
        return _BadgeColors(
          backgroundColor: context.secondaryTextColor.withOpacity(0.15),
          textColor: context.secondaryTextColor,
        );
      case StatusBadgeType.primary:
        return _BadgeColors(
          backgroundColor: context.primaryColor.withOpacity(0.15),
          textColor: context.primaryColor,
        );
      case StatusBadgeType.accent:
        return _BadgeColors(
          backgroundColor: context.accentColor.withOpacity(0.15),
          textColor: context.accentColor,
        );
      case StatusBadgeType.info:
      default:
        return _BadgeColors(
          backgroundColor: context.infoColor.withOpacity(0.15),
          textColor: context.infoColor,
        );
    }
  }
  
  /// Determina si un color es oscuro para elegir el color de texto adecuado
  bool _isColorDark(Color color) {
    return ThemeData.estimateBrightnessForColor(color) == Brightness.dark;
  }
}

/// Clase auxiliar para manejar los colores del badge
class _BadgeColors {
  final Color backgroundColor;
  final Color textColor;
  
  _BadgeColors({
    required this.backgroundColor,
    required this.textColor,
  });
}

/// Ejemplo de uso:
/// ```dart
/// // Badge básico
/// StatusBadge(
///   text: 'Completado',
///   type: StatusBadgeType.success,
/// )
///
/// // Badge con icono
/// StatusBadge(
///   text: 'Error',
///   type: StatusBadgeType.error,
///   icon: Icons.error_outline,
///   rounded: true,
/// )
///
/// // Badge con color personalizado
/// StatusBadge(
///   text: 'Personalizado',
///   customColor: Colors.purple,
/// )
/// ```
