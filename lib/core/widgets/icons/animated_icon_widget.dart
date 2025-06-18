import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/app_theme_extensions.dart';

/// Contenedor circular para iconos con efecto de brillo
class IconWithShimmer extends StatelessWidget {
  /// Icono a mostrar en el contenedor
  final IconData icon;

  /// Tamaño del contenedor (diámetro)
  final double size;

  /// Color de fondo del contenedor
  final Color? backgroundColor;

  /// Color del icono
  final Color? iconColor;

  /// Efecto de brillo (shimmer) periódico
  final bool enableShimmer;

  /// Animación de entrada
  final bool animateEntry;

  /// Constructor
  const IconWithShimmer({
    Key? key,
    required this.icon,
    this.size = 100.0,
    this.backgroundColor,
    this.iconColor,
    this.enableShimmer = true,
    this.animateEntry = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Colores predeterminados si no se proporcionan, usando el tema centralizado
    final effectiveIconColor = iconColor ?? context.accentColor;
    final effectiveBackgroundColor = backgroundColor ?? context.primaryColor;
    
    // Construir contenedor base
    Widget container = Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // TODO: Considerar añadir shadowColor a las extensiones
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Icon(icon, size: size * 0.5, color: effectiveIconColor),
        ),
      ),
    );

    // Aplicar animaciones según configuración
    if (animateEntry) {
      container = container
          .animate()
          .fadeIn(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
          )
          .scale(
            begin: const Offset(0.7, 0.7),
            end: const Offset(1.0, 1.0),
            duration: const Duration(milliseconds: 800),
            curve: Curves.elasticOut,
          );
    }

    // Añadir efecto shimmer si está habilitado
    if (enableShimmer) {
      container = container
          .animate(onPlay: (controller) => controller.repeat())
          .shimmer(
            delay: const Duration(milliseconds: 2000),
            duration: const Duration(milliseconds: 1800),
            color: effectiveIconColor.withOpacity(0.3),
          );
    }

    return container;
  }
}
