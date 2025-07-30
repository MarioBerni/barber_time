import 'package:flutter/material.dart';

import '../../../domain/entities/user_profile.dart';
import '../profile_section.dart';

/// Widget para la pestaña de información de negocio (solo para administradores)
class ProfileBusinessTab extends StatelessWidget {
  /// Datos del perfil del usuario
  final UserProfile profile;

  /// Constructor
  const ProfileBusinessTab({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          ProfileSection(
            title: 'Información del Negocio',
            icon: Icons.store,
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Text(
                  'Información de negocio pendiente de implementación',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
