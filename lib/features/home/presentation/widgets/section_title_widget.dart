import 'package:flutter/material.dart';

import '../../../../core/theme/app_design_constants.dart';
import '../../../../core/theme/app_theme.dart';

/// Widget reutilizable para títulos de sección con estilo moderno
///
/// Incluye soporte para icono premium opcional y botón de acción
class SectionTitleWidget extends StatelessWidget {
  /// Título principal de la sección
  final String title;

  /// Texto del botón de acción
  final String actionText;

  /// Determina si se muestra el icono premium junto al título
  final bool showPremiumIcon;

  /// Acción al presionar el botón de ver todo
  final VoidCallback? onActionPressed;

  /// Constructor
  const SectionTitleWidget({
    super.key,
    required this.title,
    required this.actionText,
    this.showPremiumIcon = false,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                // Icono premium opcional
                if (showPremiumIcon)
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppTheme.kPrimaryColor.withAlpha(
                        (0.15 * 255).round(),
                      ),
                      borderRadius: BorderRadius.circular(
                        AppDesignConstants.borderRadiusSM2,
                      ),
                    ),
                    child: Icon(
                      Icons.star_rounded,
                      color: AppTheme.kPrimaryColor,
                      size: 16,
                    ),
                  ),
                // Título principal con texto grande y negrilla
                Flexible(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          // Botón de acción "Ver todas"
          TextButton(
            onPressed: onActionPressed ?? () {},
            style: TextButton.styleFrom(
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              actionText,
              style: TextStyle(
                color: AppTheme.kMediumGray,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
