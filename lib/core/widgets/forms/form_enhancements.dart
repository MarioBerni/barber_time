import 'package:flutter/material.dart';

import '../../theme/app_design_constants.dart';
import '../../theme/app_theme.dart';

/// Componente para mejorar la apariencia visual de formularios
/// Proporciona efectos visuales sutiles y consistentes
class FormEnhancements {
  /// Espaciado estándar entre secciones de formulario
  static const double sectionSpacing = AppDesignConstants.spacingLG;

  /// Espaciado entre campos dentro de una sección
  static const double fieldSpacing = AppDesignConstants.spacingMD;

  /// Padding estándar para contenedores de formulario
  static const EdgeInsets containerPadding = AppDesignConstants.paddingLG;

  /// Widget para crear un separador visual entre secciones
  static Widget sectionDivider() {
    return Container(
      height: 1,
      margin: EdgeInsets.symmetric(vertical: AppDesignConstants.spacingMD),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            AppDesignConstants.colorWithOpacity(
              AppTheme.kPrimaryColor,
              AppDesignConstants.opacityLow,
            ),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  /// Widget para crear un indicador de campo requerido
  static Widget requiredIndicator() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDesignConstants.spacingXS,
        vertical: AppDesignConstants.spacingXXS,
      ),
      decoration: BoxDecoration(
        color: AppDesignConstants.colorWithOpacity(
          AppTheme.kPrimaryColor,
          AppDesignConstants.opacityVeryLow,
        ),
        borderRadius: AppDesignConstants.standardBorderRadius,
        border: Border.all(
          color: AppDesignConstants.colorWithOpacity(
            AppTheme.kPrimaryColor,
            AppDesignConstants.opacityLow,
          ),
        ),
      ),
      child: Text(
        'Requerido',
        style: TextStyle(
          color: AppTheme.kPrimaryColor,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Widget para crear un contenedor con efecto de cristal
  static Widget glassContainer({
    required Widget child,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
  }) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.kSurfaceColor.withAlpha(102),
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        border: Border.all(color: AppTheme.kPrimaryColor.withAlpha(26)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.kBackgroundColor.withAlpha(51),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  /// Widget para crear un header de sección mejorado
  static Widget enhancedSectionHeader({
    required String title,
    required IconData icon,
    String? subtitle,
    Color? iconColor,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: (iconColor ?? AppTheme.kPrimaryColor).withAlpha(26),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: iconColor ?? AppTheme.kPrimaryColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppTheme.kOffWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppTheme.kOffWhite.withAlpha(179),
                    fontSize: 12,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  /// Widget para crear un campo de formulario con animación
  static Widget animatedFormField({
    required Widget child,
    required Animation<double> animation,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - animation.value)),
          child: Opacity(opacity: animation.value, child: child),
        );
      },
      child: child,
    );
  }

  /// Widget para crear un contenedor con efecto de hover
  static Widget hoverContainer({
    required Widget child,
    required VoidCallback? onTap,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        child: Container(
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.kSurfaceColor.withAlpha(102),
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            border: Border.all(color: AppTheme.kPrimaryColor.withAlpha(26)),
          ),
          child: child,
        ),
      ),
    );
  }

  /// Widget para crear un indicador de progreso visual
  static Widget progressIndicator({
    required double progress,
    required int totalSteps,
    required int currentStep,
    String? stepText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Paso $currentStep de $totalSteps',
              style: TextStyle(
                color: AppTheme.kOffWhite.withAlpha(179),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            if (stepText != null)
              Text(
                stepText,
                style: TextStyle(
                  color: AppTheme.kPrimaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 4,
          decoration: BoxDecoration(
            color: AppTheme.kSurfaceColor.withAlpha(51),
            borderRadius: BorderRadius.circular(2),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.kPrimaryColor, AppTheme.kPrimaryLightColor],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
