import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/icons/animated_icon_widget.dart';

/// Componente que muestra el encabezado de la página de login
/// 
/// Incluye el logo animado, título y subtítulo
class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo animado
        Hero(
          tag: 'logo',
          child: Center(
            child: IconWithShimmer(
              icon: Icons.content_cut,
              size: 110,
              iconColor: Colors.black87,
              backgroundColor: Colors.white.withAlpha((0.95 * 255).round()),
            ),
          ),
        ),
        const SizedBox(height: 24),
        
        // Título principal
        Text(
          'Barber Time',
          textAlign: TextAlign.center,
          style: context.h1.copyWith(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            shadows: [
              Shadow(
                color: Colors.black.withAlpha((0.15 * 255).round()),
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        
        // Subtítulo
        Text(
          'Ingresa tus datos para continuar',
          textAlign: TextAlign.center,
          style: context.bodyMedium.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
