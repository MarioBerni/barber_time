import 'package:flutter/material.dart';
import '../../../core/theme/app_theme_extensions.dart';

/// Componente reutilizable para iconos con estilo estandarizado.
/// 
/// Proporciona un diseño consistente para los iconos en toda la aplicación,
/// con soporte para fondo circular, badges (indicadores), diferentes tamaños
/// y estados (normal, activo, deshabilitado).
class StyledIcon extends StatelessWidget {
  /// Icono a mostrar
  final IconData icon;
  
  /// Color del icono (si es null, usará colores del tema)
  final Color? iconColor;
  
  /// Color de fondo del círculo (si es null, usará colores del tema)
  final Color? backgroundColor;
  
  /// Si es true, usará el estilo activo (colores destacados)
  final bool isActive;
  
  /// Si es true, aplicará un efecto de brillo al icono
  final bool hasGlowEffect;
  
  /// Tamaño del icono (si es null, usará iconSizeDefault del tema)
  final double? iconSize;
  
  /// Tamaño del contenedor circular (si es null, usará iconContainerSizeDefault del tema)
  final double? circleSize;
  
  /// Si es true, muestra un badge de notificación
  final bool showBadge;
  
  /// Contador para el badge (si es null, muestra un punto rojo)
  final int? badgeCount;
  
  /// Color del badge (si es null, usará errorColor del tema)
  final Color? badgeColor;
  
  /// Callback al presionar el icono
  final VoidCallback? onTap;

  const StyledIcon({
    super.key,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
    this.isActive = false,
    this.hasGlowEffect = false,
    this.iconSize,
    this.circleSize,
    this.showBadge = false,
    this.badgeCount,
    this.badgeColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Definir colores basados en el estado activo y los parámetros
    final effectiveIconColor = iconColor ?? 
        (isActive ? context.accentColor : context.secondaryTextColor);
    
    final effectiveBackgroundColor = backgroundColor ?? 
        (isActive ? context.accentLightColor.withAlpha((0.2 * 255).round()) : context.surfaceColor);
    
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Contenedor circular con icono
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: circleSize ?? context.iconContainerSizeDefault,
            height: circleSize ?? context.iconContainerSizeDefault,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: effectiveBackgroundColor,
              boxShadow: isActive ? context.lightShadow : null,
            ),
            child: _buildIconWithEffect(context, effectiveIconColor),
          ),
        ),
        
        // Badge de notificación (si está habilitado)
        if (showBadge)
          Positioned(
            top: 0,
            right: 0,
            child: _buildBadge(context),
          ),
      ],
    );
  }
  
  /// Construye el icono con o sin efecto de brillo
  Widget _buildIconWithEffect(BuildContext context, Color iconColor) {
    if (!hasGlowEffect) {
      return Icon(
        icon,
        size: iconSize ?? context.iconSizeDefault,
        color: iconColor,
      );
    }
    
    return Stack(
      alignment: Alignment.center,
      children: [
        // Efecto de brillo
        Icon(
          icon,
          size: (iconSize ?? context.iconSizeDefault) + 4,
          color: context.accentLightColor.withAlpha((0.4 * 255).round()),
        ),
        // Icono principal
        Icon(
          icon,
          size: iconSize ?? context.iconSizeDefault,
          color: iconColor,
        ),
      ],
    );
  }
  
  /// Construye el badge de notificación
  Widget _buildBadge(BuildContext context) {
    final effectiveBadgeColor = badgeColor ?? context.errorColor;
    
    // Si no hay contador, mostrar un punto rojo simple
    if (badgeCount == null) {
      return Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: effectiveBadgeColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: context.backgroundColor,
            width: 1.5,
          ),
        ),
      );
    }
    
    // Si hay contador, mostrar el número
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: effectiveBadgeColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: context.backgroundColor,
          width: 1.5,
        ),
      ),
      constraints: const BoxConstraints(
        minWidth: 16,
        minHeight: 16,
      ),
      child: Center(
        child: Text(
          badgeCount! > 99 ? '99+' : badgeCount.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
