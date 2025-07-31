import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../theme/app_theme_extensions.dart';

/// Sección de formulario con título y descripción
/// Mantiene consistencia visual en todas las secciones
class FormSection extends StatelessWidget {
  /// Título de la sección
  final String title;

  /// Descripción opcional
  final String? description;

  /// Icono de la sección
  final IconData icon;

  /// Contenido de la sección
  final Widget child;

  /// Espaciado después de la sección
  final double bottomSpacing;

  /// Constructor
  const FormSection({
    super.key,
    required this.title,
    this.description,
    required this.icon,
    required this.child,
    this.bottomSpacing = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Encabezado de la sección
        Row(
          children: [
            Icon(icon, color: AppTheme.kPrimaryColor, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: context.textTheme.titleMedium!.copyWith(
                  color: AppTheme.kOffWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

        // Descripción opcional
        if (description != null) ...[
          const SizedBox(height: 8),
          Text(
            description!,
            style: context.textTheme.bodySmall!.copyWith(
              color: AppTheme.kOffWhite.withAlpha((0.7 * 255).round()),
            ),
          ),
        ],

        const SizedBox(height: 16),

        // Contenido de la sección
        child,

        SizedBox(height: bottomSpacing),
      ],
    );
  }
}
