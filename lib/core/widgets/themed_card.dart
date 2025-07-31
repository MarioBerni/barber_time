import 'package:flutter/material.dart';

import '../theme/app_theme_extensions.dart';

/// Un componente de tarjeta que utiliza el sistema de temas
/// centralizado
///
/// Este widget permite crear tarjetas con apariencia consistente
/// en toda la aplicación
/// y aprovecha las extensiones de contexto para acceder a colores,
/// bordes y sombras.
class ThemedCard extends StatelessWidget {
  /// Contenido principal de la tarjeta
  final Widget child;

  /// Nivel de elevación de la tarjeta (determina la sombra)
  /// Valores: 'none', 'light', 'medium', 'strong', 'elevated'
  final String elevation;

  /// Relleno interno de la tarjeta
  final EdgeInsetsGeometry? padding;

  /// Margen externo de la tarjeta
  final EdgeInsetsGeometry? margin;

  /// Color de fondo de la tarjeta (opcional)
  final Color? backgroundColor;

  /// Si es verdadero, la tarjeta ocupará el ancho máximo disponible
  final bool fullWidth;

  /// Radio de borde personalizado (opcional)
  final BorderRadius? borderRadius;

  /// Función que se ejecuta al presionar la tarjeta (opcional)
  final VoidCallback? onTap;

  /// Constructor para la tarjeta temática.
  ///
  /// Requiere un [child] como contenido y permite personalizar la apariencia
  /// mediante [elevation], [padding], [margin], [borderRadius] y [onTap].
  const ThemedCard({
    super.key,
    required this.child,
    this.elevation = 'medium',
    this.padding,
    this.margin,
    this.backgroundColor,
    this.fullWidth = false,
    this.borderRadius,
    this.onTap,
  });

  /// Construye el widget ThemedCard.
  @override
  Widget build(BuildContext context) {
    // Determinar el radio de borde a utilizar
    final radius = borderRadius ?? context.cardBorderRadius;

    // Determinar el color de fondo
    final bgColor = backgroundColor ?? context.surfaceColor;

    // Determinar las sombras según el nivel de elevación
    final List<BoxShadow> shadows = _getShadows(context);

    // Determinar el padding adecuado
    final cardPadding = padding ?? EdgeInsets.all(context.cardPadding);

    // Contenedor principal con o sin InkWell según tenga onTap
    /// Contenedor principal con o sin InkWell según tenga onTap.
    final Widget cardWidget = Container(
      width: fullWidth ? double.infinity : null,
      margin: margin,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: radius,
        boxShadow: shadows,
      ),
      child: Padding(padding: cardPadding, child: child),
    );

    // Si hay un callback onTap, envolver en InkWell para efecto splash
    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        borderRadius: radius,
        child: InkWell(onTap: onTap, borderRadius: radius, child: cardWidget),
      );
    }

    return cardWidget;
  }

  /// Obtiene la lista de sombras según el nivel de elevación
  List<BoxShadow> _getShadows(BuildContext context) {
    switch (elevation) {
      case 'none':
        return context.noShadow;
      case 'light':
        return context.lightShadow;
      case 'strong':
        return context.strongShadow;
      case 'elevated':
        return context.elevatedShadow;
      case 'medium':
      default:
        return context.mediumShadow;
    }
  }
}

/// Ejemplo de uso:
/// ```dart
/// ThemedCard(
///   elevation: 'medium',
///   padding: EdgeInsets.all(context.spacingMD),
///   margin: EdgeInsets.symmetric(vertical: context.spacingSM),
///   onTap: () => print('Card tapped'),
///   child: Column(
///     crossAxisAlignment: CrossAxisAlignment.start,
///     children: [
///       Text('Título de la tarjeta', style: context.h3),
///       context.verticalSpaceSM,
///       Text('Contenido de la tarjeta', style: context.bodyMedium),
///     ],
///   ),
/// )
/// ```
