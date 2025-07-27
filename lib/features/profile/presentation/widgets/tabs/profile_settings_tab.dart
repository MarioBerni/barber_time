import 'package:flutter/material.dart';

import '../../../domain/entities/user_profile.dart';
import '../profile_section.dart';

/// Widget para la pestaña de configuraciones del perfil
class ProfileSettingsTab extends StatelessWidget {
  /// Datos del perfil del usuario
  final UserProfile profile;
  
  /// Constructor
  const ProfileSettingsTab({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          ProfileSection(
            title: 'Configuraciones',
            icon: Icons.settings,
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Text('Configuraciones pendiente de implementación'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
