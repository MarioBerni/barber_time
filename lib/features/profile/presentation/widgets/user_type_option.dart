import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme_extensions.dart';

/// Widget para mostrar una opción de tipo de usuario en la pantalla de selección
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
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: context.primaryLightColor,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.primaryLightColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: context.primaryColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.h5.copyWith(
                        color: context.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: context.bodySmall,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: context.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
