import 'package:flutter/material.dart';

import '../../theme/app_design_constants.dart';
import '../buttons/enhanced_button.dart';
import '../spacers/app_spacers.dart';

/// Un widget para mostrar mensajes de error de forma estandarizada.
///
/// Este componente muestra un mensaje de error con un icono, título opcional,
/// mensaje descriptivo y un botón para reintentar la operación si es necesario.
class ErrorMessageWidget extends StatelessWidget {
  /// Crea un widget de mensaje de error.
  ///
  /// [message] es el mensaje de error principal a mostrar.
  /// [title] es un título opcional que aparece encima del mensaje.
  /// [icon] es el icono a mostrar (por defecto es Icons.error_outline).
  /// [onRetry] es un callback opcional para reintentar la operación.
  /// [retryText] es el texto del botón de reintento (por defecto "Reintentar").
  const ErrorMessageWidget({
    super.key,
    required this.message,
    this.title,
    this.icon = Icons.error_outline,
    this.onRetry,
    this.retryText = 'Reintentar',
    this.iconSize = 64.0,
    this.padding = const EdgeInsets.all(24.0),
  });

  /// El mensaje principal de error.
  final String message;

  /// Título opcional que aparece sobre el mensaje principal.
  final String? title;

  /// El icono a mostrar.
  final IconData icon;

  /// Tamaño del icono.
  final double iconSize;

  /// Callback opcional para la acción de reintento.
  final VoidCallback? onRetry;

  /// Texto para el botón de reintento.
  final String retryText;

  /// Padding alrededor del widget completo.
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryColor = theme.colorScheme.error;

    return Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: iconSize, color: secondaryColor),
          AppSpacers.lg,
          if (title != null) ...[
            Text(
              title!,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            AppSpacers.xs,
          ],
          Text(
            message,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurface.withAlpha((0.7 * 255).round()),
            ),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            AppSpacers.lg,
            EnhancedButton(
              text: retryText,
              onPressed: onRetry,
              icon: Icons.refresh,
              color: secondaryColor,
              textColor: theme.colorScheme.onError,
              height: AppDesignConstants.buttonHeightStandard,
            ),
          ],
        ],
      ),
    );
  }
}
