import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/theme/app_theme_extensions.dart';

/// Widget para mostrar mensajes de error premium
class ErrorMessage extends StatelessWidget {
  /// Mensaje de error a mostrar
  final String message;

  /// Si debe mostrar animación de entrada
  final bool animate;

  /// Constructor
  const ErrorMessage({super.key, required this.message, this.animate = true});

  @override
  Widget build(BuildContext context) {
    if (message.isEmpty) return const SizedBox.shrink();

    final child = Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.kCharcoalDark.withAlpha((0.8 * 255).round()),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.kErrorColor.withAlpha((0.6 * 255).round()),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.kErrorDarkColor.withAlpha((0.2 * 255).round()),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icono de error
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppTheme.kErrorColor.withAlpha((0.1 * 255).round()),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.error_outline_rounded,
              color: AppTheme.kErrorColor,
              size: 18,
            ),
          ),

          const SizedBox(width: 12),

          // Mensaje de error
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Error en el registro',
                  style: context.bodyMedium.copyWith(
                    color: AppTheme.kOffWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: context.bodySmall.copyWith(
                    color: AppTheme.kErrorLightColor.withAlpha(
                      (0.9 * 255).round(),
                    ),
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if (!animate) return child;

    return AnimatedSlide(
      duration: const Duration(milliseconds: 300),
      offset: const Offset(0, -0.2),
      curve: Curves.easeOutBack,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: 1.0,
        child: child,
      ),
    );
  }
}
