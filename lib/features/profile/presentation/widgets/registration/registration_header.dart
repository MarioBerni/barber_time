import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/theme/app_theme_extensions.dart';

/// Header premium para formularios de registro
class RegistrationHeader extends StatelessWidget {
  /// Título principal
  final String title;

  /// Subtítulo descriptivo
  final String subtitle;

  /// Icono del header
  final IconData icon;

  /// Constructor
  const RegistrationHeader({
    super.key,
    this.title = 'Crear Tu Cuenta Premium',
    this.subtitle = 'Únete a la experiencia premium de Barber Time',
    this.icon = Icons.content_cut_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icono con contenedor premium
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.kPrimaryColor.withAlpha((0.2 * 255).round()),
                AppTheme.kPrimaryLightColor.withAlpha((0.1 * 255).round()),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppTheme.kPrimaryColor.withAlpha((0.3 * 255).round()),
            ),
          ),
          child: Icon(icon, color: AppTheme.kPrimaryColor, size: 28),
        ),

        const SizedBox(height: 20),

        // Título con gradiente dorado
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              AppTheme.kMediumGold,
              AppTheme.kLightGold,
              AppTheme.kDarkGold,
            ],
            stops: const [0.0, 0.5, 1.0],
          ).createShader(bounds),
          child: Text(
            title,
            style: context.h1.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 28,
              height: 1.2,
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Subtítulo
        Text(
          subtitle,
          style: context.bodyLarge.copyWith(
            color: AppTheme.kOffWhite.withAlpha((0.85 * 255).round()),
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
