import 'package:flutter/material.dart';

import '../../theme/app_design_constants.dart';
import '../../theme/app_theme.dart';
import '../../theme/app_theme_extensions.dart';

/// Tarjeta informativa reutilizable
/// Para mostrar mensajes informativos en formularios
class InfoCard extends StatelessWidget {
  /// Mensaje a mostrar
  final String message;

  /// Icono opcional
  final IconData? icon;

  /// Color del icono
  final Color? iconColor;

  /// Color de fondo
  final Color? backgroundColor;

  /// Color del borde
  final Color? borderColor;

  /// Constructor
  const InfoCard({
    super.key,
    required this.message,
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.borderColor,
  });

  /// Constructor para información general
  InfoCard.info({super.key, required this.message, this.icon})
    : iconColor = AppTheme.kPrimaryColor,
      backgroundColor = AppTheme.kPrimaryColor.withAlpha(26),
      borderColor = AppTheme.kPrimaryColor.withAlpha(51);

  /// Constructor para advertencias
  InfoCard.warning({super.key, required this.message, this.icon})
    : iconColor = Colors.orange,
      backgroundColor = Colors.orange.withAlpha(26),
      borderColor = Colors.orange.withAlpha(51);

  /// Constructor para errores
  InfoCard.error({super.key, required this.message, this.icon})
    : iconColor = Colors.red,
      backgroundColor = Colors.red.withAlpha(26),
      borderColor = Colors.red.withAlpha(77);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusMD),
        border: Border.all(color: borderColor!),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: iconColor, size: 20),
            SizedBox(width: AppDesignConstants.spacingXS),
          ],
          Expanded(
            child: Text(
              message,
              style: context.textTheme.bodySmall!.copyWith(
                color: AppTheme.kOffWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
