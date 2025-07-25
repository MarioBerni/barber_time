import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_theme_extensions.dart';

/// Widget reutilizable que muestra una fila de información del perfil
class ProfileInfoRow extends StatelessWidget {
  /// Etiqueta descriptiva de la información
  final String label;
  
  /// Valor/información a mostrar
  final String value;
  
  /// Icono asociado a este tipo de información
  final IconData icon;
  
  /// Constructor
  const ProfileInfoRow({
    Key? key,
    required this.label,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 22,
            color: context.primaryColor,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: context.bodySmall.copyWith(
                    color: context.textSecondaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: context.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
