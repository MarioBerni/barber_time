import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/theme/app_theme_extensions.dart';

/// Divider elegante con texto "O continúa con..."
class ContinueDivider extends StatelessWidget {
  /// Texto del divider
  final String text;

  /// Constructor
  const ContinueDivider({super.key, this.text = 'O continúa con tu email'});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          // Línea izquierda con gradiente
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppTheme.kPrimaryColor.withAlpha((0.4 * 255).round()),
                    AppTheme.kMediumGold.withAlpha((0.3 * 255).round()),
                  ],
                  stops: const [0.0, 0.7, 1.0],
                ),
              ),
            ),
          ),

          // Contenedor del texto con decoración
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.kCharcoalDark.withAlpha((0.6 * 255).round()),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppTheme.kPrimaryColor.withAlpha((0.2 * 255).round()),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.alternate_email_rounded,
                  color: AppTheme.kPrimaryColor,
                  size: 14,
                ),
                const SizedBox(width: 6),
                Text(
                  text,
                  style: context.bodySmall.copyWith(
                    color: AppTheme.kOffWhite.withAlpha((0.8 * 255).round()),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Línea derecha con gradiente
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.kMediumGold.withAlpha((0.3 * 255).round()),
                    AppTheme.kPrimaryColor.withAlpha((0.4 * 255).round()),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.3, 1.0],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
