import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_theme_extensions.dart';

/// Widget para mostrar una opción de tipo de usuario
/// en la pantalla de selección
class UserTypeOption extends StatelessWidget {
  /// Título de la opción
  final String title;

  /// Descripción de la opción
  final String description;

  /// Icono para la opción
  final IconData icon;

  /// Callback cuando se selecciona esta opción
  final VoidCallback onTap;

  /// Constructor
  const UserTypeOption({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Card(
        elevation: 6,
        shadowColor: AppTheme.kPrimaryColor.withOpacity(0.2),
        color: AppTheme.kSurfaceColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(
            color: AppTheme.kPrimaryColor.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          splashColor: AppTheme.kPrimaryColor.withOpacity(0.15),
          highlightColor: AppTheme.kPrimaryColor.withOpacity(0.08),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.kSurfaceColor,
                  AppTheme.kSurfaceColor.withOpacity(0.95),
                ],
              ),
            ),
            child: Row(
              children: [
                // Icono con gradiente mejorado
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppTheme.kPrimaryColor.withAlpha((0.25 * 255).round()),
                        AppTheme.kPrimaryLightColor.withAlpha(
                          (0.15 * 255).round(),
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.kPrimaryColor.withOpacity(0.25),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(icon, color: AppTheme.kPrimaryColor, size: 32),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título con mejor contraste
                      Text(
                        title,
                        style: context.titleMedium.copyWith(
                          color: AppTheme.kPrimaryColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          letterSpacing: 0.3,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Descripción con mejor legibilidad
                      Text(
                        description,
                        style: context.bodyMedium.copyWith(
                          color: AppTheme.kOffWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          height: 1.4,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),

                // Flecha con mejor contraste
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppTheme.kPrimaryColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppTheme.kPrimaryColor.withOpacity(0.3),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.kPrimaryColor.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: AppTheme.kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
