import 'package:flutter/material.dart';

import '../../theme/app_design_constants.dart';
import '../../theme/app_theme.dart';
import '../../theme/app_theme_extensions.dart';

/// Indicador de progreso para formularios
/// Muestra visualmente el avance del usuario en el formulario
class FormProgressIndicator extends StatelessWidget {
  /// Progreso actual (0.0 a 1.0)
  final double progress;

  /// Texto opcional que describe el progreso
  final String? progressText;

  /// Altura del indicador
  final double height;

  /// Constructor
  const FormProgressIndicator({
    super.key,
    required this.progress,
    this.progressText,
    this.height = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Barra de progreso
        Container(
          height: height,
          decoration: BoxDecoration(
            color: AppTheme.kSurfaceColor.withAlpha(51),
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusCircular,
            ),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress.clamp(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.kPrimaryColor, AppTheme.kPrimaryLightColor],
                ),
                borderRadius: BorderRadius.circular(
                  AppDesignConstants.borderRadiusCircular,
                ),
                boxShadow: AppDesignConstants.shadowSubtle,
              ),
            ),
          ),
        ),

        // Texto de progreso (opcional)
        if (progressText != null) ...[
          SizedBox(height: AppDesignConstants.spacingXS),
          Text(
            progressText!,
            style: context.textTheme.bodySmall!.copyWith(
              color: AppTheme.kOffWhite.withAlpha(179),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}
