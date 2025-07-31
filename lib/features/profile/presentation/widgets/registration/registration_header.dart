import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/theme/app_theme_extensions.dart';
import '../../../../../core/widgets/spacers/app_spacers.dart';

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
    this.title = 'Crear tu cuenta',
    this.subtitle = 'Únete a Barber Time para disfrutar de nuestros servicios',
    this.icon = Icons.content_cut_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título con gradiente turquesa (color primario)
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [
                AppTheme.kPrimaryColor,
                AppTheme.kPrimaryLightColor,
                AppTheme.kPrimaryDarkColor,
              ],
              stops: const [0.0, 0.5, 1.0],
            ).createShader(bounds),
            child: Text(
              title,
              style: context.h1.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 32,
                letterSpacing: 0.5,
                height: 1.2,
              ),
            ),
          ),

          AppSpacers.sm,

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
      ),
    );
  }
}
