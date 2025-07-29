import 'package:flutter/material.dart';

/// Un widget para mostrar estados vacíos de manera estandarizada.
///
/// Este componente muestra una interfaz amigable cuando no hay datos
/// disponibles, como resultados de búsqueda vacíos, listas sin elementos, etc.
class EmptyStateWidget extends StatelessWidget {
  /// Crea un widget de estado vacío.
  ///
  /// [title] es el título principal que describe el estado vacío.
  /// [message] es un mensaje secundario opcional con más detalles.
  /// [icon] es el icono a mostrar (por defecto es Icons.inbox_outlined).
  /// [action] es un widget opcional para una acción primaria (como un botón).
  const EmptyStateWidget({
    super.key,
    required this.title,
    this.message,
    this.icon = Icons.inbox_outlined,
    this.action,
    this.iconSize = 80.0,
    this.padding = const EdgeInsets.all(24.0),
    this.illustration,
  });

  /// Título principal que describe el estado vacío.
  final String title;

  /// Mensaje secundario opcional con más detalles.
  final String? message;

  /// Icono a mostrar.
  final IconData icon;

  /// Tamaño del icono.
  final double iconSize;

  /// Widget de acción opcional (generalmente un botón).
  final Widget? action;

  /// Padding alrededor del widget completo.
  final EdgeInsets padding;

  /// Widget de ilustración personalizado que reemplaza al icono si se proporciona.
  final Widget? illustration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final grayMedium = theme.colorScheme.onSurface.withAlpha((0.6 * 255).round());

    return Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          illustration ??
              Icon(
                icon,
                size: iconSize,
                color: grayMedium,
              ),
          const SizedBox(height: 24),
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          if (message != null) ...[
            const SizedBox(height: 8),
            Text(
              message!,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: grayMedium,
              ),
              textAlign: TextAlign.center,
            ),
          ],
          if (action != null) ...[
            const SizedBox(height: 24),
            action!,
          ],
        ],
      ),
    );
  }
}
